import 'package:eha_app/models/employer.dart';
import 'package:eha_app/services_api/employer_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class EmployerProvider extends ChangeNotifier {
  EmployerService get _service => GetIt.I<EmployerService>();
  Employer newEmployer = new Employer(searchable: "yes");
  PersonalInfo personalInfo = new PersonalInfo();
  EthnicGroup ethnicGroup = new EthnicGroup();
  FamilyMember familyMember =
      new FamilyMember(stayWithParent: true, stayWithParentInLaw: true);
  List<FamilyMembers> familyMembers = [];
  HouseInfo houseInfo = new HouseInfo();
  List<Photo> photosList = <Photo>[];
  Expectation expectation = new Expectation();

  final GlobalKey<FormState> personalFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> houseFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> expectationKey = GlobalKey<FormState>();

  //Personal Infomation
  String get name => personalInfo.name;
  setName(String name) {
    personalInfo.name = name;
    notifyListeners();
  }

  String get gender => personalInfo.gender;
  setGender(String gender) {
    personalInfo.gender = gender;
    notifyListeners();
  }

  String get maritalStatus => personalInfo.maritalStatus;
  setMaritalStatus(String status) {
    personalInfo.maritalStatus = status;
    notifyListeners();
  }

  String get nationality => personalInfo.nationality;
  setNationality(String nationality) {
    personalInfo.nationality = nationality;
    notifyListeners();
  }

  String get religion => personalInfo.religion;
  setReligion(String religion) {
    personalInfo.religion = religion;
    notifyListeners();
  }

  String get groupId => ethnicGroup.id;
  setGroupId(String id) {
    ethnicGroup.id = id;
    notifyListeners();
  }

  String get groudValue => ethnicGroup.value;
  setGroupValue(String value) {
    ethnicGroup.value = value;
    notifyListeners();
  }

  //FamilyMember
  bool get stayWithParent => familyMember.stayWithParent;
  setStayWithParent(bool value) {
    familyMember.stayWithParent = value;
    notifyListeners();
  }

  bool get stayWithParentInLaw => familyMember.stayWithParentInLaw;
  setStayWithParentInLaw(bool value) {
    familyMember.stayWithParentInLaw = value;
    notifyListeners();
  }

  List get familyMembersList => familyMember.familyMembers;
  setFamilyMembersData(FamilyMembers member) {
    familyMembers.add(member);
    notifyListeners();
  }

  removeFamilyMember(int index) {
    familyMembers.removeAt(index);
    notifyListeners();
  }

  //House Infomation
  String get houseType => houseInfo.houseType;
  setHouseType(String houseType) {
    houseInfo.houseType = houseType;
    notifyListeners();
  }

  String get noOfRooms {
    if (houseInfo.noOfRooms == null) {
      return "";
    } else {
      return houseInfo.noOfRooms.toString();
    }
  }

  setNoOfRooms(int no) {
    houseInfo.noOfRooms = no;
    notifyListeners();
  }

  String get noOfBathrooms {
    if (houseInfo.noOfBathrooms == null) {
      return "";
    } else {
      return houseInfo.noOfBathrooms.toString();
    }
  }

  setNoOfBathRooms(int value) {
    houseInfo.noOfBathrooms = value;
    notifyListeners();
  }

  String get noOfToilets {
    if (houseInfo.noOfToilets == null) {
      return "";
    } else {
      return houseInfo.noOfToilets.toString();
    }
  }

  setNoOfToilets(int value) {
    houseInfo.noOfToilets = value;
    notifyListeners();
  }

  String get noOfFloors {
    if (houseInfo.noOfFloors == null) {
      return "";
    } else {
      return houseInfo.noOfFloors.toString();
    }
  }

  setNoOfFloors(int value) {
    houseInfo.noOfFloors = value;
    notifyListeners();
  }

  //Expextation Infomation
  String get offerSalary {
    if (expectation.offerSalary == null) {
      return "";
    } else {
      return expectation.offerSalary.toString();
    }
  }

  setOfferSalary(int salary) {
    expectation.offerSalary = salary;
    notifyListeners();
  }

  String get firstPriority => expectation.firstPriority;
  setFirstPriority(String priority) {
    expectation.firstPriority = priority;
    notifyListeners();
  }

  String get secondPriority => expectation.secondPriority;
  setSecondPriority(String priority) {
    expectation.secondPriority = priority;
    notifyListeners();
  }

  String get thirdPriority => expectation.thirdPriority;
  setThirdPriority(String priority) {
    expectation.thirdPriority = priority;
    notifyListeners();
  }

  String get helperJoinOn => expectation.helperJoinOn;
  setHelperJoinOn(String date) {
    expectation.firstPriority = date;
    notifyListeners();
  }

  String get expectationInfo => expectation.expectation;
  setExpectationInfo(String value) {
    expectation.expectation = value;
    notifyListeners();
  }

  String get nonExpectation => expectation.nonExpectation;
  setNonExpectation(String value) {
    expectation.nonExpectation = value;
    notifyListeners();
  }

  List get dutiesList => expectation.duties;
  setDuties(List<String> duties) {
    expectation.duties = duties;
    notifyListeners();
  }

  //Photos
  addPhotoData(Photo photo) {
    photosList.add(photo);
    notifyListeners();
  }

  removePhotoData(int index) {
    photosList.removeAt(index);
    notifyListeners();
  }

  String get searchAble => newEmployer.searchable;
  setSearchAble(String value) {
    newEmployer.searchable = value;
    notifyListeners();
  }

  Future<void> createEmployerWithData(BuildContext context) async {
    for (var item in expectation.duties) {
      print(item);
    }
    personalInfo.ethnicGroup = ethnicGroup;
    familyMember.familyMembers = familyMembers;
    newEmployer.personalInfo = personalInfo;
    newEmployer.familyMember = familyMember;
    newEmployer.houseInfo = houseInfo;
    newEmployer.expectation = expectation;
    newEmployer.photo = photosList;
    if (personalFormKey.currentState.validate() &&
        expectationKey.currentState.validate() &&
        houseFormKey.currentState.validate()) {
      final Map<String, dynamic> successfulMessage =
          await _service.createEmployer(newEmployer);
      if (successfulMessage['status']) {
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setString('helper-id', successfulMessage['id'].toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 10),
            content: Text(
              'Employer Created',
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
