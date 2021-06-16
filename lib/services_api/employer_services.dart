import 'dart:convert';

import 'package:eha_app/models/employer.dart';
import 'package:eha_app/util/app_url.dart';
import 'package:http/http.dart' as http;

class EmployerService {
  Future<Map<String, dynamic>> createEmployer(Employer employer) async {
    var result;
    final Map<String, dynamic> employerData = {
      "personalInfo": employer.personalInfo,
      "familyMember": employer.familyMember,
      "houseInfo": employer.houseInfo,
      "photo": employer.photo,
      "expectation": employer.expectation,
      "searchable": employer.searchable,
    };
    var response = await http.post(
      Uri.parse(AppUrl.createEmployer),
      body: json.encode(employerData),
      headers: {'Content-Type': 'application/json'},
    );

    final Map<String, dynamic> responseData = json.decode(response.body);
    if (response.statusCode == 201) {
      result = {
        'status': true,
        'id': responseData['id'],
      };
      return result;
    } else {
      result = {
        'status': false,
        'msg': responseData['err']['error'],
      };
      return result;
    }
  }

  Future<bool> updateEmployer(Employer employer) async {
    var result;
    var response = await http.post(
      Uri.parse(AppUrl.updateEmployer),
      body: json.encode(employer.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 204) {
      result = true;
    } else {
      result = false;
      throw Exception('Faild to update HelperMom');
    }
    return result;
  }

  Future<List> getEmployerList(
      int pageNumber, int pageSize, String orderBy) async {
    final Map<String, dynamic> requestData = {
      "orderBy": orderBy,
      "orderByPropertyName": "",
      "pageNumber": pageNumber,
      "pageSize": pageSize
    };

    var response = await http.post(
      Uri.parse(AppUrl.getEmployerList),
      body: json.encode(requestData),
      headers: {'Content-Type': 'application/json'},
    );
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      List<dynamic> body = responseData['items'];
      return body;
    } else {
      throw Exception("Failed to load helpers list");
    }
  }

  Future<Employer> getEmployerbyId(String id) async {
    final Map<String, dynamic> idData = {
      'id': id,
    };
    var response = await http.post(Uri.parse(AppUrl.getEmployer),
        body: json.encode(idData),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return Employer.fromJson(json.decode(response.body));
    } else {
      throw Exception("Faild to load Employer");
    }
  }
}
