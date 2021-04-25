import 'package:flutter/material.dart';

import 'components/sign_up_as.dart';

class AskScreen extends StatelessWidget {
  static String routeName = "/ask_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SignUpAsScreen(),
    );
  }
}
