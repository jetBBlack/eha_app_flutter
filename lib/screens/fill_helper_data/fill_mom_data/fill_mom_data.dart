import 'package:eha_app/providers/helper_mom_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/build_code.dart';
import 'components/build_info.dart';
import 'components/build_pic.dart';
import 'components/build_signature.dart';

class FillMoMDataScreen extends StatefulWidget {
  static String routeName = "/fill_employer_data";

  @override
  _FillMoMDataScreenState createState() => _FillMoMDataScreenState();
}

class _FillMoMDataScreenState extends State<FillMoMDataScreen> {
  String helperMomId;
  @override
  void initState() {
    super.initState();
    getId();
  }

  void getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    helperMomId = prefs.getString('helperMom-id');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('MOM'),
          actions: [
            TextButton(
              onPressed: () async {
                final createProvider =
                    Provider.of<HelperMomProvider>(context, listen: false);
                if (helperMomId == null) {
                  await createProvider
                      .createHelperWithData(context)
                      .then((value) => Navigator.pop(context));
                } else {
                  await createProvider
                      .updateHelperWithData(context)
                      .then((value) => Navigator.pop(context));
                }
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
