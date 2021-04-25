import 'dart:async';
import 'dart:convert';

import 'package:eha_app/models/register_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:eha_app/util/app_url.dart';
import 'package:http/http.dart';

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
    final queryParam = {"username": email, "password": password};
    var url = Uri.http(AppUrl.baseUrl, 'api/login', queryParam);

    var response = await http.get(url);
    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

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

      result = {'status': false, 'error': 'Invalid username/passowrd'};
      return result;
    }
  }

  Future<Map<String, dynamic>> register(
      RegisterRequestModel registerRequest) async {
    final Map<String, dynamic> registrationData = {
      'registerType': registerRequest.registerType,
      'name': registerRequest.name,
      'password': registerRequest.password,
      'emailInfo': registerRequest.emailInfo,
      'contactNoInfo': registerRequest.contactNoInfo,
      'avator': registerRequest.avator,
      'lastLogin': registerRequest.lastLogin,
    };

    return await http
        .post(Uri.parse(AppUrl.registerUrl),
            body: registrationData,
            headers: {'Content-Type': 'application/json'})
        .then(onValue)
        .catchError(onError);
  }

  static Future<FutureOr> onValue(Response response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      result = {
        'status': true,
        'message': 'Successfully registered',
      };
    } else {
      result = {
        'status': false,
        'message': 'Registration failed',
        'data': responseData
      };
    }
    return result;
  }

  static onError(error) {
    print("the error is $error.detail");
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}
