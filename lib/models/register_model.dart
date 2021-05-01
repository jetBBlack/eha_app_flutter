class RegisterRequestModel {
  String registerType;
  String name;
  String password;
  String emailInfo;
  String contactNoInfo;
 
  RegisterRequestModel(
      {this.registerType,
      this.name,
      this.password,
      this.emailInfo,
      this.contactNoInfo,
      });

  Map<String, dynamic> json() {
    Map<String, dynamic> map = {
      'registerType': registerType.trim(),
      'name': name.trim(),
      'passoword': password.trim(),
      'emailInfo': emailInfo.trim(),
      'contactNoInfo': contactNoInfo.trim(),
     
    };
    return map;
  }
}
