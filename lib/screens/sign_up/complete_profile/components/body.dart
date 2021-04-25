import 'package:eha_app/components/custom_label_container.dart';
import 'package:eha_app/components/custom_surffix_icon.dart';
import 'package:eha_app/components/default_button.dart';
import 'package:eha_app/screens/sign_up/complete_profile/avator.dart';

import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../constant.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenHeight(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Text("Complete Profile", style: headingStyle),
                Text(
                  "Complete your details ",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                CompleteProfileForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  List<String> gender = ["Male", "Female", "Unknown"];
  String fullName;
  String phoneNumber;
  String countryCode;
  String genderSelect = "Male";

  void addError({String error}) {
    if (!error.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String error}) {
    if (error.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFullNameFormField(),
          SizedBox(
            height: getProportionateScreenWidth(25),
          ),
          buildPhoneNumberFormField(),
          // SizedBox(
          //   height: getProportionateScreenWidth(25),
          // ),
          // builGenderContainer(),
          SizedBox(
            height: getProportionateScreenWidth(40),
          ),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                Navigator.pushNamed(context, AvatorScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  CustomContainer builGenderContainer() {
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

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefix: Text("+65"),
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildFullNameFormField() {
    return TextFormField(
      onSaved: (newValue) => fullName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Full Name",
        hintText: "Enter your name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
