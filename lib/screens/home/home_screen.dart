import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:eha_app/enums.dart';
import 'package:eha_app/components/custom_bottom_navbar.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
