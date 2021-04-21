import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String labelText;
  final BoxDecoration decoration;
  final Widget child;

  const CustomContainer({
    Key key,
    @required this.labelText,
    @required this.decoration,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 70,
        ),
        Positioned(
          bottom: 0,
          child: Container(
              width: SizeConfig.screenWidth * 0.9,
              height: 65,
              decoration: decoration),
        ),
        Positioned(
          top: 10,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: child,
            width: SizeConfig.screenWidth * 0.9,
            height: 50,
          ),
        ),
        Positioned(
          left: 33,
          bottom: 52,
          child: Container(color: Colors.white, child: Text(labelText)),
        )
      ],
    );
  }
}
