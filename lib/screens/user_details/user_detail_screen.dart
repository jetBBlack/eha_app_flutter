import 'package:eha_app/models/helper.dart';
import 'package:eha_app/screens/user_details/components/photo_view.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class UserDetailScreen extends StatelessWidget {
  final HelperModel helper;
  static String routeName = "/user-detail";
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    minimumSize: Size(120, 40),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  UserDetailScreen({Key key, this.helper}) : super(key: key);
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
      body: UserDetailInherited(
        helperModel: helper,
        child: Body(),
      ),
      persistentFooterButtons: <Widget>[
        ElevatedButton(
            style: raisedButtonStyle,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PhotoView(
                            photos: helper.photo,
                          )));
            },
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

class UserDetailInherited extends InheritedWidget {
  UserDetailInherited({Widget child, this.helperModel}) : super(child: child);
  final HelperModel helperModel;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static UserDetailInherited of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserDetailInherited>();
  }
}
