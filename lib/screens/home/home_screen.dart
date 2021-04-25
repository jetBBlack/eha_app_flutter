import 'package:flutter/material.dart';
import 'package:eha_app/components/app_drawer.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF5CEB8),
      ),
      backgroundColor: Color(0xFFF8F8F8),
      body: Body(),
      drawer: AppDrawer(),
    );
  }
}
