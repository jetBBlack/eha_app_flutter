import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum LoginProvider {
  GOOOLE,
  FACEBOOK,
  TWITTER,
}

class SocialAuthProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
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

  Future<void> logout() async {
    final facebookLogin = FacebookLogin();
    await facebookLogin.logOut();
    final twitterLogin = new TwitterLogin(
      consumerKey: 'nBrFIZmla7pPEyiwcT3poU8ph',
      consumerSecret: 'lSY6AEDhSff4sueXHItVnIwjp43Yv9Y7LlT3rwP3f07U4RTEfP',
    );
    await twitterLogin.logOut();
    await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
    isLoggedIn = false;
  }

  Future loginFacebook() async {
    isSigningIn = true;
    var facebookLogin = new FacebookLogin();
    facebookLogin.loginBehavior = FacebookLoginBehavior.nativeWithFallback;
    final result = await facebookLogin
        .logInWithReadPermissions(['email', 'public_profile']);
    debugPrint(result.status.toString());

    switch (result.status) {
      case FacebookLoginStatus.cancelledByUser:
        isSigningIn = false;
        break;
      case FacebookLoginStatus.error:
        print('error');
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

  Future loginTwitter() async {
    isSigningIn = true;

    var twitterLogin = new TwitterLogin(
      consumerKey: 'nBrFIZmla7pPEyiwcT3poU8ph',
      consumerSecret: 'lSY6AEDhSff4sueXHItVnIwjp43Yv9Y7LlT3rwP3f07U4RTEfP',
    );

    final TwitterLoginResult result = await twitterLogin.authorize();
    switch (result.status) {
      case TwitterLoginStatus.loggedIn:
        var session = result.session;
        final accessToken = session.token;
        AuthCredential credential = TwitterAuthProvider.credential(
          accessToken: accessToken,
          secret: session.secret,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        isSigningIn = false;
        break;
      case TwitterLoginStatus.cancelledByUser:
        isSigningIn = false;
        break;
      case TwitterLoginStatus.error:
        isSigningIn = false;
        break;
    }
  }
}
