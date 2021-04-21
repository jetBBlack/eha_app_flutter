import 'package:flutter/material.dart';

import 'components/body_1.dart';

class CompleteProfileScreen1 extends StatelessWidget {
  static String routeName = "/complete_profile_1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Body1(),
    );
  }
}
