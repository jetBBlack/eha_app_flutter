import 'package:eha_app/models/register_model.dart';
import 'package:eha_app/providers/auth.dart';
import 'package:eha_app/providers/helper_mom_provider.dart';
import 'package:eha_app/providers/helper_provider.dart';
import 'package:eha_app/providers/social_auth.dart';
import 'package:eha_app/routes.dart';
import 'package:eha_app/screens/home/home_screen.dart';
import 'package:eha_app/screens/sign_in/sign_in_screen.dart';
import 'package:eha_app/services_api/service_locator.dart';
import 'package:eha_app/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final register = new RegisterRequestModel();
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
        ChangeNotifierProvider(create: (_) => SocialAuthProvider()),
        ChangeNotifierProvider(create: (_) => HelperProvider()),
        ChangeNotifierProvider(create: (_) => HelperMomProvider())
      ],
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
            FocusManager.instance.primaryFocus.unfocus();
          }
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          initialRoute: '/',
          routes: routes,
          home: FutureBuilder(
            future: checkLogin(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return HomeScreen();
              } else {
                return SignInScreen();
              }
            },
          ),
        ),
      ),
    );
  }
}
