import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:eha_app/providers/employer_mom_provider.dart';
import 'package:eha_app/size_config.dart';
import 'package:eha_app/util/app_url.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
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
    final EmployerMomProvider signProvider =
        Provider.of<EmployerMomProvider>(context, listen: false);
    List<MultipartFile> multipartImageList = [];
    final String data = await storeSignature(context);
    if (data != null) {
      MultipartFile multipartFile = await MultipartFile.fromFile(
        data,
        contentType: MediaType("image", "png"),
      );
      multipartImageList.add(multipartFile);

      FormData formData = new FormData.fromMap({
        "photos": multipartImageList,
      });

      Dio dio = new Dio();
      var response = await dio.post(AppUrl.uploadHelperImage, data: formData);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        for (var item in responseData) {
          Map<String, dynamic> responseItem = item;
          signProvider.setSignature(responseItem['fileName'].toString());
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
                          return new Container(
                            height: 420,
                            width: 370,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                border: Border.all(color: Colors.black)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 80),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(),
                                  Text('verifying...'),
                                ],
                              ),
                            ),
                          );
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
                      onPressed: () {
                        setState(() {
                          _isUploading = false;
                        });
                        _controller.clear();
                      })
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            _isUploading == false
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      "You must click confirm button to comfirm your signature",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      "Your singature is verified",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
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

  Future<String> storeSignature(BuildContext context) async {
    Uint8List signature = await exportSignature();
    String filePath;
    final status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    //final time = DateTime.now().toIso8601String();
    final name = 'signature';
    final result =
        await ImageGallerySaver.saveImage(signature, quality: 100, name: name);
    final isSuccess = result['isSuccess'];
    if (isSuccess) {
      filePath = result["filePath"].toString();
      filePath = filePath.substring(7);
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
