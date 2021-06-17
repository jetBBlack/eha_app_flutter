import 'package:eha_app/screens/account/account_screen.dart';
import 'package:eha_app/screens/agency/agency_screen.dart';
import 'package:eha_app/screens/chat/chat_page.dart';
import 'package:eha_app/screens/employer/employer_screen.dart';
import 'package:eha_app/screens/fill_employer_data/fill_info/fill_info_screen.dart';
import 'package:eha_app/screens/fill_employer_data/fill_mom/fill_employer_mom.dart';
import 'package:eha_app/screens/fill_helper_data/fill_biodata/fill_biodata.dart';
import 'package:eha_app/screens/fill_helper_data/fill_mom_data/fill_mom_data.dart';
import 'package:eha_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:eha_app/screens/helper/helper_screen.dart';
import 'package:eha_app/screens/home/home_screen.dart';
import 'package:eha_app/screens/services/subscription_screen.dart';
import 'package:eha_app/screens/sign_in/sign_in_screen.dart';
import 'package:eha_app/screens/sign_up/ask_screen.dart';
import 'package:eha_app/screens/sign_up/phone_sign_up_screen.dart';
import 'package:eha_app/screens/sign_up/sign_up_screen.dart';
import 'package:eha_app/screens/user_details/helper_detail_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  EmployerScreen.routeName: (context) => EmployerScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  FillMoMDataScreen.routeName: (context) => FillMoMDataScreen(),
  FillBioDataScreen.routeName: (context) => FillBioDataScreen(),
  FillEmployerInfoScreen.routeName: (context) => FillEmployerInfoScreen(),
  FillEmployerMomScreen.routeName: (context) => FillEmployerMomScreen(),
  AskScreen.routeName: (context) => AskScreen(),
  PhoneSignUpScreen.routeName: (context) => PhoneSignUpScreen(),
  AccountScreen.routeName: (context) => AccountScreen(),
  UserDetailScreen.routeName: (context) => UserDetailScreen(),
  HelperScreen.routeName: (context) => HelperScreen(),
  AgencyScreen.routeName: (context) => AgencyScreen(),
  ChatPage.routeName: (context) => ChatPage(),
  SubscriptionScreen.routeName: (context) => SubscriptionScreen(),
};
