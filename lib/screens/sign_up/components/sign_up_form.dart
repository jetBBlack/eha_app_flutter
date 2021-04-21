import 'package:eha_app/components/custom_surffix_icon.dart';
import 'package:eha_app/components/default_button.dart';
import 'package:eha_app/components/form_error.dart';
import 'package:eha_app/screens/complete_profile/complete_profile.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String confirmPassword;
  String dropDownItem = "As Employer";
  final List<String> errors = [];
  bool _checkedE = true;
  bool _checkedH = false;
  //bool _passVisibility = true;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  // void _toggle() {
  //   setState(() {
  //     _passVisibility = !_passVisibility;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildConfPasswordFormField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(16)),
          Text(
            "Register as",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
              color: kSecondaryColor,
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          CheckboxListTile(
            value: _checkedE,
            title: Text(
              "As Employer",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            controlAffinity: ListTileControlAffinity.platform,
            onChanged: (bool value) {
              setState(() {
                if (value == true) {
                  _checkedE = value;
                  _checkedH = false;
                } else {
                  _checkedE = value;
                }
              });
            },
            activeColor: Colors.white,
            checkColor: kPrimaryColor,
          ),
          CheckboxListTile(
            value: _checkedH,
            title: Text(
              "As Helper",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            controlAffinity: ListTileControlAffinity.platform,
            onChanged: (bool value) {
              setState(() {
                if (value == true) {
                  _checkedE = false;
                  _checkedH = value;
                } else {
                  _checkedH = value;
                }
              });
            },
            activeColor: Colors.white,
            checkColor: kPrimaryColor,
          ),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildConfPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => confirmPassword = newValue,
      obscureText: true,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && value == password) {
          removeError(error: kMatchPassError);
        }
        confirmPassword = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      obscureText: true,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: "Phone or Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/Mail.svg",
        ),
      ),
    );
  }
}
