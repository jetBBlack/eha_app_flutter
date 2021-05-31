import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:eha_app/size_config.dart';
import 'package:eha_app/util/app_url.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:signature/signature.dart';

class BuildSignaturePage extends StatefulWidget {
  @override
  _BuildSignaturePageState createState() => _BuildSignaturePageState();
}

class _BuildSignaturePageState extends State<BuildSignaturePage> {
  SignatureController _controller;
  bool _isUploading = false;
  @override
  void initState() {
    super.initState();
    _controller =
        SignatureController(penColor: Colors.black, penStrokeWidth: 5);
  }

  Future uploadImage() async {
    List<MultipartFile> multipartImageList = [];
    final Uint8List data = await exportSignature();
    if (data != null) {
      print('co data');
      MultipartFile multipartFile = new MultipartFile.fromBytes(
        data,
        filename: 'signature',
        contentType: MediaType("image", "png"),
      );
      multipartImageList.add(multipartFile);

      FormData formData = new FormData.fromMap({
        "photos": multipartImageList,
      });

      Dio dio = new Dio();
      var response = await dio.post(AppUrl.uploadHelperImage, data: formData);

      if (response.statusCode == 200) {
        print('singature is verified');
        final List<dynamic> responseData = response.data;
        for (var item in responseData) {
          Map<String, dynamic> responseItem = item;
          print(responseItem['fileName'].toString());
        }
      } else {
        print(response.data);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
            _isUploading == false
                ? buildSignaturePad(context)
                : FutureBuilder(
                    future: uploadImage(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return new CircularProgressIndicator();
                        default:
                          if (snapshot.hasError) {
                            return new Text('${snapshot.error}');
                          } else {
                            return buildSignaturePad(context);
                          }
                      }
                    },
                  ),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                    onPressed: () async {
                      if (_controller.isNotEmpty) {
                        setState(() {
                          _isUploading = true;
                        });
                      }
                    },
                  ),
                  IconButton(
                      icon: Icon(
                        CupertinoIcons.clear_thick,
                        color: Colors.red,
                      ),
                      onPressed: () => _controller.clear())
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                  "You must click confirm button to comfirm your signature"),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSignaturePad(BuildContext context) {
    return Container(
      height: 420,
      width: 370,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(color: Colors.black)),
      child: Signature(
        controller: _controller,
        backgroundColor: Colors.white,
        height: 400,
        width: 350,
      ),
    );
  }

  Future<String> storeSignature(
      BuildContext context, Uint8List signature) async {
    String filePath;
    final status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    final time = DateTime.now().toIso8601String().replaceAll('.', ':');
    final name = 'signature_$time.png';
    final result =
        await ImageGallerySaver.saveImage(signature, quality: 100, name: name);
    final isSuccess = result['isSuccess'];
    if (isSuccess) {
      filePath = result["filePath"];
      print(filePath);
    }
    return filePath;
  }

  Future<Uint8List> exportSignature() async {
    final exportController = SignatureController(
        penStrokeWidth: 5,
        penColor: Colors.black,
        exportBackgroundColor: Colors.white,
        points: _controller.points);

    final signature = await exportController.toPngBytes();
    exportController.dispose();
    return signature;
  }
}
