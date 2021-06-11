import 'package:eha_app/screens/fill_employer_data/fill_mom/components/build_code.dart';
import 'package:eha_app/screens/fill_employer_data/fill_mom/components/build_income_info.dart';
import 'package:eha_app/screens/fill_employer_data/fill_mom/components/build_work_permit.dart';
import 'package:eha_app/screens/fill_employer_data/fill_mom/components/build_pictures.dart';
import 'package:eha_app/screens/fill_employer_data/fill_mom/components/build_signature.dart';
import 'package:flutter/material.dart';

import 'components/build_personal_info.dart';

class FillEmployerMomScreen extends StatelessWidget {
  static String routeName = "/fill-employer-mom";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text('MOM'),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Create',
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(
              width: 8,
            ),
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
                text: "INCOME INFO",
              ),
              Tab(
                text: "WORK PERMIT RECEIVERS",
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
        body: TabBarView(children: [
          BuildPersonalInfo(),
          BuildInComeInfo(),
          BuildWorkPermit(),
          BuildPictures(),
          BuildSignaturePage(),
          BuildCodePage(),
        ]),
      ),
    );
  }
}
