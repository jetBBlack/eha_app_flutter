import 'package:eha_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'components/build_code.dart';
import 'components/build_info.dart';
import 'components/build_pic.dart';
import 'components/build_signature.dart';

class FillMoMDataScreen extends StatelessWidget {
  static String routeName = "/fill_employer_data";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('MOM'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
              child: Text(
                'Create',
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(
              width: 8,
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
                text: "PICTURES",
              ),
              Tab(
                text: "SIGNATURE",
              ),
              Tab(
                text: "CODE",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BuildPersonalInfoPage(),
            BuildPicturesPage(),
            BuildSignaturePage(),
            BuildCodePage(),
          ],
        ),
      ),
    );
  }
}
