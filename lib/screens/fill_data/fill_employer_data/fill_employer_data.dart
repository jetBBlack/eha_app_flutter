import 'package:eha_app/components/custom_bottom_navbar.dart';
import 'package:eha_app/enums.dart';
import 'package:flutter/material.dart';

import 'components/build_code.dart';
import 'components/build_info.dart';
import 'components/build_pic.dart';
import 'components/build_signature.dart';

class FillEmployerDataScreen extends StatelessWidget {
  static String routeName = "/fill_employer_data";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('MOM'),
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
        bottomNavigationBar: CustomBottomNavBar(
          selectedMenu: MenuState.mom,
        ),
      ),
    );
  }
}
