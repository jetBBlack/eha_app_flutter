import 'package:eha_app/components/custom_label_container.dart';
import 'package:eha_app/components/drop_down_container.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constant.dart';

class BuildPersonalInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(18)),
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
                FillEmployerForm(),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/wives.svg',
                      height: 16,
                      width: 16,
                      color: Colors.cyan,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(
                      "SPOUSE INFOMATION",
                      style: TextStyle(color: Colors.cyan),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                BuildSpouseForm(),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/clipboard.svg',
                      height: 16,
                      width: 16,
                      color: Colors.cyan,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(
                      "MALAYSIA INFOMATION",
                      style: TextStyle(color: Colors.cyan),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                BuildMalaysiaForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FillEmployerForm extends StatefulWidget {
  @override
  _FillEmployerFormState createState() => _FillEmployerFormState();
}

class _FillEmployerFormState extends State<FillEmployerForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> gender = ["Male", "Female", "Unknown"];
  String genderSelect = "Male";
  TextEditingController dateCtl = TextEditingController();

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
            height: getProportionateScreenWidth(12),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "FIN",
              hintText: "For Exmaple, A 1234567",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(12),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Work Permit Number",
              hintText: "For Exmaple, 1234567",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(12),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Citizen grandted at state/province",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(15),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Passport Number",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(15),
          ),
          TextFormField(
            controller: dateCtl,
            onTap: () async {
              DateTime date = DateTime(2021);
              FocusScope.of(context).requestFocus(new FocusNode());

              date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              dateCtl.text = date.toIso8601String();
            },
            decoration: InputDecoration(
              labelText: "Passport Expired On",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(12),
          ),
          DropDownContainer(
            labelText: "Gender",
            selectedValue: genderSelect,
            valueList: gender,
            press: (String newValue) {
              setState(() {
                genderSelect = newValue;
              });
            },
          ),
        ],
      ),
    );
  }

  CustomContainer buildCustomContainer() {
    return CustomContainer(
      labelText: "Gender",
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(25),
          ),
          border: Border.all(color: kTextColor)),
      child: DropdownButton(
        isExpanded: true,
        value: genderSelect,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: getProportionateScreenWidth(25),
        elevation: 10,
        underline: Container(
          color: kTextColor,
        ),
        style: TextStyle(
            color: kTextColor, fontSize: getProportionateScreenWidth(16)),
        onChanged: (String newValue) {
          setState(() {
            genderSelect = newValue;
          });
        },
        items: gender.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem(
            child: Text(value),
            value: value,
          );
        }).toList(),
      ),
    );
  }
}

class BuildSpouseForm extends StatefulWidget {
  @override
  _BuildSpouseFormState createState() => _BuildSpouseFormState();
}

class _BuildSpouseFormState extends State<BuildSpouseForm> {
  TextEditingController dateCtl = TextEditingController();
  final _formKeyS = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKeyS,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Spouse Name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(15),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Spouse NRIC",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(15),
          ),
          TextFormField(
            controller: dateCtl,
            onTap: () async {
              DateTime date = DateTime(2021);
              FocusScope.of(context).requestFocus(new FocusNode());

              date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              dateCtl.text = date.toIso8601String();
            },
            decoration: InputDecoration(
              labelText: "Married On",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
        ],
      ),
    );
  }
}

class BuildMalaysiaForm extends StatefulWidget {
  @override
  _BuildMalaysiaFormState createState() => _BuildMalaysiaFormState();
}

class _BuildMalaysiaFormState extends State<BuildMalaysiaForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "IC Number",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(15),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "IC Color",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          )
        ],
      ),
    );
  }
}
