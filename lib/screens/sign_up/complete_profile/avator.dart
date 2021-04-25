import 'package:eha_app/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:eha_app/providers/auth.dart';

class AvatorScreen extends StatelessWidget {
  static String routeName = '/avator';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);
    return Column(
      children: [
        Text('Choose a picture'),
        SizedBox(
          height: 20,
        ),
        Center(
          child: SizedBox(
            height: 120,
            width: 120,
            child: Stack(
              fit: StackFit.expand,
              overflow: Overflow.visible,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avator.jpg'),
                ),
                Positioned(
                  right: -12,
                  bottom: 0,
                  child: SizedBox(
                    height: 46,
                    width: 46,
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.white)),
                      color: Color(0xFFF5F6F9),
                      onPressed: () {},
                      child: SvgPicture.asset("assets\icons\Camera Icon.svg"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        DefaultButton(
          text: "Finish",
          press: () {},
        )
      ],
    );
  }
}
