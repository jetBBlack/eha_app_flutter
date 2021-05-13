import 'package:eha_app/screens/account/account_screen.dart';
import 'package:flutter/material.dart';

class LoginSuccess extends StatefulWidget {
  @override
  _LoginSuccessState createState() => _LoginSuccessState();
}

class _LoginSuccessState extends State<LoginSuccess> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _login(),
      builder: (context, snapshot) {
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Future<String> _login() async {
    await Future.delayed(Duration(seconds: 1)).then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return AccountScreen();
          },
        ),
      );
    });

    return "LoggedIn";
  }
}
