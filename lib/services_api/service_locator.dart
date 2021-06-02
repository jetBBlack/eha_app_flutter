import 'package:eha_app/services_api/helper_mom_services.dart';
import 'package:eha_app/services_api/helper_services.dart';
import 'package:get_it/get_it.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => HelperMomService());
  GetIt.I.registerLazySingleton(() => HelperService());
}
