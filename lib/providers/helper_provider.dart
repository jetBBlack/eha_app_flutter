import 'package:eha_app/models/helper.dart';
import 'package:eha_app/services_api/helper_services.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperProvider extends ChangeNotifier {
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  HelperModel newHelper = new HelperModel();
  List<YesNoQuestions> yesNoQuestions = <YesNoQuestions>[];
  PersonalInfo personalInfo = new PersonalInfo();
  List<EmploymentHistories> employmentHistories;

  //SingaporeAddress singaporeAddress = new SingaporeAddress();
  //OverseasAddress overseasAddress = new OverseasAddress();

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

  //add contact info
  String get contactInfo => newHelper.contactInfo;
  setcontactNo(String contactInfo) {
    newHelper.contactInfo = contactInfo;
    notifyListeners();
  }

  String get dayOfBirth => newHelper.contactInfo;
  setdayOfBirth(String dayOfBirth) {
    newHelper.dob = dayOfBirth;
    notifyListeners();
  }

  String get agencyId => newHelper.agencyId;
  setagencyId(String id) {
    newHelper.agencyId = id;
    notifyListeners();
  }

  setEmploymentHistory(EmploymentHistories employment) {
    employmentHistories.add(employment);
    notifyListeners();
  }

  //add data to YesNoQuestion List
  setYesNoData(YesNoQuestions yesNoQuestion) {
    yesNoQuestions.add(yesNoQuestion);
    notifyListeners();
  }

  //add data to SkillLevel List
  setSkillLevelData(Skills skill) {
    newHelper.skills.add(skill);
    notifyListeners();
  }

  //add data to Medical Info List
  setMedicalInfoData(Medicals medical) {
    newHelper.medicals.add(medical);
    notifyListeners();
  }

  //add data to Employment History List

  // String get countryCode => contactNo.countryCode;
  // setcountryCode(String countryCode) {
  //   if (country.isNotEmpty) {
  //     contactNo.countryCode = countryCode;
  //     _error = null;
  //   } else {
  //     _error = "Must not be empty";
  //   }
  //   notifyListeners();
  // }

  // String get phoneNo => contactNo.phoneNo;
  // setphoneNo(String phoneNo) {
  //   if (phoneNo.isNotEmpty) {
  //     contactNo.phoneNo = phoneNo;
  //     _error = null;
  //   } else {
  //     _error = "Must not be empty";
  //   }
  //   notifyListeners();
  // }

  // String get blkNo => singaporeAddress.blkNo;
  // setbklNo(String blkNo) {
  //   singaporeAddress.blkNo = blkNo;
  //   notifyListeners();
  // }

  // String get unitNo => singaporeAddress.unitNo;
  // setunitNo(String unitNo) {
  //   singaporeAddress.unitNo = unitNo;
  //   notifyListeners();
  // }

  // String get floorNo => singaporeAddress.floorNo;
  // setfloorNo(String floorNo) {
  //   singaporeAddress.floorNo = floorNo;
  //   notifyListeners();
  // }

  // String get streetName => singaporeAddress.streetName;
  // setstreetName(String streetName) {
  //   singaporeAddress.streetName = streetName;
  //   notifyListeners();
  // }

  // String get country => singaporeAddress.country;
  // setcountry(String country) {
  //   singaporeAddress.country = country;
  //   notifyListeners();
  // }

  // String get postalCode => singaporeAddress.postalCode;
  // setpostalCode(String postalCode) {
  //   singaporeAddress.postalCode = postalCode;
  //   notifyListeners();
  // }

  // String get no => overseasAddress.no;
  // setno(String no) {
  //   overseasAddress.no = no;
  //   notifyListeners();
  // }

  // String get seaCountry => overseasAddress.country;
  // setoverseaCountry(String seaCountry) {
  //   overseasAddress.country = seaCountry;
  //   notifyListeners();
  // }

  // String get seaStreetName => overseasAddress.streetName;
  // setseaStreetName(String streetName) {
  //   overseasAddress.streetName = streetName;
  //   notifyListeners();
  // }

  // String get seaPostalCode => overseasAddress.postalCode;
  // setseaPostalCode(String postalCode) {
  //   overseasAddress.postalCode = postalCode;
  //   notifyListeners();
  // }

  HelperService _service = new HelperService();
  void createHelperWithData() {
    newHelper.personalInfo = personalInfo;
    final Future<Map<String, dynamic>> successfulMessage =
        _service.createHelper(newHelper);
    successfulMessage.then((response) async {
      if (response['status']) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('userID', response['id']);
      } else {
        throw Exception('Failed to create Helper');
      }
    });
    notifyListeners();
  }
}
