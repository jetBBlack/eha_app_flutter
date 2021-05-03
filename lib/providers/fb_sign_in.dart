import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookSignInProvider extends ChangeNotifier {
  final fbSignIn = FacebookLogin();
  bool _isSigningIn;

  FacebookSignInProvider() {
    _isSigningIn = false;
  }
  bool get isSigningIn => _isSigningIn;

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  Future login() async {
    isSigningIn = true;
    final result = await fbSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.cancelledByUser:
        isSigningIn = false;
        break;
      case FacebookLoginStatus.error:
        isSigningIn = false;
        break;
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        AuthCredential credential = FacebookAuthProvider.credential(
          accessToken.token,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
        isSigningIn = false;
        break;
    }
  }

  // Future handleLoginResult(FacebookLoginResult result) async {
  //   final FacebookAccessToken accessToken = result.accessToken;
  //   AuthCredential credential = FacebookAuthProvider.credential(
  //     accessToken.token,
  //   );

  //   await FirebaseAuth.instance.signInWithCredential(credential);
  //   isSigningIn = false;
  // }
}
