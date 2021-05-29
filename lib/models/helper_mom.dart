class HelperMomModelWithoutID {
  Mom mom;
  Malaysia malaysia;
  Spouse spouse;
  List<Photo> photo;
  String signature;
  String code;

  HelperMomModelWithoutID(
      {this.mom,
      this.malaysia,
      this.spouse,
      this.photo,
      this.signature,
      this.code});

  HelperMomModelWithoutID.fromJson(Map<String, dynamic> json) {
    mom = json['mom'] != null ? new Mom.fromJson(json['mom']) : null;
    malaysia = json['malaysia'] != null
        ? new Malaysia.fromJson(json['malaysia'])
        : null;
    spouse =
        json['spouse'] != null ? new Spouse.fromJson(json['spouse']) : null;
    if (json['photo'] != null) {
      photo = <Photo>[];
      json['photo'].forEach((v) {
        photo.add(new Photo.fromJson(v));
      });
    }
    signature = json['signature'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mom != null) {
      data['mom'] = this.mom.toJson();
    }
    if (this.malaysia != null) {
      data['malaysia'] = this.malaysia.toJson();
    }
    if (this.spouse != null) {
      data['spouse'] = this.spouse.toJson();
    }
    if (this.photo != null) {
      data['photo'] = this.photo.map((v) => v.toJson()).toList();
    }
    data['signature'] = this.signature;
    data['code'] = this.code;
    return data;
  }
}

class HelperMomModel {
  Mom mom;
  Malaysia malaysia;
  Spouse spouse;
  List<Photo> photo;
  String signature;
  String code;
  String id;

  HelperMomModel(
      {this.mom,
      this.malaysia,
      this.spouse,
      this.photo,
      this.signature,
      this.code,
      this.id});

  HelperMomModel.fromJson(Map<String, dynamic> json) {
    mom = json['mom'] != null ? new Mom.fromJson(json['mom']) : null;
    malaysia = json['malaysia'] != null
        ? new Malaysia.fromJson(json['malaysia'])
        : null;
    spouse =
        json['spouse'] != null ? new Spouse.fromJson(json['spouse']) : null;
    if (json['photo'] != null) {
      photo = <Photo>[];
      json['photo'].forEach((v) {
        photo.add(new Photo.fromJson(v));
      });
    }
    signature = json['signature'];
    code = json['code'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mom != null) {
      data['mom'] = this.mom.toJson();
    }
    if (this.malaysia != null) {
      data['malaysia'] = this.malaysia.toJson();
    }
    if (this.spouse != null) {
      data['spouse'] = this.spouse.toJson();
    }
    if (this.photo != null) {
      data['photo'] = this.photo.map((v) => v.toJson()).toList();
    }
    data['signature'] = this.signature;
    data['code'] = this.code;
    data['id'] = this.id;
    return data;
  }
}

class Mom {
  String name;
  String fin;
  String workPromoteNo;
  String citizenGrantedOnState;
  String passportNo;
  String passportExpiredOn;
  String gender;
  String immigrationPassType;
  String has8YearsEducation;
  String educationLevel;
  String marriedOn;
  String maritalStatus;
  String birthCountry;
  String nationality;
  String ethnicGroup;

  Mom(
      {this.name,
      this.fin,
      this.workPromoteNo,
      this.citizenGrantedOnState,
      this.passportNo,
      this.passportExpiredOn,
      this.gender,
      this.immigrationPassType,
      this.has8YearsEducation,
      this.educationLevel,
      this.marriedOn,
      this.maritalStatus,
      this.birthCountry,
      this.nationality,
      this.ethnicGroup});

  Mom.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fin = json['fin'];
    workPromoteNo = json['workPromoteNo'];
    citizenGrantedOnState = json['citizenGrantedOnState'];
    passportNo = json['passportNo'];
    passportExpiredOn = json['passportExpiredOn'];
    gender = json['gender'];
    immigrationPassType = json['immigrationPassType'];
    has8YearsEducation = json['has8YearsEducation'];
    educationLevel = json['educationLevel'];
    marriedOn = json['marriedOn'];
    maritalStatus = json['maritalStatus'];
    birthCountry = json['birthCountry'];
    nationality = json['nationality'];
    ethnicGroup = json['ethnicGroup'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['fin'] = this.fin;
    data['workPromoteNo'] = this.workPromoteNo;
    data['citizenGrantedOnState'] = this.citizenGrantedOnState;
    data['passportNo'] = this.passportNo;
    data['passportExpiredOn'] = this.passportExpiredOn;
    data['gender'] = this.gender;
    data['immigrationPassType'] = this.immigrationPassType;
    data['has8YearsEducation'] = this.has8YearsEducation;
    data['educationLevel'] = this.educationLevel;
    data['marriedOn'] = this.marriedOn;
    data['maritalStatus'] = this.maritalStatus;
    data['birthCountry'] = this.birthCountry;
    data['nationality'] = this.nationality;
    data['ethnicGroup'] = this.ethnicGroup;
    return data;
  }
}

class Malaysia {
  String no;
  String colour;

  Malaysia({this.no, this.colour});

  Malaysia.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    colour = json['colour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['colour'] = this.colour;
    return data;
  }
}

class Spouse {
  String name;
  String nricOnFin;
  String marriedOn;

  Spouse({this.name, this.nricOnFin, this.marriedOn});

  Spouse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nricOnFin = json['nricOnFin'];
    marriedOn = json['marriedOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['nricOnFin'] = this.nricOnFin;
    data['marriedOn'] = this.marriedOn;
    return data;
  }
}

class Photo {
  String filename;
  String mimetype;
  int order;

  Photo({this.filename, this.mimetype, this.order});

  Photo.fromJson(Map<String, dynamic> json) {
    filename = json['filename'];
    mimetype = json['mimetype'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filename'] = this.filename;
    data['mimetype'] = this.mimetype;
    data['order'] = this.order;
    return data;
  }
}
