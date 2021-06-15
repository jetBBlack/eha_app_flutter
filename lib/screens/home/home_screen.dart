import 'package:eha_app/providers/helper_provider.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:eha_app/components/app_drawer.dart';
import 'package:provider/provider.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  static String routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var initProvider;

  @override
  void initState() {
    super.initState();
    initProvider = Provider.of<HelperProvider>(context, listen: false);
    initMethod();
  }

  void initMethod() async {
    await initProvider.initHelper();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color(0xFFF8F8F8),
        body: Body(),
        drawer: AppDrawer(),
      ),
    );
  }
}
