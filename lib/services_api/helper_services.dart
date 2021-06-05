import 'dart:convert';

import 'package:eha_app/util/app_url.dart';
import 'package:eha_app/models/helper.dart';
import 'package:http/http.dart' as http;

class HelperService {
  Future<HelperModel> getHelperbyId(String id) async {
    final Map<String, dynamic> idData = {
      'id': id,
    };
    var response = await http.post(Uri.parse(AppUrl.getHelper),
        body: json.encode(idData),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return HelperModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Faild to load Helper");
    }
  }

  Future<Map<String, dynamic>> createHelper(HelperModel helper) async {
    var result;
    final Map<String, dynamic> helperData = {
      'personalInfo': helper.personalInfo,
      //'contactNo': helper.contactNo,
      //'singaporeAddress': helper.singaporeAddress,
      //'overseasAddress': helper.overseasAddress,
      'yesNoQuestions': helper.yesNoQuestions,
      'medicals': helper.medicals,
      'skills': helper.skills,
      'employmentHistories': helper.employmentHistories,
      'otherInfo': helper.otherInfo,
      'selfDescription': helper.selfDescription,
      'photo': helper.photo,
      'searchable': helper.searchable,
      'agencyId': helper.agencyId,
    };
    var response = await http.post(Uri.parse(AppUrl.createHelper),
        body: json.encode(helperData),
        headers: {'Content-Type': 'application/json'});

    final Map<String, dynamic> responseData = json.decode(response.body);
    if (response.statusCode == 201) {
      print('created');
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

  Future deleteHelper() async {}
}
