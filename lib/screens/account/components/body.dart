import 'package:eha_app/providers/social_auth.dart';
import 'package:eha_app/screens/account/components/profile_pic.dart';
import 'package:eha_app/screens/account/favorite_me_screen.dart';
import 'package:eha_app/screens/sign_in/sign_in_screen.dart';
import 'package:eha_app/screens/user_details/helper_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'menu.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePic(),
        SizedBox(
          height: 20,
        ),
        AccountMenu(
          icon: 'assets/icons/User Icon.svg',
          text: 'My Profile',
          press: () {
            Navigator.pushNamed(context, UserDetailScreen.routeName);
          },
        ),
        AccountMenu(
          icon: 'assets/icons/subscription.svg',
          text: 'My Subscriptions',
          press: () {},
        ),
        AccountMenu(
          icon: 'assets/icons/heart add.svg',
          text: 'My Favorite',
          press: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FavoriteScreen()));
          },
        ),
        AccountMenu(
          icon: 'assets/icons/heart.svg',
          text: 'Who Favorite Me',
          press: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FavoriteScreen()));
          },
        ),
        AccountMenu(
          icon: 'assets/icons/share_profile.svg',
          text: 'Share EHA',
          press: () {},
        ),
        AccountMenu(
          icon: 'assets/icons/exit.svg',
          text: 'Log out',
          press: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove('email');
            final provider =
                Provider.of<SocialAuthProvider>(context, listen: false);
            provider.logout();
            Navigator.pushNamed(context, SignInScreen.routeName);
          },
        ),
      ],
    );
  }
}
