import 'package:eha_app/providers/social_auth.dart';
import 'package:eha_app/screens/account/account_screen.dart';
import 'package:eha_app/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/signin";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final provider = Provider.of<SocialAuthProvider>(context);
          if (provider.isSigningIn) {
            return buildLoading();
          } else if (snapshot.hasData) {
            return AccountScreen();
          } else {
            return Body();
          }
        },
      ),
    );
  }

  Widget buildLoading() => Center(child: CircularProgressIndicator());
}
