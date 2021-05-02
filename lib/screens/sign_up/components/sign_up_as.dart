import 'package:eha_app/components/default_button.dart';
import 'package:eha_app/screens/sign_up/phone_sign_up_screen.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:eha_app/util/shared_preference.dart';

import '../../../constant.dart';

class SignUpAsScreen extends StatefulWidget {
  @override
  _SignUpAsScreenState createState() => _SignUpAsScreenState();
}

class _SignUpAsScreenState extends State<SignUpAsScreen> {
  String registerType = 'employer';
  bool _checkedE = true;
  bool _checkedH = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.04,
            ),
            Text(
              'Register Account',
              style: headingStyle,
            ),
            Text(
              "Register as",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kSecondaryColor,
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(20)),
            CheckboxListTile(
              value: _checkedE,
              title: Text(
                "As Employer",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              controlAffinity: ListTileControlAffinity.platform,
              onChanged: (bool value) {
                setState(() {
                  if (value == true) {
                    _checkedE = value;
                    _checkedH = false;
                  } else {
                    _checkedE = value;
                  }
                });
              },
              activeColor: Colors.white,
              checkColor: kPrimaryColor,
            ),
            CheckboxListTile(
              value: _checkedH,
              title: Text(
                "As Helper",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              controlAffinity: ListTileControlAffinity.platform,
              onChanged: (bool value) {
                setState(
                  () {
                    if (value == true) {
                      _checkedE = false;
                      _checkedH = value;
                    } else {
                      _checkedH = value;
                    }
                  },
                );
              },
              activeColor: Colors.white,
              checkColor: kPrimaryColor,
            ),
            SizedBox(
              height: getProportionateScreenWidth(35),
            ),
            DefaultButton(
              text: "Continue",
              press: () async {
                if (_checkedE == true) {
                  UserTypePreferences().saveType('employer');
                } else {
                  UserTypePreferences().saveType('helper');
                }
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PhoneSignUpScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
