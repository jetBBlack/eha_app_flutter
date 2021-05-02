import 'dart:async';
import 'dart:convert';

import 'package:eha_app/models/register_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:eha_app/util/app_url.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProvider extends ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;
  Status get registeredInStatus => _registeredInStatus;

  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;
    final Map<String, dynamic> loginData = {
      "username": email,
      "password": password
    };

    var response = await http.post(Uri.parse(AppUrl.loginUrl),
        body: json.encode(loginData),
        headers: {'Content-Type': 'application/json'});
    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    final Map<String, dynamic> responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      result = {
        'status': responseData['success'],
        'token': responseData['data']['token'],
      };

      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      return result;
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();

      result = {'status': false, 'error': responseData['err']['message']};
      return result;
    }
  }

  Future<Map<String, dynamic>> register(
      RegisterRequestModel registerRequest) async {
    var result;
    final Map<String, dynamic> registrationData = {
      'name': registerRequest.name,
      'password': registerRequest.password,
      'emailAddress': registerRequest.emailAddress,
      'contactNo': registerRequest.contactNo,
    };

    var response = await http.post(Uri.parse(AppUrl.registerUrl),
        body: json.encode(registrationData),
        headers: {'Content-Type': 'application/json'});

    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      result = {
        'status': true,
        'message': 'Successful',
      };
    } else {
      result = {
        'status': false,
        'error': 'Registration failed',
        'message': responseData['err']['message'],
      };
    }
    return result;
  }
}
