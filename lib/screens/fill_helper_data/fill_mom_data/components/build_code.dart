import 'package:eha_app/constant.dart';
import 'package:eha_app/providers/helper_mom_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../size_config.dart';

class BuildCodePage extends StatefulWidget {
  @override
  _BuildCodePageState createState() => _BuildCodePageState();
}

class _BuildCodePageState extends State<BuildCodePage> {
  TextEditingController _codeCtl = TextEditingController();
  @override
  void initState() {
    final codeProvider = Provider.of<HelperMomProvider>(context, listen: false);
    super.initState();
    _codeCtl = TextEditingController(text: codeProvider.code);
  }

  @override
  Widget build(BuildContext context) {
    final codeProvider = Provider.of<HelperMomProvider>(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(18)),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/code.svg',
                  height: 18,
                  width: 18,
                  color: Colors.cyan,
                ),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                Text(
                  "CODE",
                  style: TextStyle(color: Colors.cyan),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: 70,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: SizeConfig.screenWidth * 0.9,
                    height: 65,
                    decoration: BoxDecoration(
                      border: Border.all(color: kTextColor),
                      borderRadius: BorderRadius.circular(
                        getProportionateScreenWidth(25),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    child: Text(
                      "H736980570",
                      style: TextStyle(fontSize: 16),
                    ),
                    width: SizeConfig.screenWidth * 0.9,
                    height: 50,
                  ),
                ),
                Positioned(
                  left: 33,
                  bottom: 52,
                  child: Container(color: Colors.white, child: Text("CODE")),
                )
              ],
            ),
            Form(
              child: TextFormField(
                controller: _codeCtl,
                onChanged: codeProvider.setcode,
                decoration: InputDecoration(
                  labelText: "Code",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _codeCtl.dispose();
    super.dispose();
  }
}
