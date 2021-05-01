import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserTypePreferences {
  Future saveType(String type) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_type', type);
  }

  Future<String> getType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String type = prefs.getString('user_type');
    return type;
  }
}
