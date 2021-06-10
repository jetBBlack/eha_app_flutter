import 'package:eha_app/services_api/country_services.dart';
import 'package:eha_app/services_api/employer_mom_services.dart';
import 'package:eha_app/services_api/helper_mom_services.dart';
import 'package:eha_app/services_api/helper_services.dart';
import 'package:get_it/get_it.dart';

import 'employer_services.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => HelperMomService());
  GetIt.I.registerLazySingleton(() => HelperService());
  GetIt.I.registerLazySingleton(() => CountryService());
  GetIt.I.registerLazySingleton(() => EmployerMomService());
  GetIt.I.registerLazySingleton(() => EmployerService());
}
