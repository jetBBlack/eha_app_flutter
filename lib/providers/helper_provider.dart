import 'package:eha_app/models/helper.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart';

class HelperProvider extends ChangeNotifier {
  PersonalInfo personalInfo = new PersonalInfo();
  ContactNo contactNo = new ContactNo();
  SingaporeAddress singaporeAddress = new SingaporeAddress();
  OverseasAddress overseasAddress = new OverseasAddress();

  String get name => personalInfo.name;
  setname(String name) {
    personalInfo.name = name;
    notifyListeners();
  }

  String get gender => personalInfo.gender;
  setgender(String gender) {
    personalInfo.gender = gender;
    notifyListeners();
  }

  String get province => personalInfo.province;
  setprovince(String province) {
    personalInfo.province = province;
    notifyListeners();
  }

  String get nationality => personalInfo.nationality;
  setnationality(String national) {
    personalInfo.nationality = national;
    notifyListeners();
  }

  String get birthCountry => personalInfo.birthCountry;
  setbirthCountry(String birthCountry) {
    personalInfo.birthCountry = birthCountry;
    notifyListeners();
  }

  String get maritalStatus => personalInfo.maritalStatus;
  setmaritalStatus(String maritalStatus) {
    personalInfo.maritalStatus = maritalStatus;
    notifyListeners();
  }

  String get countryCode => contactNo.countryCode;
  setcountryCode(String countryCode) {
    contactNo.countryCode = countryCode;
    notifyListeners();
  }

  String get phoneNo => contactNo.phoneNo;
  setphoneNo(String phoneNo) {
    contactNo.phoneNo = phoneNo;
    notifyListeners();
  }

  String get blkNo => singaporeAddress.blkNo;
  setbklNo(String blkNo) {
    singaporeAddress.blkNo = blkNo;
    notifyListeners();
  }

  String get unitNo => singaporeAddress.unitNo;
  setunitNo(String unitNo) {
    singaporeAddress.unitNo = unitNo;
  }

  String get floorNo => singaporeAddress.floorNo;
  setfloorNo(String floorNo) {
    singaporeAddress.floorNo = floorNo;
  }

  String get streetName => singaporeAddress.streetName;
  setstreetName(String streetName) {
    singaporeAddress.streetName = streetName;
  }

  String get country => singaporeAddress.country;
  setcountry(String country) {
    singaporeAddress.country = country;
  }

  String get postalCode => singaporeAddress.postalCode;
  setpostalCode(String postalCode) {
    singaporeAddress.postalCode = postalCode;
  }
}
