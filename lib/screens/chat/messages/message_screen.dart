import 'package:eha_app/screens/chat/messages/message_body.dart';
import 'package:flutter/material.dart';
import '../../../constant.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryChatColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: false,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/user_chat.png'),
            ),
            SizedBox(
              width: 20.0 * 0.75,
            ),
            Column(
              children: [
                Text(
                  "Albert Flores",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  "Active 5m ago",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
      body: MessageBody(),
    );
  }
}
