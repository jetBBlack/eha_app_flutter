import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:eha_app/size_config.dart';
import 'package:eha_app/util/app_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:http_parser/http_parser.dart';

class BuildSignaturePage extends StatefulWidget {
  @override
  _BuildSignaturePageState createState() => _BuildSignaturePageState();
}

class _BuildSignaturePageState extends State<BuildSignaturePage> {
  SignatureController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        SignatureController(penColor: Colors.black, penStrokeWidth: 5);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future uploadImage(Uint8List signature) async {
    List<MultipartFile> multipartImageList = [];
    if (signature != null) {
      MultipartFile multipartFile = new MultipartFile.fromBytes(
        signature,
        contentType: MediaType('image', 'jpg'),
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
          print(responseItem['fileName']);
        }
      }
    }
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
            Container(
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
            ),
            buildBottom(context),
          ],
        ),
      ),
    );
  }

  Widget buildBottom(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildCheck(context),
          buildClear(context),
        ],
      ),
    );
  }

  Widget buildCheck(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.check,
          color: Colors.green,
        ),
        onPressed: () async {
          if (_controller.isNotEmpty) {
            final Uint8List data = await _controller.toPngBytes();
            uploadImage(data);
          }
        });
  }

  Widget buildClear(BuildContext context) {
    return IconButton(
        icon: Icon(
          CupertinoIcons.clear_thick,
          color: Colors.red,
        ),
        onPressed: () => _controller.clear());
  }
}
