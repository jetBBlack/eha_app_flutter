import 'package:flutter/material.dart';

import 'component/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = '/forgot_pass';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot password'),
      ),
      body: Body(),
    );
  }
}
