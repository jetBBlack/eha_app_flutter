class RegisterRequestModel {
  String name;
  String password;
  String emailAddress;
  String contactNo;

  RegisterRequestModel({
    this.name,
    this.password,
    this.emailAddress,
    this.contactNo,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'name': name.trim(),
      'passoword': password.trim(),
      'emailInfo': emailAddress.trim(),
      'contactNoInfo': contactNo.trim(),
    };
    return map;
  }
}
