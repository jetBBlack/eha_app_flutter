import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:eha_app/components/info_title.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildWorkPermit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  height: getProportionateScreenWidth(20),
                ),
                InfoTitle(
                    icon: 'assets/icons/address.svg', title: 'ADDRESS INFO'),
                BuildWorkPermitAddress(),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                InfoTitle(
                    icon: 'assets/icons/address.svg', title: 'RECEIVER INFO'),
                BuildReceiverInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildWorkPermitAddress extends StatefulWidget {
  const BuildWorkPermitAddress({Key key}) : super(key: key);

  @override
  _BuildWorkPermitAddressState createState() => _BuildWorkPermitAddressState();
}

class _BuildWorkPermitAddressState extends State<BuildWorkPermitAddress> {
  TextEditingController _blkNoCtl = TextEditingController();
  TextEditingController _unitNoCtl = TextEditingController();
  TextEditingController _floorNoCtl = TextEditingController();
  TextEditingController _streetNameCtl = TextEditingController();
  TextEditingController _countryCtl = TextEditingController();
  TextEditingController _postalCode = TextEditingController();

  Future<List<String>> getCountryName() async {
    List<String> countryNameList = [];
    final String response =
        await rootBundle.loadString('assets/country-by-calling-code.json');
    final List<dynamic> countries = json.decode(response.toString());
    for (var country in countries) {
      Map<String, dynamic> responseItem = country;
      countryNameList.add(responseItem['country']);
    }
    return countryNameList;
  }

  List<String> _countryList = [];
  @override
  void initState() {
    super.initState();
    if (_countryList == null) {
      getCountryName().then((List<String> c) => setState(() {
            _countryList = c;
          }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _blkNoCtl,
            decoration: InputDecoration(
              labelText: 'Block number',
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _unitNoCtl,
            decoration: InputDecoration(
              labelText: 'Unit number',
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _floorNoCtl,
            decoration: InputDecoration(
              labelText: 'Floor number',
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _streetNameCtl,
            decoration: InputDecoration(
              labelText: 'Street name',
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.MENU,
            showSelectedItem: true,
            items: [],
            label: 'Country',
            searchBoxController: _countryCtl,
            //onChanged: (value) => formProvider.setgender(value),
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _postalCode,
            decoration: InputDecoration(
              labelText: 'Postal code',
              floatingLabelBehavior: FloatingLabelBehavior.always,
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

class BuildReceiverInfo extends StatefulWidget {
  const BuildReceiverInfo({Key key}) : super(key: key);

  @override
  _BuildReceiverInfoState createState() => _BuildReceiverInfoState();
}

class _BuildReceiverInfoState extends State<BuildReceiverInfo> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Name',
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'NRIC or FIN',
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.MENU,
            showSelectedItem: true,
            items: [],
            label: 'Country code',
            //searchBoxController: _countryCtl,
            //onChanged: (value) => formProvider.setgender(value),
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'Contact number',
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          )
        ],
      ),
    );
  }
}
