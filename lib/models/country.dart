import 'dart:convert';

import 'package:flutter/services.dart';

class Country {
  String country;
  String code;

  Country({this.country, this.code});

  Country.fromJson(Map<String, dynamic> json)
      : country = json['country'],
        code = json['calling_code'];

  Map<String, dynamic> toJson() => {
        'name': country,
        'email': code,
      };

  Future<List<String>> getCountryName() async {
    List<String> countryNameList = [];
    final String response =
        await rootBundle.loadString('assets/country-by-calling-code.json');
    final List<dynamic> countries = json.decode(response.toString());
    for (var country in countries) {
      countryNameList.add(country['country']);
    }
    return countryNameList;
  }
}
