import 'package:eha_app/components/custom_label_container.dart';
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
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
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
            height: getProportionateScreenWidth(10),
          ),
          buildCustomContainer(),
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
