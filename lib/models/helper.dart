class HelperModel {
  PersonalInfo personalInfo;
  List<YesNoQuestions> yesNoQuestions;
  List<Medicals> medicals;
  List<Skills> skills;
  List<EmploymentHistories> employmentHistories;
  OtherInfo otherInfo;
  String selfDescription;
  List<Photo> photo;
  String searchable;
  String agencyId;

  HelperModel(
      {this.personalInfo,
      this.yesNoQuestions,
      this.medicals,
      this.skills,
      this.employmentHistories,
      this.otherInfo,
      this.selfDescription,
      this.photo,
      this.searchable,
      this.agencyId});

  HelperModel.fromJson(Map<String, dynamic> json) {
    personalInfo = json['personalInfo'] != null
        ? new PersonalInfo.fromJson(json['personalInfo'])
        : null;
    if (json['yesNoQuestions'] != null) {
      List<YesNoQuestions> yesNoQuestions = [];
      json['yesNoQuestions'].forEach((v) {
        yesNoQuestions.add(new YesNoQuestions.fromJson(v));
      });
    }
    if (json['medicals'] != null) {
      List<Medicals> medicals = [];
      json['medicals'].forEach((v) {
        medicals.add(new Medicals.fromJson(v));
      });
    }
    if (json['skills'] != null) {
      List<Skills> skills = [];
      json['skills'].forEach((v) {
        skills.add(new Skills.fromJson(v));
      });
    }
    if (json['employmentHistories'] != null) {
      List<EmploymentHistories> employmentHistories = [];
      json['employmentHistories'].forEach((v) {
        employmentHistories.add(new EmploymentHistories.fromJson(v));
      });
    }
    otherInfo = json['otherInfo'] != null
        ? new OtherInfo.fromJson(json['otherInfo'])
        : null;
    selfDescription = json['selfDescription'];
    if (json['photo'] != null) {
      List<Photo> photo = [];
      json['photo'].forEach((v) {
        photo.add(new Photo.fromJson(v));
      });
    }
    searchable = json['searchable'];
    agencyId = json['agencyId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.personalInfo != null) {
      data['personalInfo'] = this.personalInfo.toJson();
    }
    if (this.yesNoQuestions != null) {
      data['yesNoQuestions'] =
          this.yesNoQuestions.map((v) => v.toJson()).toList();
    }
    if (this.medicals != null) {
      data['medicals'] = this.medicals.map((v) => v.toJson()).toList();
    }
    if (this.skills != null) {
      data['skills'] = this.skills.map((v) => v.toJson()).toList();
    }
    if (this.employmentHistories != null) {
      data['employmentHistories'] =
          this.employmentHistories.map((v) => v.toJson()).toList();
    }
    if (this.otherInfo != null) {
      data['otherInfo'] = this.otherInfo.toJson();
    }
    data['selfDescription'] = this.selfDescription;
    if (this.photo != null) {
      data['photo'] = this.photo.map((v) => v.toJson()).toList();
    }
    data['searchable'] = this.searchable;
    data['agencyId'] = this.agencyId;
    return data;
  }
}

class PersonalInfo {
  String name;
  String gender;
  String province;
  String nationality;
  String birthCountry;
  String maritalStatus;

  PersonalInfo(
      {this.name,
      this.gender,
      this.province,
      this.nationality,
      this.birthCountry,
      this.maritalStatus});

  PersonalInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    gender = json['gender'];
    province = json['province'];
    nationality = json['nationality'];
    birthCountry = json['birthCountry'];
    maritalStatus = json['maritalStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['province'] = this.province;
    data['nationality'] = this.nationality;
    data['birthCountry'] = this.birthCountry;
    data['maritalStatus'] = this.maritalStatus;
    return data;
  }
}

class YesNoQuestions {
  String id;
  String value;

  YesNoQuestions({this.id, this.value});

  YesNoQuestions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    return data;
  }
}

class Medicals {
  String id;
  String value;

  Medicals({this.id, this.value});
  Medicals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    return data;
  }
}

class Skills {
  String id;
  String value;

  Skills({this.id, this.value});

  Skills.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    return data;
  }
}

class EmploymentHistories {
  String startOn;
  String endOn;
  List<String> duties;
  String leavingReason;

  EmploymentHistories(
      {this.startOn, this.endOn, this.duties, this.leavingReason});

  EmploymentHistories.fromJson(Map<String, dynamic> json) {
    startOn = json['startOn'];
    endOn = json['endOn'];
    duties = json['duties'].cast<String>();
    leavingReason = json['leavingReason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startOn'] = this.startOn;
    data['endOn'] = this.endOn;
    data['duties'] = this.duties;
    data['leavingReason'] = this.leavingReason;
    return data;
  }
}

class OtherInfo {
  String noLeavesPerMonth;
  int expectedSalary;
  String hasReleasePaper;
  String earliestJoiningOn;

  OtherInfo(
      {this.noLeavesPerMonth,
      this.expectedSalary,
      this.hasReleasePaper,
      this.earliestJoiningOn});

  OtherInfo.fromJson(Map<String, dynamic> json) {
    noLeavesPerMonth = json['noLeavesPerMonth'];
    expectedSalary = json['expectedSalary'];
    hasReleasePaper = json['hasReleasePaper'];
    earliestJoiningOn = json['earliestJoiningOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['noLeavesPerMonth'] = this.noLeavesPerMonth;
    data['expectedSalary'] = this.expectedSalary;
    data['hasReleasePaper'] = this.hasReleasePaper;
    data['earliestJoiningOn'] = this.earliestJoiningOn;
    return data;
  }
}

class Photo {
  String fileName;
  String mimeType;
  int order;

  Photo({this.fileName, this.mimeType, this.order});

  Photo.fromJson(Map<String, dynamic> json) {
    fileName = json['fileName'];
    mimeType = json['mimeType'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileName'] = this.fileName;
    data['mimeType'] = this.mimeType;
    data['order'] = this.order;
    return data;
  }
}
