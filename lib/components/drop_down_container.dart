import 'package:eha_app/components/custom_label_container.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../size_config.dart';

class DropDownContainer extends StatelessWidget {
  final String labelText;
  final String selectedValue;
  final List<String> valueList;
  final Function press;
  const DropDownContainer(
      {Key key, this.selectedValue, this.valueList, this.press, this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      labelText: labelText,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(25),
          ),
          border: Border.all(color: kTextColor)),
      child: DropdownButton(
        isExpanded: true,
        value: selectedValue,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: getProportionateScreenWidth(25),
        elevation: 10,
        underline: Container(
          color: kTextColor,
        ),
        style: TextStyle(
            color: kTextColor, fontSize: getProportionateScreenWidth(16)),
        onChanged: press,
        items: valueList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem(
            child: Text(value),
            value: value,
          );
        }).toList(),
      ),
    );
  }
}
