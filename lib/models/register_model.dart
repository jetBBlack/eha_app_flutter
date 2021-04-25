class RegisterRequestModel {
  String registerType;
  String name;
  String password;
  String emailInfo;
  String contactNoInfo;
  String avator;
  String lastLogin;

  RegisterRequestModel(
      {this.registerType,
      this.name,
      this.password,
      this.emailInfo,
      this.contactNoInfo,
      this.avator,
      this.lastLogin});

  Map<String, dynamic> json() {
    Map<String, dynamic> map = {
      'registerType': registerType.trim(),
      'name': name.trim(),
      'passoword': password.trim(),
      'emailInfo': emailInfo.trim(),
      'contactNoInfo': contactNoInfo.trim(),
      'avator': avator.trim(),
      'lastLogin': lastLogin.trim()
    };
    return map;
  }
}
