import 'package:eha_app/providers/social_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        onPressed: () {
          final provider = Provider.of<SocialAuthProvider>(context);
          provider.logoutGoogle();
        },
      ),
    );
  }
}
