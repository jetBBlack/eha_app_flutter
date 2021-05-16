import 'package:eha_app/providers/helper_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/build_contact.dart';
import 'components/build_info.dart';
import 'components/build_other_info.dart';
import 'components/build_pic.dart';
import 'components/build_settings.dart';
import 'components/build_signature.dart';

class FillBioDataScreen extends StatefulWidget {
  const FillBioDataScreen({Key key}) : super(key: key);
  static String routeName = "/fill_biodata";

  @override
  _FillBioDataScreenState createState() => _FillBioDataScreenState();
}

class _FillBioDataScreenState extends State<FillBioDataScreen> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    HelperProvider provider = Provider.of<HelperProvider>(context);
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text('BIODATA'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                provider.createHelperWithData();
              },
              child: Text(
                'Create',
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(
              width: 5,
            )
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
