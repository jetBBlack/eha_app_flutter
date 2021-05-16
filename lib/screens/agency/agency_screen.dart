import 'package:flutter/material.dart';

import 'components/body.dart';

class AgencyScreen extends StatelessWidget {
  static String routeName = 'agency_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agency'),
      ),
      body: Body(
        
      ),
    );
  }
}
