import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class BuildSignaturePage extends StatefulWidget {
  @override
  _BuildSignaturePageState createState() => _BuildSignaturePageState();
}

class _BuildSignaturePageState extends State<BuildSignaturePage> {
  SignatureController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = SignatureController(penColor: Colors.white, penStrokeWidth: 6);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenWidth(30),
          ),
          Container(
            height: 420,
            width: 370,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.black),
            child: Signature(
              controller: controller,
              backgroundColor: Colors.black,
              height: 400,
              width: 350,
            ),
          ),
          buildBottom(context),
        ],
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

  Widget buildClear(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.check,
          color: Colors.green,
        ),
        onPressed: () {});
  }

  Widget buildCheck(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.clear,
          color: Colors.red,
        ),
        onPressed: () => controller.clear());
  }
}
