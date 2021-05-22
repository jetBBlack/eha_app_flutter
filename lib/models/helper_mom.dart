class HelperMom {
  Mom mom;
  Malaysia malaysia;
  Spouse spouse;
  List<Photo> photo;
  String signature;
  String code;

  HelperMom(
      {this.mom,
      this.malaysia,
      this.spouse,
      this.photo,
      this.signature,
      this.code});

  HelperMom.fromJson(Map<String, dynamic> json) {
    mom = json['mom'] != null ? new Mom.fromJson(json['mom']) : null;
    malaysia = json['malaysia'] != null
        ? new Malaysia.fromJson(json['malaysia'])
        : null;
    spouse =
        json['spouse'] != null ? new Spouse.fromJson(json['spouse']) : null;
    if (json['photo'] != null) {
      photo = [];
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

class Mom {
  String wp;
  String fin;
  String name;
  String gender;
  String education;
  String marriedOn;
  String passportNo;
  String ethnicGroup;
  String nationality;
  String birthCountry;
  String maritalStatus;
  String passportExpiredOn;
  String has8YearsEducation;
  String immigrationPassType;
  String citizenGrantedAtStateProvince;

  Mom(
      {this.wp,
      this.fin,
      this.name,
      this.gender,
      this.education,
      this.marriedOn,
      this.passportNo,
      this.ethnicGroup,
      this.nationality,
      this.birthCountry,
      this.maritalStatus,
      this.passportExpiredOn,
      this.has8YearsEducation,
      this.immigrationPassType,
      this.citizenGrantedAtStateProvince});

  Mom.fromJson(Map<String, dynamic> json) {
    wp = json['wp'];
    fin = json['fin'];
    name = json['name'];
    gender = json['gender'];
    education = json['education'];
    marriedOn = json['marriedOn'];
    passportNo = json['passportNo'];
    ethnicGroup = json['ethnicGroup'];
    nationality = json['nationality'];
    birthCountry = json['birthCountry'];
    maritalStatus = json['maritalStatus'];
    passportExpiredOn = json['passportExpiredOn'];
    has8YearsEducation = json['has8YearsEducation'];
    immigrationPassType = json['immigrationPassType'];
    citizenGrantedAtStateProvince = json['citizenGrantedAtStateProvince'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wp'] = this.wp;
    data['fin'] = this.fin;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['education'] = this.education;
    data['marriedOn'] = this.marriedOn;
    data['passportNo'] = this.passportNo;
    data['ethnicGroup'] = this.ethnicGroup;
    data['nationality'] = this.nationality;
    data['birthCountry'] = this.birthCountry;
    data['maritalStatus'] = this.maritalStatus;
    data['passportExpiredOn'] = this.passportExpiredOn;
    data['has8YearsEducation'] = this.has8YearsEducation;
    data['immigrationPassType'] = this.immigrationPassType;
    data['citizenGrantedAtStateProvince'] = this.citizenGrantedAtStateProvince;
    return data;
  }
}

class Malaysia {
  String icNo;
  String icColour;

  Malaysia({this.icNo, this.icColour});

  Malaysia.fromJson(Map<String, dynamic> json) {
    icNo = json['icNo'];
    icColour = json['icColour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icNo'] = this.icNo;
    data['icColour'] = this.icColour;
    return data;
  }
}

class Spouse {
  String name;
  String nric;

  Spouse({this.name, this.nric});

  Spouse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nric = json['nric'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['nric'] = this.nric;
    return data;
  }
}

class Photo {
  String filename;
  String mimetype;
  String originalname;

  Photo({this.filename, this.mimetype, this.originalname});

  Photo.fromJson(Map<String, dynamic> json) {
    filename = json['filename'];
    mimetype = json['mimetype'];
    originalname = json['originalname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filename'] = this.filename;
    data['mimetype'] = this.mimetype;
    data['originalname'] = this.originalname;
    return data;
  }
}
