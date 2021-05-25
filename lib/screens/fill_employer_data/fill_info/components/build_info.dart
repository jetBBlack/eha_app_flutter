import 'package:dropdown_search/dropdown_search.dart';
import 'package:eha_app/components/info_title.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../constant.dart';

class BuildEmployerPersonalInfo extends StatefulWidget {
  @override
  _BuildEmployerPersonalInfoState createState() =>
      _BuildEmployerPersonalInfoState();
}

class _BuildEmployerPersonalInfoState extends State<BuildEmployerPersonalInfo>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                InfoTitle(
                    icon: 'assets/icons/User.svg',
                    title: 'PERSONAL INFOMATION'),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                BuildGeneralInfo(),
                SizedBox(
                  height: getProportionateScreenWidth(30),
                ),
                InfoTitle(icon: 'assets/icons/wives.svg', title: 'FAMILY INFO'),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                BuildFamilyInfo(),
                SizedBox(
                  height: getProportionateScreenWidth(30),
                ),
                InfoTitle(icon: 'assets/icons/house.svg', title: 'HOUSE INFO'),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                BuildHouseInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class BuildGeneralInfo extends StatefulWidget {
  @override
  _BuildGeneralInfoState createState() => _BuildGeneralInfoState();
}

class _BuildGeneralInfoState extends State<BuildGeneralInfo> {
  List<String> maritalStatusList = [
    "Divorced",
    "Married",
    "Separated",
    "Single",
    "Widowed"
  ];
  List<String> countryList = [
    "Filipino",
    "Burman",
    "India",
    "Sri Lanka",
    "Bangladesh",
    "Malaysian",
    "Indonesian",
    "Chinese-HongKong",
    "Chinese-Macau",
    "Chinese-Taiwan",
    "Thai",
    "Korean"
  ];
  List<String> ethnicGroupList = [
    'Chinese',
    'Filipino',
    'Indian',
    'Indonesian',
    'Malay',
    'No Selected',
    'Other',
  ];
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.MENU,
            showSelectedItem: true,
            items: ['Male', 'Female'],
            label: 'Gender',
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.MENU,
            showSelectedItem: true,
            items: maritalStatusList,
            label: 'Marital Status',
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.MENU,
            showSelectedItem: true,
            items: countryList,
            label: 'Nationality',
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.MENU,
            showSelectedItem: true,
            items: countryList,
            label: 'Religion',
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.MENU,
            showSelectedItem: true,
            items: ethnicGroupList,
            label: 'Ethnic Group',
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
        ],
      ),
    );
  }
}

class BuildFamilyInfo extends StatefulWidget {
  @override
  _BuildFamilyInfoState createState() => _BuildFamilyInfoState();
}

class _BuildFamilyInfoState extends State<BuildFamilyInfo> {
  bool _stayWithParent = false;
  bool _stayWithParentInLaw = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "No. of children"),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                getProportionateScreenWidth(25),
              ),
              border: Border.all(color: kTextColor),
            ),
            child: SwitchListTile(
              title: Text(
                'Staying with parents',
                style: TextStyle(color: kTextColor),
              ),
              value: _stayWithParent,
              onChanged: (bool newValue) {
                setState(() {
                  _stayWithParent = newValue;
                });
              },
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                getProportionateScreenWidth(25),
              ),
              border: Border.all(color: kTextColor),
            ),
            child: SwitchListTile(
              title: Text(
                'Staying with parents in law',
                style: TextStyle(color: kTextColor),
              ),
              value: _stayWithParentInLaw,
              onChanged: (bool newValue) {
                setState(() {
                  _stayWithParentInLaw = newValue;
                });
              },
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "No of people in the same house",
                floatingLabelBehavior: FloatingLabelBehavior.always),
          )
        ],
      ),
    );
  }
}

class BuildHouseInfo extends StatefulWidget {
  @override
  _BuildHouseInfoState createState() => _BuildHouseInfoState();
}

class _BuildHouseInfoState extends State<BuildHouseInfo> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          DropdownSearch<String>(
            mode: Mode.MENU,
            items: [],
            label: "Housing Type",
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "No of rooms"),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "No of bathrooms"),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "No of toilets"),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "No of floors"),
          )
        ],
      ),
    );
  }
}
