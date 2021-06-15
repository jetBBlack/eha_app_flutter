import 'package:eha_app/constant.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class ChatPage extends StatelessWidget {
  static String routeName = "/chat";
  const ChatPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryChatColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Chats',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Body(),
    );
  }
}
