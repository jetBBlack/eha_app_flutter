import 'package:eha_app/models/helper.dart';
import 'package:eha_app/services_api/helper_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class HelperProvider extends ChangeNotifier {
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  HelperModel newHelper = new HelperModel();
  //EmploymentHistories history = new EmploymentHistories();
  List<YesNoQuestions> yesNoQuestions = <YesNoQuestions>[];
  List<Skills> skillList = <Skills>[];
  List<EmploymentHistories> employmentHistories = <EmploymentHistories>[];
  List<Medicals> medicalInfo = <Medicals>[];
  List<Photo> photoList = <Photo>[];
  PersonalInfo personalInfo = new PersonalInfo();
  OtherInfo otherInfo = new OtherInfo();

  // void setDuties(List<String> duties) {
  //   history.duties = duties;
  //   notifyListeners();
  // }

  // void setReason(String reason) {
  //   history.leavingReason = reason;
  //   notifyListeners();
  // }

  // String get startDate => history.startOn;
  // setStartDate(String date) {
  //   history.startOn = date;
  //   notifyListeners();
  // }

  // String get endDate => history.endOn;
  // setEndDate(String date) {
  //   history.endOn = date;
  //   notifyListeners();
  // }

  String get noLeavesPerMonth => otherInfo.noLeavesPerMonth;
  setnoLeavesPerMonth(String no) {
    otherInfo.noLeavesPerMonth = no;
    notifyListeners();
  }

  int get expectedSalary => otherInfo.expectedSalary;
  setexpectedSalary(int salary) {
    otherInfo.expectedSalary = salary;
    notifyListeners();
  }

  String get hasReleasePaper => otherInfo.hasReleasePaper;
  sethasReleasePaper(String value) {
    otherInfo.noLeavesPerMonth = value;
    notifyListeners();
  }

  String get earliestJoiningOn => otherInfo.earliestJoiningOn;
  setearliestJoiningOn(String date) {
    otherInfo.noLeavesPerMonth = date;
    notifyListeners();
  }

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

  //add data to Employment History List
  void setEmploymentHistory(EmploymentHistories employment) {
    employmentHistories.add(employment);
    notifyListeners();
  }

  void removeEmploymentHistory(int index) {
    employmentHistories.removeAt(index);
  }

  //add data to YesNoQuestion List
  setYesNoData(YesNoQuestions yesNoQuestion) {
    yesNoQuestions.add(yesNoQuestion);
    notifyListeners();
  }

  removeYesNoData(YesNoQuestions yesNoQuestion) {
    yesNoQuestions.removeWhere((item) => item.id == yesNoQuestion.id);
  }

  //add data to SkillLevel List
  setSkillLevelData(Skills newSkill) {
    skillList.add(newSkill);
    notifyListeners();
  }

  //add data to Medical Info List
  setMedicalInfoData(Medicals medical) {
    if (medicalInfo.contains(medical) == false) {
      medicalInfo.add(medical);
      notifyListeners();
    }
  }

  setFalseMedicalInfoData(Medicals medicals) {
    medicalInfo.removeWhere((item) => item.id == medicals.id);
    notifyListeners();
  }

  String get searchAble => newHelper.searchable;
  setsearchAble(String value) {
    newHelper.searchable = value;
    notifyListeners();
  }

  String get selfDescription => newHelper.selfDescription;
  setselfDescription(String string) {
    newHelper.selfDescription = string;
    notifyListeners();
  }

  //add photos
  addPhotoData(Photo photo) {
    photoList.add(photo);
    notifyListeners();
  }

  removePhotoData(int index) {
    photoList.removeAt(index);
    notifyListeners();
  }

  HelperService get _service => GetIt.I<HelperService>();
  Future<void> createHelperWithData(BuildContext context) async {
    newHelper.personalInfo = personalInfo;
    newHelper.yesNoQuestions = yesNoQuestions;
    newHelper.medicals = medicalInfo;
    newHelper.employmentHistories = employmentHistories;
    for (int i = 0; i < skillList.length - 1; i++) {
      for (int j = i + 1; j < skillList.length; j++) {
        if (skillList[i].id == skillList[j].id) {
          skillList.remove(skillList[i]);
          break;
        }
      }
    }
    newHelper.skills = skillList;
    for (int i = 0; i < employmentHistories.length; i++) {
      print(employmentHistories[i].leavingReason +
          ":" +
          employmentHistories[i].startOn);
    }
    final Map<String, dynamic> successfulMessage =
        await _service.createHelper(newHelper);
    if (successfulMessage['status']) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Helper Created',
            style: TextStyle(color: Colors.cyan, fontSize: 16),
          ),
        ),
      );
    } else {
      throw Exception('Failed to create Helper');
    }
    print('true');
    notifyListeners();
  }
}
