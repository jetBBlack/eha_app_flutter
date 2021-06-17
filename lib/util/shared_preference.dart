import 'package:eha_app/models/local_user.dart';
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
    print(type);
    return type;
  }
}

class UserPreferences {
  Future<void> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('userId', user.userId);
    prefs.setString('name', user.name);
    prefs.setString('email', user.email);
    prefs.setString('phone', user.phone);
    prefs.setString('type', user.type);
    print("object prefere");
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String userId = prefs.getString("userId");
    String name = prefs.getString("name");
    String email = prefs.getString("email");
    String phone = prefs.getString("phone");
    String type = prefs.getString("type");

    return User(
      userId: userId,
      name: name,
      email: email,
      phone: phone,
      type: type,
    );
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("name");
    prefs.remove("email");
    prefs.remove("phone");
    prefs.remove("type");
  }

  Future<String> getUserType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String type = prefs.getString('type');
    return type;
  }
}
