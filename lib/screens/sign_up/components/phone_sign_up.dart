import 'package:eha_app/components/custom_surffix_icon.dart';
import 'package:eha_app/components/default_button.dart';
import 'package:eha_app/components/form_error.dart';
import 'package:eha_app/models/register_model.dart';
import 'package:eha_app/providers/auth.dart';
import 'package:eha_app/screens/fill_data/fill_biodata/fill_biodata.dart';
import 'package:eha_app/screens/fill_data/fill_employer_data/fill_employer_data.dart';
import 'package:eha_app/screens/home/home_screen.dart';
import 'package:eha_app/screens/sign_up/sign_up_screen.dart';
import 'package:eha_app/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constant.dart';

class PhoneSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              Text(
                'Register Account',
                style: headingStyle,
              ),
              Text(
                "Complete your details",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              PhoneSignUpForm(),
              SizedBox(height: getProportionateScreenHeight(15)),
              Text(
                'By continuing your confirm that you agree \nwith our Term and Condition',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PhoneSignUpForm extends StatefulWidget {
  @override
  _PhoneSignUpFormState createState() => _PhoneSignUpFormState();
}

class _PhoneSignUpFormState extends State<PhoneSignUpForm> {
  final _user = FirebaseAuth.instance.currentUser;
  final _formKey = GlobalKey<FormState>();
  String confirmPassword;
  final List<String> errors = [];
  RegisterRequestModel registerRequestModel;
  //bool _passVisibility = true;

  @override
  void initState() {
    super.initState();
    registerRequestModel = new RegisterRequestModel();
    registerRequestModel.emailAddress = _user == null ? null : _user.email;
  }

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

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    var doRegister = () {
      final form = _formKey.currentState;

      if (form.validate()) {
        form.save();

        final Future<Map<String, dynamic>> successfullMessage =
            auth.register(registerRequestModel);

        successfullMessage.then((response) async {
          if (response['status']) {
            Fluttertoast.showToast(
                msg: response['message'],
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.green);
            SharedPreferences prefs = await SharedPreferences.getInstance();
            String type = prefs.getString('user_type');
            print(type);
            if (type == 'helper') {
              Navigator.pushNamed(context, FillBioDataScreen.routeName);
            } else if (type == 'employer') {
              Navigator.pushNamed(context, FillEmployerDataScreen.routeName);
            } else {
              Navigator.pushNamed(context, HomeScreen.routeName);
            }
          } else {
            for (var i = 0; i <= response['message'].length; i++) {
              Fluttertoast.showToast(
                  msg: response['message'][i],
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.redAccent);
            }
          }
        });
      }
    };
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildPhoneFormField(),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
            child: Text(
              "Use email",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 15, color: Colors.cyan[500]),
            ),
          ),
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
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                doRegister();
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      initialValue: _user == null ? null : _user.displayName,
      onSaved: (newValue) => registerRequestModel.name = newValue,
      keyboardType: TextInputType.text,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Enter your name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/User.svg",
        ),
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
        } else if (registerRequestModel.password == confirmPassword) {
          removeError(error: kMatchPassError);
        }
        confirmPassword = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (registerRequestModel.password != value) {
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
      onSaved: (newValue) => registerRequestModel.password = newValue,
      obscureText: true,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        registerRequestModel.password = value;
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

  TextFormField buildPhoneFormField() {
    return TextFormField(
      initialValue: _user == null ? null : _user.phoneNumber,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => registerRequestModel.contactNo = newValue,
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
      decoration: InputDecoration(
        labelText: 'Phone',
        hintText: "+65 12345678 ",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/call.svg",
        ),
      ),
    );
  }
}
