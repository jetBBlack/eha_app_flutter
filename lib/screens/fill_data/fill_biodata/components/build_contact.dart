import 'package:dropdownfield/dropdownfield.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/contact.svg',
                      height: 20,
                      width: 20,
                      color: Colors.cyan,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(
                      "CONTACT INFOMATION",
                      style: TextStyle(color: Colors.cyan, fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                BuildContactInfoForm(),
                SizedBox(
                  height: getProportionateScreenWidth(30),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/address.svg',
                      height: 20,
                      width: 20,
                      color: Colors.cyan,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(
                      "Singapore Address",
                      style: TextStyle(color: Colors.cyan, fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                SingaporeAddress(),
                SizedBox(
                  height: getProportionateScreenWidth(30),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/address.svg',
                      height: 20,
                      width: 20,
                      color: Colors.cyan,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(
                      "Oversea Address",
                      style: TextStyle(color: Colors.cyan, fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                OverseaAddress(),
                SizedBox(
                  height: getProportionateScreenWidth(15),
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

class BuildContactInfoForm extends StatefulWidget {
  @override
  _BuildContactInfoFormState createState() => _BuildContactInfoFormState();
}

class _BuildContactInfoFormState extends State<BuildContactInfoForm> {
  Key _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Country Code",
              hintText: "Example +65",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: "Phone Number",
              hintText: "0329443199",
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
  Key _formKey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey1,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Block/House No",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Unit No",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Floor No",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Street Name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            initialValue: "Singapore",
            decoration: InputDecoration(
              labelText: "Country",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
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
  TextEditingController nationalities = TextEditingController();
  String selectNational = " ";
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Number",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Street Name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropDownField(
            controller: nationalities,
            hintText: "Select any Country",
            labelText: "Nationality",
            items: countryList,
            itemsVisibleInDropdown: 4,
            onValueChanged: (value) {
              selectNational = value;
            },
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
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
