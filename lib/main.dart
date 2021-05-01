import 'package:eha_app/providers/auth.dart';
import 'package:eha_app/providers/social_auth.dart';

import 'package:eha_app/routes.dart';
import 'package:eha_app/screens/home/home_screen.dart';

import 'package:eha_app/screens/sign_in/sign_in_screen.dart';
import 'package:eha_app/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Future<String> checkLogin() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var email = prefs.getString('email');
      print(email);
      return email;
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => SocialAuthProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        initialRoute: '/',
        routes: routes,
        home: checkLogin() == null ? SignInScreen() : HomeScreen(),
      ),
    );
  }
}
