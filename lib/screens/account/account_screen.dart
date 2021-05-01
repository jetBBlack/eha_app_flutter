import 'package:flutter/material.dart';

import 'components/body.dart';

class AccountScreen extends StatelessWidget {
  static String routeName = '/account';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Body(),
    );
  }
}
