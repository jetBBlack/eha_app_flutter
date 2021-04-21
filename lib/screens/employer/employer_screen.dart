import 'package:flutter/material.dart';
import 'package:eha_app/screens/employer/components/body.dart';
import '../../size_config.dart';

class EmployerScreen extends StatelessWidget {
  static String routeName = "/employer";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Body(),
    );
  }
}
