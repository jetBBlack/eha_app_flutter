import 'package:eha_app/routes.dart';
import 'package:eha_app/screens/sign_in/sign_in_screen.dart';
import 'package:eha_app/theme.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: '/',
      routes: routes,
      home: SignInScreen(),
    );
  }
}
