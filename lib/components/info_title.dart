import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoTitle extends StatelessWidget {
  final String icon;
  final String title;
  const InfoTitle({
    Key key,
    @required this.icon,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          height: 22,
          width: 22,
          color: Colors.cyan,
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(
          title,
          style: TextStyle(color: Colors.cyan, fontSize: 18),
        ),
      ],
    );
  }
}
