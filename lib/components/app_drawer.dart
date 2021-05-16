import 'package:eha_app/screens/account/account_screen.dart';
import 'package:eha_app/screens/fill_data/fill_biodata/fill_biodata.dart';
import 'package:eha_app/screens/fill_data/fill_employer_data/fill_employer_data.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Container(
              height: getProportionateScreenWidth(20),
              width: getProportionateScreenWidth(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/face-1.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
          ),
          ListTile(
            title: Text(
              'General Service',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('My Info (Employer)',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
            onTap: () {
              Navigator.pushNamed(context, FillEmployerDataScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            title: Text('My Info (Helper)',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
            onTap: () {
              Navigator.pushNamed(context, FillBioDataScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'Other Service',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text(
              'Account',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            onTap: () {
              Navigator.pushNamed(context, AccountScreen.routeName);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
