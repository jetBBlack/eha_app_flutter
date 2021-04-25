import 'package:flutter/material.dart';

import 'components/phone_sign_up.dart';

class PhoneSignUpScreen extends StatelessWidget {
  static String routeName = "/phone_sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PhoneSignUp(),
    );
  }
}
