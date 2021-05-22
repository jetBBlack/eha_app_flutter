class Employer {
  PersonalInfo personalInfo;
  FamilyMember familyMember;
  HouseInfo houseInfo;
  List<Photo> photo;
  Expectation expectation;
  String searchable;

  Employer(
      {this.personalInfo,
      this.familyMember,
      this.houseInfo,
      this.photo,
      this.expectation,
      this.searchable});

  Employer.fromJson(Map<String, dynamic> json) {
    personalInfo = json['personalInfo'] != null
        ? new PersonalInfo.fromJson(json['personalInfo'])
        : null;
    familyMember = json['familyMember'] != null
        ? new FamilyMember.fromJson(json['familyMember'])
        : null;
    houseInfo = json['houseInfo'] != null
        ? new HouseInfo.fromJson(json['houseInfo'])
        : null;
    if (json['photo'] != null) {
      photo = [];
      json['photo'].forEach((v) {
        photo.add(new Photo.fromJson(v));
      });
    }
    expectation = json['expectation'] != null
        ? new Expectation.fromJson(json['expectation'])
        : null;
    searchable = json['searchable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.personalInfo != null) {
      data['personalInfo'] = this.personalInfo.toJson();
    }
    if (this.familyMember != null) {
      data['familyMember'] = this.familyMember.toJson();
    }
    if (this.houseInfo != null) {
      data['houseInfo'] = this.houseInfo.toJson();
    }
    if (this.photo != null) {
      data['photo'] = this.photo.map((v) => v.toJson()).toList();
    }
    if (this.expectation != null) {
      data['expectation'] = this.expectation.toJson();
    }
    data['searchable'] = this.searchable;
    return data;
  }
}

class PersonalInfo {
  String name;
  String gender;
  String maritalStatus;
  String nationality;
  String religion;
  EthnicGroup ethnicGroup;

  PersonalInfo(
      {this.name,
      this.gender,
      this.maritalStatus,
      this.nationality,
      this.religion,
      this.ethnicGroup});

  PersonalInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    gender = json['gender'];
    maritalStatus = json['maritalStatus'];
    nationality = json['nationality'];
    religion = json['religion'];
    ethnicGroup = json['ethnicGroup'] != null
        ? new EthnicGroup.fromJson(json['ethnicGroup'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['maritalStatus'] = this.maritalStatus;
    data['nationality'] = this.nationality;
    data['religion'] = this.religion;
    if (this.ethnicGroup != null) {
      data['ethnicGroup'] = this.ethnicGroup.toJson();
    }
    return data;
  }
}

class EthnicGroup {
  String id;
  String value;

  EthnicGroup({this.id, this.value});

  EthnicGroup.fromJson(Map<String, dynamic> json) {
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

class FamilyMember {
  List<FamilyMembers> familyMembers;
  bool stayWithParent;
  bool stayWithParentInLaw;

  FamilyMember(
      {this.familyMembers, this.stayWithParent, this.stayWithParentInLaw});

  FamilyMember.fromJson(Map<String, dynamic> json) {
    if (json['familyMembers'] != null) {
      familyMembers = [];
      json['familyMembers'].forEach((v) {
        familyMembers.add(new FamilyMembers.fromJson(v));
      });
    }
    stayWithParent = json['stayWithParent'];
    stayWithParentInLaw = json['stayWithParentInLaw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.familyMembers != null) {
      data['familyMembers'] =
          this.familyMembers.map((v) => v.toJson()).toList();
    }
    data['stayWithParent'] = this.stayWithParent;
    data['stayWithParentInLaw'] = this.stayWithParentInLaw;
    return data;
  }
}

class FamilyMembers {
  String relationToEmployeer;
  String name;
  String nricFin;
  String dob;

  FamilyMembers({this.relationToEmployeer, this.name, this.nricFin, this.dob});

  FamilyMembers.fromJson(Map<String, dynamic> json) {
    relationToEmployeer = json['relationToEmployeer'];
    name = json['name'];
    nricFin = json['nricFin'];
    dob = json['dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['relationToEmployeer'] = this.relationToEmployeer;
    data['name'] = this.name;
    data['nricFin'] = this.nricFin;
    data['dob'] = this.dob;
    return data;
  }
}

class HouseInfo {
  String houseType;
  int noOfRooms;
  int noOfBathrooms;
  int noOfToilets;
  int noOfFloors;

  HouseInfo(
      {this.houseType,
      this.noOfRooms,
      this.noOfBathrooms,
      this.noOfToilets,
      this.noOfFloors});

  HouseInfo.fromJson(Map<String, dynamic> json) {
    houseType = json['houseType'];
    noOfRooms = json['noOfRooms'];
    noOfBathrooms = json['noOfBathrooms'];
    noOfToilets = json['noOfToilets'];
    noOfFloors = json['noOfFloors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['houseType'] = this.houseType;
    data['noOfRooms'] = this.noOfRooms;
    data['noOfBathrooms'] = this.noOfBathrooms;
    data['noOfToilets'] = this.noOfToilets;
    data['noOfFloors'] = this.noOfFloors;
    return data;
  }
}

class Photo {
  String fileName;
  String mimeType;
  String order;

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

class Expectation {
  int offerSalary;
  String firstPriority;
  String secondPriority;
  String thirdPriority;
  String helperJoinOn;
  String expectation;
  String nonExpectation;
  List<String> duties;

  Expectation(
      {this.offerSalary,
      this.firstPriority,
      this.secondPriority,
      this.thirdPriority,
      this.helperJoinOn,
      this.expectation,
      this.nonExpectation,
      this.duties});

  Expectation.fromJson(Map<String, dynamic> json) {
    offerSalary = json['offerSalary'];
    firstPriority = json['firstPriority'];
    secondPriority = json['secondPriority'];
    thirdPriority = json['thirdPriority'];
    helperJoinOn = json['helperJoinOn'];
    expectation = json['expectation'];
    nonExpectation = json['nonExpectation'];
    duties = json['duties'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offerSalary'] = this.offerSalary;
    data['firstPriority'] = this.firstPriority;
    data['secondPriority'] = this.secondPriority;
    data['thirdPriority'] = this.thirdPriority;
    data['helperJoinOn'] = this.helperJoinOn;
    data['expectation'] = this.expectation;
    data['nonExpectation'] = this.nonExpectation;
    data['duties'] = this.duties;
    return data;
  }
}
