import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum LoginProvider {
  GOOOLE,
  FACEBOOK,
  TWITTER,
}

class SocialAuthProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  final facebookSignIn = FacebookLogin();
  bool _isSigningIn;
  bool _isLoggedIn;

  SocialAuthProvider() {
    _isLoggedIn = false;
    _isSigningIn = false;
  }

  bool get isLoggedIn => _isLoggedIn;
  bool get isSigningIn => _isSigningIn;

  set isLoggedIn(bool isLoggedIn) {
    isLoggedIn = isLoggedIn;
    notifyListeners();
  }

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  // void login(LoginProvider loginProvider) async {
  //   switch (loginProvider) {
  //     case LoginProvider.GOOOLE:
  //       return loginGoogle();
  //     case LoginProvider.FACEBOOK:
  //       return loginFacebook();
  //     case LoginProvider.TWITTER:
  //       return loginGoogle();
  //   }
  // }

  Future loginGoogle() async {
    isSigningIn = true;

    final user = await googleSignIn.signIn();
    if (user == null) {
      isSigningIn = false;
      return;
    } else {
      final googleAuth = await user.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      isSigningIn = false;
      isLoggedIn = true;
    }
  }

  void logoutGoogle() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    isLoggedIn = false;
  }

  Future loginFacebook() async {
    isSigningIn = true;
    final result = await facebookSignIn.logIn(['email']);

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

  void logOutFacebook() async {
    await facebookSignIn.logOut();
    FirebaseAuth.instance.signOut();
    isLoggedIn = false;
  }
}
