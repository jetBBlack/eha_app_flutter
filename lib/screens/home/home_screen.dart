import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:eha_app/components/app_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF5CEB8),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              FontAwesomeIcons.bars,
              color: Colors.black87,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      backgroundColor: Color(0xFFF8F8F8),
      body: Body(),
      drawer: AppDrawer(),
    );
  }
}
