class AppUrl {
  static const String baseUrl = 'http://101.100.173.227:22353/';
  //auth Api url
  static const String loginUrl = baseUrl + "api/login";
  static const String registerUrl = baseUrl + "api/register";

  //helper Api url
  static const String createHelper = baseUrl + "api/helpers/create-helper";
  static const String updateHelper = baseUrl + "api/helpers/update-helper";
  static const String deleteHelper = baseUrl + "api/helpers/delete-helper";
  static const String getHelper = baseUrl + "api/helpers/get-helper";
  static const String getHelperList = baseUrl + "api/helpers/get-helper-list";

  //Image Api url
  static const String uploadHelperImage =
      baseUrl + "api/helpers/helper-upload-photos";
  static const String getImage = baseUrl + "api/files/";

  //helper mom Api url
  static const String createHelperMom =
      baseUrl + "api/helperMom/create-helper-mom";
  static const String updateHelperMom =
      baseUrl + "api/helperMom/update-helper-mom";
  static const String deleteHelperMom =
      baseUrl + "api/helperMom/delete-helper-mom";
  static const String getHelperMom = baseUrl + "api/helperMom/get-helper-mom";
  static const String getHelperMomList =
      baseUrl + "api/helperMom/get-helper-mom-list";

  //employer Api url
  static const String updateEmployer =
      baseUrl + "api/employers/update-employer";
  static const String createEmployer =
      baseUrl + "api/employers/create-employer";
  static const String deleteEmployer =
      baseUrl + "api/employers/delete-employer";
  static const String getEmployer = baseUrl + "api/employers/get-employer";
  static const String getEmployerList =
      baseUrl + "api/employers/get-employer-list";

  //employerMom Api url
  static const String updateEmployerMom =
      baseUrl + "api/employerMom/update-employer-mom";
  static const String createEmployerMom =
      baseUrl + "api/employerMom/create-employee-mom";
  static const String deleteEmployerMom =
      baseUrl + "api/employerMom/delete-employer-mom";
  static const String getEmployerMom =
      baseUrl + "api/employerMom/get-employer-mom";
  static const String getEmployerMomList =
      baseUrl + "api/employerMom/get-employer-mom-list";
}
