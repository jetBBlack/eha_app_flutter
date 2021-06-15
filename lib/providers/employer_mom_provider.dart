import 'package:eha_app/models/employer_mom.dart';
import 'package:eha_app/services_api/employer_mom_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  List<WorkPermitReceivers> wpList = <WorkPermitReceivers>[];
  WorkPermitReceivers workPermitReceivers = WorkPermitReceivers();
  ContactNo contactNo = new ContactNo(countryId: "+65");

  //Form Key
  GlobalKey<FormState> wpFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> incomeFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> momFormKey = GlobalKey<FormState>();
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
  String get passportNo => passport.no;
  String get passportExpireDate => passport.expiredOn;
  String get passportIssueAt => passport.issuedAt;

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
  String get countryId => contactNo.countryId;
  String get contactNumber => contactNo.no;

  setwpName(String value) {
    workPermitReceivers.name = value;
    notifyListeners();
  }

  setnricFin(String value) {
    workPermitReceivers.nricFin = value;
    notifyListeners();
  }

  setCountryId(String id) {
    contactNo.countryId = id;
    notifyListeners();
  }

  setContactNumber(String no) {
    contactNo.no = no;
    notifyListeners();
  }

  //IncomeProof

  String get monthlyIncome {
    if (incomeProof.monthlyIncome == null) {
      return "";
    } else {
      return incomeProof.monthlyIncome.toString();
    }
  }

  String get spouseIncome {
    if (incomeProof.spouseIncome == null) {
      return "";
    } else {
      return incomeProof.spouseIncome.toString();
    }
  }

  String get incomeProofInfo => incomeProof.incomeProof;

  setMonthlyIncome(int income) {
    incomeProof.monthlyIncome = income;
    notifyListeners();
  }

  setSpouseIncome(int income) {
    incomeProof.spouseIncome = income;
    notifyListeners();
  }

  setIncomeProofInfo(String value) {
    incomeProof.incomeProof = value;
    notifyListeners();
  }

  //Photos
  setPhotosData(Photos photos) {
    photosList.add(photos);
    notifyListeners();
  }

  removePhotos(int index) {
    photosList.removeAt(index);
    notifyListeners();
  }

  setSignature(String signature) {
    newEmployerMom.singnature = signature;
    notifyListeners();
  }

  String get sercurityCode => newEmployerMom.securityCode;
  setSecurityCode(String code) {
    newEmployerMom.securityCode = code;
    notifyListeners();
  }

  Future<void> createEmployerMomWithData(BuildContext context) async {
    mom.passport = passport;
    workPermitReceivers.contactNo = contactNo;
    wpList.add(workPermitReceivers);
    newEmployerMom.mom = mom;
    newEmployerMom.incomeProof = incomeProof;
    newEmployerMom.workPermitReceiverAddress = workPermitReceiverAddress;
    newEmployerMom.photos = photosList;
    newEmployerMom.workPermitReceivers = wpList;

    if (momFormKey.currentState.validate() &&
        incomeFormKey.currentState.validate() &&
        wpFormKey.currentState.validate()) {
      final Map<String, dynamic> successfulMessage =
          await _service.createEmployerMom(newEmployerMom);
      if (successfulMessage['status']) {
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setString('helper-id', successfulMessage['id'].toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            padding: EdgeInsets.symmetric(horizontal: 20),
            duration: Duration(seconds: 8),
            content: Text(
              'Employer Mom Created',
              style: TextStyle(color: Colors.cyan, fontSize: 16),
            ),
          ),
        );
      } else {
        throw Exception('Failed to create Helper');
      }
      notifyListeners();
    }
  }
}
