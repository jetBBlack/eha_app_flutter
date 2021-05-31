import 'package:eha_app/models/helper_mom.dart';
import 'package:eha_app/services_api/helper_mom_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperMomProvider extends ChangeNotifier {
  final GlobalKey<FormState> globalHelperMomFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> globalHelperMomFormKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> globalHelperMomFormKey2 = GlobalKey<FormState>();
  final GlobalKey<FormState> globalHelperMomFormKey3 = GlobalKey<FormState>();
  HelperMomModel helperMom = new HelperMomModel();
  Mom mom = new Mom();
  Spouse spouse = new Spouse();
  Malaysia malaysia = new Malaysia();
  List<Photo> photoList = <Photo>[];

  String get name => mom.name;
  setname(String name) {
    mom.name = name;
    notifyListeners();
  }

  String get fin => mom.fin;
  setfin(String fin) {
    mom.fin = fin;
    notifyListeners();
  }

  String get workPromoteNo => mom.workPromoteNo;
  setworkPromoteNo(String workPromoteNo) {
    mom.workPromoteNo = workPromoteNo;
    notifyListeners();
  }

  String get citizen => mom.citizenGrantedOnState;
  setcitizen(String citizen) {
    mom.citizenGrantedOnState = citizen;
    notifyListeners();
  }

  String get passportNo => mom.passportNo;
  setpassportNo(String passportNo) {
    mom.passportNo = passportNo;
  }

  String get passportExpireDate => mom.passportExpiredOn;
  setpassportExpireDate(String date) {
    mom.passportNo = date;
  }

  String get gender => mom.gender;
  setgender(String gender) {
    mom.gender = gender;
    notifyListeners();
  }

  String get passType => mom.immigrationPassType;
  setpassType(String passType) {
    mom.immigrationPassType = passType;
    notifyListeners();
  }

  String get educaton => mom.has8YearsEducation;
  seteducation(String education) {
    mom.has8YearsEducation = education;
    notifyListeners();
  }

  String get educationLevel => mom.educationLevel;
  seteducationlevel(String educationLevel) {
    mom.educationLevel = educationLevel;
    notifyListeners();
  }

  String get marriedDate => mom.marriedOn;
  setmarriedDate(String date) {
    mom.marriedOn = date;
    notifyListeners();
  }

  String get maritalStatus => mom.maritalStatus;
  setmaritalStatus(String status) {
    mom.maritalStatus = status;
    notifyListeners();
  }

  String get birthCountry => mom.birthCountry;
  setbirthCountry(String country) {
    mom.birthCountry = country;
    notifyListeners();
  }

  String get nationality => mom.nationality;
  setnationality(String national) {
    mom.nationality = national;
    notifyListeners();
  }

  String get ethnicGroup => mom.ethnicGroup;
  setethnicGroup(String group) {
    mom.ethnicGroup = group;
    notifyListeners();
  }

  String get spouseName => spouse.name;
  setspouseName(String name) {
    spouse.name = name;
  }

  String get spouseNric => spouse.nricOnFin;
  setspouseNric(String name) {
    spouse.nricOnFin = name;
  }

  String get spouseMarriedOn => spouse.marriedOn;
  setspouseMarriedOn(String date) {
    spouse.marriedOn = date;
  }

  String get no => malaysia.no;
  setno(String no) {
    malaysia.no = no;
    notifyListeners();
  }

  String get colour => malaysia.colour;
  setcolour(String colour) {
    malaysia.colour = colour;
    notifyListeners();
  }

  String get signature => helperMom.signature;
  setsignature(String signature) {
    helperMom.signature = signature;
    notifyListeners();
  }

  String get code => helperMom.code;
  setcode(String code) {
    helperMom.code = code;
    notifyListeners();
  }

  addPhotoData(Photo photo) {
    photoList.add(photo);
  }

  HelperMomService get service => GetIt.I<HelperMomService>();
  void createHelperWithData(BuildContext context) {
    helperMom.mom = mom;
    helperMom.malaysia = malaysia;
    helperMom.photo = photoList;
    final Future<Map<String, dynamic>> successfulMessage =
        service.createHelper(helperMom);
    successfulMessage.then((response) async {
      if (response['status']) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('C')));
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(mom.name, response['id']);
      } else {
        throw Exception('Failed to create Helper');
      }
    });
    notifyListeners();
  }
}
