import 'package:eha_app/providers/helper_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/build_info.dart';
import 'components/build_other_info.dart';
import 'components/build_pic.dart';
import 'components/build_settings.dart';
import 'components/work_history.dart';

class FillBioDataScreen extends StatefulWidget {
  const FillBioDataScreen({Key key}) : super(key: key);
  static String routeName = "/fill_biodata";

  @override
  _FillBioDataScreenState createState() => _FillBioDataScreenState();
}

class _FillBioDataScreenState extends State<FillBioDataScreen> {
  PageController pageController = PageController(initialPage: 0);
  // var initProvider;

  // @override
  // void initState() {
  //   super.initState();
  //   initProvider = Provider.of<HelperProvider>(context, listen: false);
  //   initMethod();
  // }

  // void initMethod() async {
  //   await initProvider.initHelper();
  // }

  @override
  Widget build(BuildContext context) {
    final HelperProvider provider =
        Provider.of<HelperProvider>(context, listen: false);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('BIODATA'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                await provider.createHelperWithData(context);
                Navigator.pop(context);
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
                text: "WORK HISTORY",
              ),
              Tab(
                text: "OTHER INFO",
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
            BuildEmploymentHistory(),
            BuildOtherInfo(),
            BuildPictures(),
            BuildSettings(),
          ],
        ),
      ),
    );
  }
}
