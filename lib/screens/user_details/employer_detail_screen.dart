import 'package:eha_app/models/employer.dart';
import 'package:flutter/material.dart';
import 'package:eha_app/screens/user_details/components/employer_body.dart';
import '../../components/photo_view.dart';

class EmployerDetailScreen extends StatelessWidget {
  final Employer employer;
  static String routeName = "/employer-detail";
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    minimumSize: Size(120, 40),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );
  EmployerDetailScreen({Key key, this.employer}) : super(key: key);

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
      body: EmployerBody(
        employer: employer,
      ),
      bottomSheet: ElevatedButton(
        style: raisedButtonStyle,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PhotoView(
                        photos: employer.photo,
                      )));
        },
        child: Text(
          'Contact me',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
