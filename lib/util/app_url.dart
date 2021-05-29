class AppUrl {
  static const String baseUrl = 'http://101.100.173.227:22353/';

  static const String loginUrl = baseUrl + "api/login";
  static const String registerUrl = baseUrl + "api/register";
  static const String createHelper = baseUrl + "api/helpers/create-helper";
  static const String updateHelper = baseUrl + "api/helpers/update-helper";
  static const String deleteHelper = baseUrl + "api/helpers/delete-helper";
  static const String getHelper = baseUrl + "api/helpers/get-helper";
  static const String getHelperList = baseUrl + "api/helpers/get-helper-list";
  static const String uploadHelperImage =
      baseUrl + "api/helpers/helper-upload-photos";
  static const String createHelperMom =
      baseUrl + "api/helperMom/create-helper-mom";
  static const String updateHelperMom =
      baseUrl + "api/helperMom/update-helper-mom";
  static const String deleteHelperMom =
      baseUrl + "api/helperMom/delete-helper-mom";
  static const String getHelperMom = baseUrl + "api/helperMom/get-helper-mom";
  static const String getHelperMomList =
      baseUrl + "api/helperMom/get-helper-mom-list";
  static const String getImage = baseUrl + "api/files/";
}
