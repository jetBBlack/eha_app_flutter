import 'package:eha_app/models/helper.dart';
import 'package:eha_app/services_api/helper_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperProvider extends ChangeNotifier {
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  HelperModel newHelper = new HelperModel();
  List<YesNoQuestions> yesNoQuestions = <YesNoQuestions>[];
  List<Skills> skillList = <Skills>[];
  List<EmploymentHistories> employmentHistories = <EmploymentHistories>[];
  List<Medicals> medicalInfo = <Medicals>[];
  List<Photo> photoList = <Photo>[];
  PersonalInfo personalInfo = new PersonalInfo();
  OtherInfo otherInfo = new OtherInfo();

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
    otherInfo.hasReleasePaper = value;
    notifyListeners();
  }

  String get earliestJoiningOn => otherInfo.earliestJoiningOn;
  setearliestJoiningOn(String date) {
    otherInfo.earliestJoiningOn = date;
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

  String get dayOfBirth => newHelper.dob;
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
  setEmploymentHistory(EmploymentHistories employment) {
    employmentHistories.add(employment);
    notifyListeners();
  }

  removeEmploymentHistory(int index) {
    employmentHistories.removeAt(index);
    notifyListeners();
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

  void removeDuplicateItem(List items) {
    for (int i = 0; i < items.length - 1; i++) {
      for (int j = i + 1; j < items.length; j++) {
        if (items[i].id == items[j].id && items[i].value == items[j].value) {
          skillList.remove(skillList[i]);
          break;
        }
      }
    }
  }

  HelperService get _service => GetIt.I<HelperService>();
  Future<void> createHelperWithData(BuildContext context) async {
    removeDuplicateItem(medicalInfo);
    removeDuplicateItem(yesNoQuestions);
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
    newHelper.otherInfo = otherInfo;
    newHelper.photo = photoList;
    final Map<String, dynamic> successfulMessage =
        await _service.createHelper(newHelper);
    if (successfulMessage['status']) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('helper-id', successfulMessage['id'].toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 10),
          content: Text(
            'Helper Created',
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
