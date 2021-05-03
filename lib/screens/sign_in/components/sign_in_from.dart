import 'package:eha_app/components/custom_surffix_icon.dart';
import 'package:eha_app/components/default_button.dart';
import 'package:eha_app/components/form_error.dart';
import 'package:eha_app/models/login_model.dart';
import 'package:eha_app/providers/auth.dart';
import 'package:eha_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:eha_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constant.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  LoginRequestModel loginRequestModel;
  bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel();
    _passwordVisible = false;
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

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Authenticating ... Please wait")
      ],
    );

    var doLogin = () {
      final form = _formKey.currentState;

      if (form.validate()) {
        form.save();

        final Future<Map<String, dynamic>> successfulMessgae =
            auth.login(loginRequestModel.email, loginRequestModel.password);
        successfulMessgae.then((response) async {
          if (response['status']) {
            Fluttertoast.showToast(
                msg: "Login Succesfull",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.green);
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('email', 'username@gmail.com');
            Navigator.pushNamed(context, HomeScreen.routeName);
          } else {
            Fluttertoast.showToast(
              msg: response['error'],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
            );
          }
        });
      }
    };

    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailTextFormField(),
          SizedBox(height: getProportionateScreenWidth(20)),
          buildPasswordTextFormField(),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          Row(
            children: [
              Spacer(),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          auth.loggedInStatus == Status.Authenticating
              ? loading
              : DefaultButton(
                  text: "Continue",
                  press: () {
                    doLogin();
                  },
                )
        ],
      ),
    );
  }

  TextFormField buildPasswordTextFormField() {
    return TextFormField(
      onSaved: (newValue) => loginRequestModel.password = newValue,
      obscureText: _passwordVisible,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
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
          svgIcon: _passwordVisible
              ? "assets/icons/invisibility .svg"
              : "assets/icons/visibility.svg",
          press: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
    );
  }

  TextFormField buildEmailTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => loginRequestModel.email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailPhoneNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailPhoneNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email or Phone",
        hintText: "Email or Phone",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/Mail.svg",
        ),
      ),
    );
  }
}
