import 'package:flutter/material.dart';

class BuildSettings extends StatefulWidget {
  @override
  _BuildSettingsState createState() => _BuildSettingsState();
}

class _BuildSettingsState extends State<BuildSettings>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container();
  }

  @override
  bool get wantKeepAlive => true;
}
