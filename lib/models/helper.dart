class HelperModel {
  PersonalInfo personalInfo;
  List<ContactNo> contactNo;
  SingaporeAddress singaporeAddress;
  OverseasAddress overseasAddress;
  String questionAnswer;
  String medicalInfo;
  String yesNo;
  String slider;
  String photo;
  String selfDescription;
  String otherInfo;
  String settings;
  String employmentHistory;
  String signature;

  HelperModel(
      {this.personalInfo,
      this.contactNo,
      this.singaporeAddress,
      this.overseasAddress,
      this.questionAnswer,
      this.medicalInfo,
      this.yesNo,
      this.slider,
      this.photo,
      this.selfDescription,
      this.otherInfo,
      this.settings,
      this.employmentHistory,
      this.signature});

  HelperModel.fromJson(Map<String, dynamic> json) {
    personalInfo = json['personalInfo'] != null
        ? new PersonalInfo.fromJson(json['personalInfo'])
        : null;
    if (json['contactNo'] != null) {
      List<ContactNo> contactNo = [];
      json['contactNo'].forEach((v) {
        contactNo.add(new ContactNo.fromJson(v));
      });
    }
    singaporeAddress = json['singaporeAddress'] != null
        ? new SingaporeAddress.fromJson(json['singaporeAddress'])
        : null;
    overseasAddress = json['overseasAddress'] != null
        ? new OverseasAddress.fromJson(json['overseasAddress'])
        : null;
    questionAnswer = json['questionAnswer'];
    medicalInfo = json['medicalInfo'];
    yesNo = json['yesNo'];
    slider = json['slider'];
    photo = json['photo'];
    selfDescription = json['selfDescription'];
    otherInfo = json['otherInfo'];
    settings = json['settings'];
    employmentHistory = json['employmentHistory'];
    signature = json['signature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.personalInfo != null) {
      data['personalInfo'] = this.personalInfo.toJson();
    }
    if (this.contactNo != null) {
      data['contactNo'] = this.contactNo.map((v) => v.toJson()).toList();
    }
    if (this.singaporeAddress != null) {
      data['singaporeAddress'] = this.singaporeAddress.toJson();
    }
    if (this.overseasAddress != null) {
      data['overseasAddress'] = this.overseasAddress.toJson();
    }
    data['questionAnswer'] = this.questionAnswer;
    data['medicalInfo'] = this.medicalInfo;
    data['yesNo'] = this.yesNo;
    data['slider'] = this.slider;
    data['photo'] = this.photo;
    data['selfDescription'] = this.selfDescription;
    data['otherInfo'] = this.otherInfo;
    data['settings'] = this.settings;
    data['employmentHistory'] = this.employmentHistory;
    data['signature'] = this.signature;
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

  factory PersonalInfo.fromJson(Map<String, dynamic> json) {
    return PersonalInfo(
      name: json['name'],
      gender: json['gender'],
      province: json['province'],
      nationality: json['nationality'],
      birthCountry: json['birthCountry'],
      maritalStatus: json['maritalStatus'],
    );
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

class ContactNo {
  String countryCode;
  String phoneNo;

  ContactNo({this.countryCode, this.phoneNo});

  ContactNo.fromJson(Map<String, dynamic> json) {
    countryCode = json['countryCode'];
    phoneNo = json['phoneNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countryCode'] = this.countryCode;
    data['phoneNo'] = this.phoneNo;
    return data;
  }
}

class SingaporeAddress {
  String blkNo;
  String unitNo;
  String floorNo;
  String streetName;
  String country;
  String postalCode;

  SingaporeAddress(
      {this.blkNo,
      this.unitNo,
      this.floorNo,
      this.streetName,
      this.country,
      this.postalCode});

  SingaporeAddress.fromJson(Map<String, dynamic> json) {
    blkNo = json['blkNo'];
    unitNo = json['unitNo'];
    floorNo = json['floorNo'];
    streetName = json['streetName'];
    country = json['country'];
    postalCode = json['postalCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blkNo'] = this.blkNo;
    data['unitNo'] = this.unitNo;
    data['floorNo'] = this.floorNo;
    data['streetName'] = this.streetName;
    data['country'] = this.country;
    data['postalCode'] = this.postalCode;
    return data;
  }
}

class OverseasAddress {
  String no;
  String streetName;
  String country;
  String postalCode;

  OverseasAddress({this.no, this.streetName, this.country, this.postalCode});

  OverseasAddress.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    streetName = json['streetName'];
    country = json['country'];
    postalCode = json['postalCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['streetName'] = this.streetName;
    data['country'] = this.country;
    data['postalCode'] = this.postalCode;
    return data;
  }
}
