import 'package:eha_app/models/employer_mom.dart';
import 'package:eha_app/services_api/employer_mom_services.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class EmployerMomProvider extends ChangeNotifier {
  EmployerMomService get _service => GetIt.I<EmployerMomService>();
  EmployerMom newEmployerMom = new EmployerMom();
  Mom mom = new Mom();
  Passport passport = new Passport();
  IncomeProof incomeProof = new IncomeProof();
  WorkPermitReceiverAddress workPermitReceiverAddress =
      new WorkPermitReceiverAddress();
  List<Photos> photosList = <Photos>[];
  WorkPermitReceivers workPermitReceivers = WorkPermitReceivers();

  //mom
  String get name => mom.name;
  String get gender => mom.gender;
  String get dob => mom.dob;
  String get nricOrFin => mom.nricOrFin;
  String get nationality => mom.nationality;
  String get martialStatus => mom.martialStatus;
  String get houseType => mom.houseType;
  String get newOrReplaceHelper => mom.newOrReplaceHelper;
  String get residentStatus => mom.residentStatus;
  String get passportNo => mom.passport.no;
  String get passportExpireDate => mom.passport.expiredOn;
  String get passportIssueAt => mom.passport.issuedAt;

  setname(String value) {
    mom.name = value;
    notifyListeners();
  }

  setgender(String value) {
    mom.gender = value;
    notifyListeners();
  }

  setdob(String value) {
    mom.dob = value;
    notifyListeners();
  }

  setnricOrFin(String value) {
    mom.nricOrFin = value;
    notifyListeners();
  }

  setpassportNo(String no) {
    passport.no = no;
    notifyListeners();
  }

  setexpiredOn(String date) {
    passport.expiredOn = date;
    notifyListeners();
  }

  setissueAt(String date) {
    passport.issuedAt = date;
    notifyListeners();
  }

  setnationality(String value) {
    mom.nationality = value;
    notifyListeners();
  }

  setmartialStatus(String value) {
    mom.martialStatus = value;
    notifyListeners();
  }

  sethouseType(String value) {
    mom.houseType = value;
    notifyListeners();
  }

  setnewOrReplaceHelper(String value) {
    mom.newOrReplaceHelper = value;
    notifyListeners();
  }

  setresidentStatus(String value) {
    mom.residentStatus = value;
    notifyListeners();
  }

  //WorkPermitReceicerAdd
  String get blkNo => workPermitReceiverAddress.blkNo;
  String get unitNo => workPermitReceiverAddress.unitNo;
  String get floorNo => workPermitReceiverAddress.floorNo;
  String get streetName => workPermitReceiverAddress.streetName;
  String get country => workPermitReceiverAddress.country;
  String get postalCode => workPermitReceiverAddress.postalCode;

  setblkNo(String value) {
    workPermitReceiverAddress.blkNo = value;
    notifyListeners();
  }

  setunitNo(String value) {
    workPermitReceiverAddress.unitNo = value;
    notifyListeners();
  }

  setfloorNo(String value) {
    workPermitReceiverAddress.floorNo = value;
    notifyListeners();
  }

  setstreetName(String value) {
    workPermitReceiverAddress.streetName = value;
    notifyListeners();
  }

  setcountry(String value) {
    workPermitReceiverAddress.country = value;
    notifyListeners();
  }

  setpostalCode(String value) {
    workPermitReceiverAddress.postalCode = value;
    notifyListeners();
  }

  //WorkPermitReceiversInfo
  String get wpName => workPermitReceivers.name;
  String get nricFin => workPermitReceivers.nricFin;
  ContactNo get contactNo => workPermitReceivers.contactNo;
}
