import 'package:dropdownfield/dropdownfield.dart';
import 'package:eha_app/components/drop_down_container.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildPersonalInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(18)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenWidth(20),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/User.svg',
                        color: Colors.cyan,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(10),
                      ),
                      Text(
                        "GENERAL INFOMATION",
                        style: TextStyle(color: Colors.cyan),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(20),
                  ),
                  BuildGeneralInfo(),
                ],
              ),
            ),
          )),
    );
  }
}

class BuildGeneralInfo extends StatefulWidget {
  @override
  _BuildGeneralInfoState createState() => _BuildGeneralInfoState();
}

class _BuildGeneralInfoState extends State<BuildGeneralInfo> {
  Key _formKey = GlobalKey<FormState>();
  TextEditingController dateCtl = TextEditingController();
  List<String> genderList = ["Male", "Female"];
  String genderSelect = "Male";
  List<String> countryList = [
    "Singapore",
    "Malaysia",
    "Viet Nam",
    "Indonesia",
    "HongKong",
    "Thailand",
    "Korean"
  ];
  TextEditingController citiesSelected = TextEditingController();
  String selectCity = " ";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Name",
              hintText: "Enter your name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(15),
          ),
          DropDownContainer(
            labelText: "Gender",
            selectedValue: genderSelect,
            valueList: genderList,
            press: (String newValue) {
              genderSelect = newValue;
            },
          ),
          SizedBox(
            height: getProportionateScreenWidth(15),
          ),
          DropDownField(
            controller: citiesSelected,
            hintText: "Select any Country",
            labelText: "Birth Country",
            items: countryList,
            itemsVisibleInDropdown: 4,
            onValueChanged: (value) {
              selectCity = value;
            },
          ),
        ],
      ),
    );
  }
}
