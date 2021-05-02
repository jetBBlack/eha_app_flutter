import 'package:flutter/material.dart';

import 'components/build_contact.dart';
import 'components/build_info.dart';
import 'components/build_other_info.dart';
import 'components/build_pic.dart';
import 'components/build_settings.dart';
import 'components/build_signature.dart';

class FillBioDataScreen extends StatelessWidget {
  static String routeName = "/fill_biodata";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text('BIODATA'),
          actions: <Widget>[
            TextButton(
                onPressed: () {},
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 17),
                ))
          ],
          bottom: TabBar(
            indicatorColor: Colors.cyan[600],
            labelColor: Colors.cyan[600],
            isScrollable: true,
            tabs: [
              Tab(
                text: "PERSONAL INFO",
              ),
              Tab(
                text: "CONTACT INFO",
              ),
              Tab(
                text: "OTHER INFO",
              ),
              Tab(
                text: "SIGNATURE",
              ),
              Tab(
                text: "PICTURES",
              ),
              Tab(
                text: "SETTINGS",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BuildPersonalInfoPage(),
            BuildContactInfo(),
            BuildOtherInfo(),
            BuildSignature(),
            BuildPictures(),
            BuildSettings(),
          ],
        ),
      ),
    );
  }
}
