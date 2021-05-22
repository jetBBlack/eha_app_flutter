import 'package:flutter/material.dart';

import 'components/body.dart';

class AgencyScreen extends StatelessWidget {
  static String routeName = 'agency_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       icon: Icon(Icons.arrow_back_ios),
      //       onPressed: () {
      //         Navigator.pop(context);
      //       }),
      // ),
      body: Body(),
    );
  }
}
