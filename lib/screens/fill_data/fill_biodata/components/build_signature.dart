import 'package:eha_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class BuildSignature extends StatefulWidget {
  @override
  _BuildSignatureState createState() => _BuildSignatureState();
}

class _BuildSignatureState extends State<BuildSignature>
    with AutomaticKeepAliveClientMixin {
  SignatureController controller;

  @override
  void initState() {
    super.initState();
    controller = SignatureController(penColor: Colors.black, penStrokeWidth: 5);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                controller: controller,
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
          CupertinoIcons.clear_thick,
          color: Colors.red,
        ),
        onPressed: () => controller.clear());
  }

  @override
  bool get wantKeepAlive => true;
}
