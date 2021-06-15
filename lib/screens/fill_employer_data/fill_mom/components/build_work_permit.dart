import 'dart:convert';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:eha_app/components/info_title.dart';
import 'package:eha_app/providers/employer_mom_provider.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class BuildWorkPermit extends StatefulWidget {
  @override
  _BuildWorkPermitState createState() => _BuildWorkPermitState();
}

class _BuildWorkPermitState extends State<BuildWorkPermit>
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
                  height: getProportionateScreenWidth(20),
                ),
                InfoTitle(
                    icon: 'assets/icons/address.svg', title: 'ADDRESS INFO'),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                BuildWorkPermitAddress(),
                SizedBox(
                  height: getProportionateScreenWidth(30),
                ),
                InfoTitle(
                    icon: 'assets/icons/address.svg', title: 'RECEIVER INFO'),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                BuildReceiverInfo(),
                SizedBox(
                  height: getProportionateScreenWidth(30),
                ),
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

  String wpValidator(String value) {
    if (value.isEmpty || value.length == 0) {
      return "Required field";
    } else {
      return null;
    }
  }

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
    if (_countryList.length == 0 || _countryList.isEmpty) {
      getCountryName().then((List<String> c) => setState(() {
            _countryList = c;
          }));
    }
    final EmployerMomProvider wpProvider =
        Provider.of<EmployerMomProvider>(context, listen: false);
    super.initState();
    _blkNoCtl = TextEditingController(text: wpProvider.blkNo);
    _unitNoCtl = TextEditingController(text: wpProvider.unitNo);
    _floorNoCtl = TextEditingController(text: wpProvider.floorNo);
    _streetNameCtl = TextEditingController(text: wpProvider.streetName);
    _countryCtl = TextEditingController(text: wpProvider.country);
    _postalCode = TextEditingController(text: wpProvider.postalCode);
  }

  @override
  void dispose() {
    _blkNoCtl.dispose();
    _unitNoCtl.dispose();
    _floorNoCtl.dispose();
    _streetNameCtl.dispose();
    _countryCtl.dispose();
    _postalCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final EmployerMomProvider wpProvider =
        Provider.of<EmployerMomProvider>(context);
    return Form(
      key: wpProvider.wpFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: _blkNoCtl,
            validator: (value) => wpValidator(value),
            onChanged: wpProvider.setblkNo,
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
            validator: (value) => wpValidator(value),
            onChanged: wpProvider.setunitNo,
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
            validator: (value) => wpValidator(value),
            onChanged: wpProvider.setfloorNo,
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
            validator: (value) => wpValidator(value),
            onChanged: wpProvider.setstreetName,
            decoration: InputDecoration(
              labelText: 'Street name',
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.DIALOG,
            popupBackgroundColor: Colors.grey[200],
            popupShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            validator: (value) => wpValidator(value),
            onChanged: wpProvider.setcountry,
            selectedItem: _countryCtl.text,
            searchBoxDecoration: InputDecoration(
              hintText: "Search country",
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            showSearchBox: true,
            showSelectedItem: true,
            items: _countryList,
            label: 'Country',
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _postalCode,
            validator: (value) => wpValidator(value),
            onChanged: wpProvider.setpostalCode,
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
  TextEditingController _nameClt = TextEditingController();
  TextEditingController _nricFinClt = TextEditingController();
  TextEditingController _countryIdCtl = TextEditingController();
  TextEditingController _contactNoCtl = TextEditingController();

  @override
  void initState() {
    final contactProvider =
        Provider.of<EmployerMomProvider>(context, listen: false);
    super.initState();
    _nameClt = TextEditingController(text: contactProvider.wpName);
    _nricFinClt = TextEditingController(text: contactProvider.nricFin);
    _countryIdCtl = TextEditingController(text: contactProvider.country);
    _contactNoCtl = TextEditingController(text: contactProvider.contactNumber);
  }

  @override
  void dispose() {
    _nameClt.dispose();
    _nricFinClt.dispose();
    _countryIdCtl.dispose();
    _contactNoCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<EmployerMomProvider>(context);
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _nameClt,
            onChanged: contactProvider.setwpName,
            decoration: InputDecoration(
              labelText: 'Name',
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _nricFinClt,
            onChanged: contactProvider.setnricFin,
            decoration: InputDecoration(
              labelText: 'NRIC or FIN',
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          // SizedBox(
          //   height: getProportionateScreenWidth(20),
          // ),
          // DropdownSearch<String>(
          //   mode: Mode.BOTTOM_SHEET,
          //   dialogMaxWidth: 8,
          //   showSearchBox: true,
          //   searchBoxDecoration: InputDecoration(
          //     prefixIcon: Icon(Icons.search),
          //   ),
          //   showSelectedItem: true,
          //   items: _countryCode,
          //   label: 'Country code',
          //   //searchBoxController: _countryCtl,
          //   //onChanged: (value) => formProvider.setgender(value),
          //   dropdownSearchDecoration: InputDecoration(
          //     contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
          //   ),
          // ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _contactNoCtl,
            onChanged: contactProvider.setContactNumber,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                prefix: CountryCodePicker(
                  padding: EdgeInsets.only(
                    left: 2,
                  ),
                  onChanged: (value) =>
                      contactProvider.setCountryId(value.toString()),
                  favorite: ['+65', '+63'],
                  initialSelection: '+65',
                  flagDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                labelText: 'Contact number',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: EdgeInsets.fromLTRB(30, 10, 10, 12)),
          ),
        ],
      ),
    );
  }
}
