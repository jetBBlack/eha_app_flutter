import 'dart:convert';

import 'package:eha_app/models/helper_mom.dart';
import 'package:eha_app/util/app_url.dart';
import 'package:http/http.dart' as http;

class HelperMomService {
  Future<Map<String, dynamic>> createHelper(HelperMomModel helperMom) async {
    var result;
    final Map<String, dynamic> helperMomData = {
      "mom": helperMom.mom,
      "malaysia": helperMom.malaysia,
      "spouse": helperMom.spouse,
      "photo": helperMom.photo,
      "signature": helperMom.signature,
      "code": helperMom.code,
    };

    var response = await http.post(
      Uri.parse(AppUrl.createHelper),
      body: json.encode(helperMomData),
      headers: {'Content-Type': 'application/json'},
    );

    final Map<String, dynamic> responseData = json.decode(response.body);
    if (response.statusCode == 201) {
      result = {
        'status': true,
        'id:': responseData['id'],
      };
    } else {
      result = {
        'status': false,
        'id:': responseData['err']['error'],
      };
    }
    return result;
  }

  Future<HelperMomModel> getHelperMom(String id) async {
    final Map<String, dynamic> idData = {
      'id': id,
    };
    var response = await http.post(
      Uri.parse(AppUrl.getHelperMom),
      body: json.encode(idData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return HelperMomModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Faild to load HelperMom");
    }
  }

  Future updateHelperMom(String id, HelperMomModel helperMom) async {
    var result;
    final Map<String, dynamic> helperMomData = {
      "mom": helperMom.mom,
      "malaysia": helperMom.malaysia,
      "spouse": helperMom.spouse,
      "photo": helperMom.photo,
      "signature": helperMom.signature,
      "code": helperMom.code,
      "id": id,
    };

    var response = await http.post(
      Uri.parse(AppUrl.updateHelper),
      body: json.encode(helperMomData),
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
}
