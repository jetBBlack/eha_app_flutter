import 'package:flutter/material.dart';
import 'components/body.dart';

class UserDetailScreen extends StatelessWidget {
  static String routeName = "/user-detail";
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    minimumSize: Size(120, 40),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey[800],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.more_horiz,
              color: Colors.grey[800],
            ),
          )
        ],
      ),
      body: Body(),
      persistentFooterButtons: <Widget>[
        ElevatedButton(
            style: raisedButtonStyle,
            onPressed: () {},
            child: Text(
              'Contact me',
              style: TextStyle(fontSize: 18),
            )),
        SizedBox(
          width: 15,
        )
      ],
    );
  }
}
