import 'package:eha_app/providers/helper_provider.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class BuildSettings extends StatefulWidget {
  @override
  _BuildSettingsState createState() => _BuildSettingsState();
}

class _BuildSettingsState extends State<BuildSettings>
    with AutomaticKeepAliveClientMixin {
  bool _searchAble = false;

  @override
  Widget build(BuildContext context) {
    final HelperProvider searchProvider = Provider.of<HelperProvider>(context);
    super.build(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/setting-lines.svg',
                    height: 20,
                    width: 20,
                    color: Colors.cyan,
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  Text(
                    "SETTING",
                    style: TextStyle(color: Colors.cyan, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    SwitchListTile(
                      title: Text("Searchable"),
                      value: _searchAble,
                      onChanged: (value) {
                        searchProvider.setsearchAble(value.toString());
                        setState(() {
                          _searchAble = value;
                        });
                      },
                    ),
                    Text('If you enable, your profile be able to search'),
                    SizedBox(height: getProportionateScreenWidth(10)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
