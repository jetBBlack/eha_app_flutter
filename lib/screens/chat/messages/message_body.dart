import 'package:eha_app/constant.dart';
import 'package:flutter/material.dart';

class MessageBody extends StatelessWidget {
  const MessageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0 / 2,
          ),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 32,
              color: Color(0xFF087949).withOpacity(0.08),
            )
          ]),
          child: SafeArea(
            child: Row(
              children: [
                // Icon(Icons.mic, color: kPrimaryChatColor),
                // SizedBox(width: 20.0),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0 * 0.75),
                    decoration: BoxDecoration(
                      color: kPrimaryChatColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.sentiment_satisfied_alt_outlined,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .color
                                  .withOpacity(0.64),
                            ),
                            onPressed: () {}),
                        SizedBox(width: 20.0 / 5),
                        Expanded(
                          child: TextField(
                            maxLines: null,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                              hintText: "Type message",
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.attach_file,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .color
                                .withOpacity(0.64),
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .color
                                .withOpacity(0.64),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Icon(Icons.send, color: kPrimaryChatColor),
              ],
            ),
          ),
        )
      ],
    );
  }
}
