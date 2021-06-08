import 'package:eha_app/models/helper.dart';
import 'package:eha_app/services_api/helper_services.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class GetHelperProvider extends ChangeNotifier {
  HelperService get _service => GetIt.I<HelperService>();
  List<HelperModel> _helperList = <HelperModel>[];

  List<HelperModel> get helperList => _helperList;

  void loadHelperList() async {
    final List<HelperModel> helpers = await _service.getHelperList(1, 1, 'ASC');
    _helperList = helpers;
  }
}
