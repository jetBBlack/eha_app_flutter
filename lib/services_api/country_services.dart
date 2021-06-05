import 'dart:convert';

import 'package:flutter/services.dart';

class Country {
  Future<List<String>> getCountryName() async {
    List<String> countryNameList = [];
    final String response =
        await rootBundle.loadString('assets/country-by-calling-code.json');
    final List<dynamic> countries = json.decode(response.toString());
    for (var country in countries) {
      Map<String, dynamic> responseItem = country;
      countryNameList.add(responseItem['country']);
    }
    return countryNameList;
  }

  Future<List<String>> getCountryCode() async {
    List<String> countryCodeList = [];
    final String response =
        await rootBundle.loadString('assets/country-by-calling-code.json');
    final List<dynamic> countries = json.decode(response.toString());
    for (var country in countries) {
      Map<String, dynamic> responseItem = country;
      countryCodeList.add("+" + responseItem['calling_code'].toString());
    }
    return countryCodeList;
  }
}
