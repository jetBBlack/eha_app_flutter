import 'package:eha_app/components/info_title.dart';
import 'package:eha_app/providers/helper_provider.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class BuildContactInfo extends StatefulWidget {
  @override
  _BuildContactInfoState createState() => _BuildContactInfoState();
}

class _BuildContactInfoState extends State<BuildContactInfo>
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
                  icon: 'assets/icons/contact.svg',
                  title: 'CONTACT INFOMATION',
                ),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                BuildContactInfoForm(),
                SizedBox(
                  height: getProportionateScreenWidth(30),
                ),
                // Row(
                //   children: [
                //     SvgPicture.asset(
                //       'assets/icons/address.svg',
                //       height: 20,
                //       width: 20,
                //       color: Colors.cyan,
                //     ),
                //     SizedBox(
                //       width: getProportionateScreenWidth(10),
                //     ),
                //     Text(
                //       "Singapore Address",
                //       style: TextStyle(color: Colors.cyan, fontSize: 18),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: getProportionateScreenWidth(20),
                // ),
                // SingaporeAddress(),
                // SizedBox(
                //   height: getProportionateScreenWidth(30),
                // ),
                // Row(
                //   children: [
                //     SvgPicture.asset(
                //       'assets/icons/address.svg',
                //       height: 20,
                //       width: 20,
                //       color: Colors.cyan,
                //     ),
                //     SizedBox(
                //       width: getProportionateScreenWidth(10),
                //     ),
                //     Text(
                //       "Oversea Address",
                //       style: TextStyle(color: Colors.cyan, fontSize: 18),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: getProportionateScreenWidth(20),
                // ),
                // OverseaAddress(),
                // SizedBox(
                //   height: getProportionateScreenWidth(15),
                // ),
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

class BuildContactInfoForm extends StatefulWidget {
  @override
  _BuildContactInfoFormState createState() => _BuildContactInfoFormState();
}

class _BuildContactInfoFormState extends State<BuildContactInfoForm> {
  TextEditingController _contactNoCtl = TextEditingController();
  TextEditingController _agencyIdCtl = TextEditingController();
  Key _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    final contactProvider = Provider.of<HelperProvider>(context, listen: false);
    super.initState();
    _contactNoCtl = TextEditingController(text: contactProvider.contactInfo);
    _agencyIdCtl = TextEditingController(text: contactProvider.agencyId);
  }

  @override
  void dispose() {
    _contactNoCtl.dispose();
    _agencyIdCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HelperProvider contactProvider = Provider.of<HelperProvider>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _contactNoCtl,
            onChanged: contactProvider.setcontactNo,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: "Contact Number",
              hintText: "Example +65 4444 9999",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _agencyIdCtl,
            onChanged: contactProvider.setagencyId,
            decoration: InputDecoration(
              labelText: "Agency ID",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
        ],
      ),
    );
  }
}

class SingaporeAddress extends StatefulWidget {
  @override
  _SingaporeAddressState createState() => _SingaporeAddressState();
}

class _SingaporeAddressState extends State<SingaporeAddress> {
  TextEditingController _blkNo = TextEditingController();
  TextEditingController _unitNo = TextEditingController();
  TextEditingController _floorNo = TextEditingController();
  TextEditingController _streetName = TextEditingController();
  TextEditingController _country = TextEditingController();
  TextEditingController _postalCode = TextEditingController();
  Key _formKey1 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // _blkNo = TextEditingController(text: addressProvider.blkNo);
    // _unitNo = TextEditingController(text: addressProvider.unitNo);
    // _floorNo = TextEditingController(text: addressProvider.floorNo);
    // _streetName = TextEditingController(text: addressProvider.streetName);
    // _country = TextEditingController(text: addressProvider.country);
    // _postalCode = TextEditingController(text: addressProvider.postalCode);
  }

  @override
  void dispose() {
    _blkNo.dispose();
    _unitNo.dispose();
    _floorNo.dispose();
    _streetName.dispose();
    _country.dispose();
    _postalCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey1,
      child: Column(
        children: [
          TextFormField(
            controller: _blkNo,
            //onChanged: addressProvider.setbklNo,
            decoration: InputDecoration(
              labelText: "Block/House No",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _unitNo,
            //onChanged: addressProvider.setunitNo,
            decoration: InputDecoration(
              labelText: "Unit No",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _floorNo,
            //onChanged: addressProvider.setfloorNo,
            decoration: InputDecoration(
              labelText: "Floor No",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _streetName,
            //onChanged: addressProvider.setstreetName,
            decoration: InputDecoration(
              labelText: "Street Name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _country,
            //onChanged: addressProvider.setcountry,
            decoration: InputDecoration(
              labelText: "Country",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _postalCode,
            //onChanged: addressProvider.setpostalCode,
            decoration: InputDecoration(
              labelText: "Postal Code",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
        ],
      ),
    );
  }
}

class OverseaAddress extends StatefulWidget {
  @override
  _OverseaAddressState createState() => _OverseaAddressState();
}

class _OverseaAddressState extends State<OverseaAddress> {
  TextEditingController _no = TextEditingController();
  TextEditingController _streetname = TextEditingController();
  TextEditingController _postalCode = TextEditingController();
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
  TextEditingController _nationalities = TextEditingController();
  String selectNational = " ";

  @override
  void initState() {
    //final overseaProvider = Provider.of<HelperProvider>(context, listen: false);
    super.initState();
    // _no = TextEditingController(text: overseaProvider.no);
    // _streetname = TextEditingController(text: overseaProvider.seaStreetName);
    // _postalCode = TextEditingController(text: overseaProvider.seaPostalCode);
    // _nationalities = TextEditingController(text: overseaProvider.seaCountry);
  }

  @override
  void dispose() {
    _no.dispose();
    _streetname.dispose();
    _postalCode.dispose();
    _nationalities.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final HelperProvider overseaProvider = Provider.of<HelperProvider>(context);
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _no,
            //onChanged: overseaProvider.setno,
            decoration: InputDecoration(
              labelText: "Number",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _streetname,
            //onChanged: overseaProvider.setseaStreetName,
            decoration: InputDecoration(
              labelText: "Street Name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _postalCode,
            //onChanged: overseaProvider.setseaPostalCode,
            decoration: InputDecoration(
              labelText: "Postal Code",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
        ],
      ),
    );
  }
}
