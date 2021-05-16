import 'package:flutter/material.dart';

import 'components/body.dart';

class HelperScreen extends StatelessWidget {
  static String routeName = '/helper_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Body(),
    );
  }
}
