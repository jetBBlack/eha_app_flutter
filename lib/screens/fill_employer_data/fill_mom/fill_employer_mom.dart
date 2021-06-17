import 'package:eha_app/providers/employer_mom_provider.dart';
import 'package:eha_app/screens/fill_employer_data/fill_mom/components/build_code.dart';
import 'package:eha_app/screens/fill_employer_data/fill_mom/components/build_income_info.dart';
import 'package:eha_app/screens/fill_employer_data/fill_mom/components/build_work_permit.dart';
import 'package:eha_app/screens/fill_employer_data/fill_mom/components/build_pictures.dart';
import 'package:eha_app/screens/fill_employer_data/fill_mom/components/build_signature.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/build_personal_info.dart';

class FillEmployerMomScreen extends StatefulWidget {
  static String routeName = "/fill-employer-mom";

  @override
  _FillEmployerMomScreenState createState() => _FillEmployerMomScreenState();
}

class _FillEmployerMomScreenState extends State<FillEmployerMomScreen> {
  String id;
  void getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString('employerMom-id');
  }

  @override
  void initState() {
    super.initState();
    getId();
  }

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<EmployerMomProvider>(context, listen: false);
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text('MOM'),
          actions: [
            TextButton(
              onPressed: () async {
                if (id == null) {
                  await myProvider
                      .createEmployerMomWithData(context)
                      .then((value) => Navigator.pop(context));
                } else {
                  await myProvider.updateEmployer(context);
                }
              },
              child: Text(
                'Save',
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
