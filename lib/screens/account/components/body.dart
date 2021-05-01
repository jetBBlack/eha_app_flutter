import 'package:eha_app/providers/social_auth.dart';
import 'package:eha_app/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FloatingActionButton(
        child: Text('Logout'),
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.remove('email');
          Navigator.pushNamed(context, SignUpScreen.routeName);
        },
      ),
    );
  }
}
