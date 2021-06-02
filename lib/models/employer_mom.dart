class EmployerMom {
  Mom mom;
  IncomeProof incomeProof;
  List<WorkPermitReceivers> workPermitReceivers;
  WorkPermitReceiverAddress workPermitReceiverAddress;
  List<Photos> photos;
  String singnature;
  String securityCode;

  EmployerMom(
      {this.mom,
      this.incomeProof,
      this.workPermitReceivers,
      this.workPermitReceiverAddress,
      this.photos,
      this.singnature,
      this.securityCode});

  EmployerMom.fromJson(Map<String, dynamic> json) {
    mom = json['mom'] != null ? new Mom.fromJson(json['mom']) : null;
    incomeProof = json['incomeProof'] != null
        ? new IncomeProof.fromJson(json['incomeProof'])
        : null;
    if (json['workPermitReceivers'] != null) {
      workPermitReceivers = <WorkPermitReceivers>[];
      json['workPermitReceivers'].forEach((v) {
        workPermitReceivers.add(new WorkPermitReceivers.fromJson(v));
      });
    }
    workPermitReceiverAddress = json['workPermitReceiverAddress'] != null
        ? new WorkPermitReceiverAddress.fromJson(
            json['workPermitReceiverAddress'])
        : null;
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos.add(new Photos.fromJson(v));
      });
    }
    singnature = json['singnature'];
    securityCode = json['securityCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mom != null) {
      data['mom'] = this.mom.toJson();
    }
    if (this.incomeProof != null) {
      data['incomeProof'] = this.incomeProof.toJson();
    }
    if (this.workPermitReceivers != null) {
      data['workPermitReceivers'] =
          this.workPermitReceivers.map((v) => v.toJson()).toList();
    }
    if (this.workPermitReceiverAddress != null) {
      data['workPermitReceiverAddress'] =
          this.workPermitReceiverAddress.toJson();
    }
    if (this.photos != null) {
      data['photos'] = this.photos.map((v) => v.toJson()).toList();
    }
    data['singnature'] = this.singnature;
    data['securityCode'] = this.securityCode;
    return data;
  }
}

class Mom {
  String name;
  String gender;
  String dob;
  String nricOrFin;
  Passport passport;
  String nationality;
  String martialStatus;
  String houseType;
  String newOrReplaceHelper;
  String residentStatus;

  Mom(
      {this.name,
      this.gender,
      this.dob,
      this.nricOrFin,
      this.passport,
      this.nationality,
      this.martialStatus,
      this.houseType,
      this.newOrReplaceHelper,
      this.residentStatus});

  Mom.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    gender = json['gender'];
    dob = json['dob'];
    nricOrFin = json['nricOrFin'];
    passport = json['passport'] != null
        ? new Passport.fromJson(json['passport'])
        : null;
    nationality = json['nationality'];
    martialStatus = json['martialStatus'];
    houseType = json['houseType'];
    newOrReplaceHelper = json['newOrReplaceHelper'];
    residentStatus = json['residentStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['nricOrFin'] = this.nricOrFin;
    if (this.passport != null) {
      data['passport'] = this.passport.toJson();
    }
    data['nationality'] = this.nationality;
    data['martialStatus'] = this.martialStatus;
    data['houseType'] = this.houseType;
    data['newOrReplaceHelper'] = this.newOrReplaceHelper;
    data['residentStatus'] = this.residentStatus;
    return data;
  }
}

class Passport {
  String no;
  String expiredOn;
  String issuedAt;

  Passport({this.no, this.expiredOn, this.issuedAt});

  Passport.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    expiredOn = json['expiredOn'];
    issuedAt = json['issuedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['expiredOn'] = this.expiredOn;
    data['issuedAt'] = this.issuedAt;
    return data;
  }
}

class IncomeProof {
  int monthlyIncome;
  int spouseIncome;
  String incomeProof;

  IncomeProof({this.monthlyIncome, this.spouseIncome, this.incomeProof});

  IncomeProof.fromJson(Map<String, dynamic> json) {
    monthlyIncome = json['monthlyIncome'];
    spouseIncome = json['spouseIncome'];
    incomeProof = json['incomeProof'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['monthlyIncome'] = this.monthlyIncome;
    data['spouseIncome'] = this.spouseIncome;
    data['incomeProof'] = this.incomeProof;
    return data;
  }
}

class WorkPermitReceivers {
  String name;
  String nricFin;
  ContactNo contactNo;

  WorkPermitReceivers({this.name, this.nricFin, this.contactNo});

  WorkPermitReceivers.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nricFin = json['nricFin'];
    contactNo = json['contactNo'] != null
        ? new ContactNo.fromJson(json['contactNo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['nricFin'] = this.nricFin;
    if (this.contactNo != null) {
      data['contactNo'] = this.contactNo.toJson();
    }
    return data;
  }
}

class ContactNo {
  String countryId;
  String no;

  ContactNo({this.countryId, this.no});

  ContactNo.fromJson(Map<String, dynamic> json) {
    countryId = json['countryId'];
    no = json['no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countryId'] = this.countryId;
    data['no'] = this.no;
    return data;
  }
}

class WorkPermitReceiverAddress {
  String blkNo;
  String unitNo;
  String floorNo;
  String streetName;
  String country;
  String postalCode;

  WorkPermitReceiverAddress(
      {this.blkNo,
      this.unitNo,
      this.floorNo,
      this.streetName,
      this.country,
      this.postalCode});

  WorkPermitReceiverAddress.fromJson(Map<String, dynamic> json) {
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

class Photos {
  String fileName;
  String mimeType;
  String order;

  Photos({this.fileName, this.mimeType, this.order});

  Photos.fromJson(Map<String, dynamic> json) {
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
