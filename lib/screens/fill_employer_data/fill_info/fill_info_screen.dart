import 'package:eha_app/providers/employer_provider.dart';
import 'package:eha_app/screens/fill_employer_data/fill_info/components/build_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/build_expectation.dart';
import 'components/build_photos.dart';
import 'components/build_setting.dart';

class FillEmployerInfoScreen extends StatefulWidget {
  static String routeName = '/fill_info';
  @override
  _FillEmployerInfoScreenState createState() => _FillEmployerInfoScreenState();
}

class _FillEmployerInfoScreenState extends State<FillEmployerInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<EmployerProvider>(context, listen: false);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('INFO'),
          actions: [
            TextButton(
              onPressed: () async {
                await myProvider
                    .createEmployerWithData(context)
                    .then((value) => Navigator.pop(context));
              },
              child: Text(
                'Save',
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
                  text: "EXPECTATION",
                ),
                Tab(
                  text: "PHOTOS",
                ),
                Tab(
                  text: "SETTING",
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            BuildEmployerPersonalInfo(),
            BuildExpectation(),
            BuildPhotos(),
            BuildSetting(),
          ],
        ),
      ),
    );
  }
}
