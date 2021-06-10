import 'dart:convert';

import 'package:eha_app/models/employer_mom.dart';
import 'package:eha_app/util/app_url.dart';
import 'package:http/http.dart' as http;

class EmployerMomService {
  Future<Map<String, dynamic>> createEmployerMom(
      EmployerMom employerMom) async {
    var result;
    final Map<String, dynamic> employerMomData = {
      "mom": employerMom.mom,
      "incomeProof": employerMom.incomeProof,
      "workPermitReceivers": employerMom.workPermitReceivers,
      "workPermitReceiverAddress": employerMom.workPermitReceiverAddress,
      "photos": employerMom.photos,
      "singnature": employerMom.singnature,
      "securityCode": employerMom.securityCode
    };

    var response = await http.post(
      Uri.parse(AppUrl.createEmployerMom),
      body: json.encode(employerMomData),
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

  Future<bool> updateEmployerMom(EmployerMom employerMom) async {
    var result;
    var response = await http.post(
      Uri.parse(AppUrl.updateEmployerMom),
      body: json.encode(employerMom.toJson()),
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

  Future<EmployerMom> getEmployerMom(String id) async {
    final Map<String, dynamic> idDdata = {
      "id": id,
    };
    var response = await http.post(
      Uri.parse(AppUrl.getEmployerMom),
      body: json.encode(idDdata),
      headers: {'Content-Type': 'application/json'},
    );
    final Map<String, dynamic> responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      var employer = EmployerMom.fromJson(responseData);
      return employer;
    } else {
      throw Exception("Faild to load EmployerMom");
    }
  }
}
