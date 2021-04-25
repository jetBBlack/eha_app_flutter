import 'package:eha_app/screens/employer/employer_screen.dart';
import 'package:eha_app/screens/fill_data/fill_biodata/fill_biodata.dart';
import 'package:eha_app/screens/fill_data/fill_employer_data/fill_employer_data.dart';
import 'package:eha_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:eha_app/screens/home/home_screen.dart';
import 'package:eha_app/screens/sign_in/sign_in_screen.dart';
import 'package:eha_app/screens/sign_up/ask_screen.dart';
import 'package:eha_app/screens/sign_up/complete_profile/avator.dart';
import 'package:eha_app/screens/sign_up/complete_profile/complete_profile.dart';
import 'package:eha_app/screens/sign_up/complete_profile/complete_profile_1.dart';
import 'package:eha_app/screens/sign_up/phone_sign_up_screen.dart';
import 'package:eha_app/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  EmployerScreen.routeName: (context) => EmployerScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  CompleteProfileScreen1.routeName: (context) => CompleteProfileScreen1(),
  FillEmployerDataScreen.routeName: (context) => FillEmployerDataScreen(),
  FillBioDataScreen.routeName: (context) => FillBioDataScreen(),
  AskScreen.routeName: (context) => AskScreen(),
  PhoneSignUpScreen.routeName: (context) => PhoneSignUpScreen(),
  AvatorScreen.routeName: (context) => AvatorScreen(),
};
