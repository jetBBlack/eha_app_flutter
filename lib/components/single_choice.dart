import 'package:flutter/material.dart';

class SingleChoice extends StatelessWidget {
  final Function press;
  final List<String> itemList;
  final String selectedValue;

  const SingleChoice({Key key, this.itemList, this.selectedValue, this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Row(
          children: <Widget>[
            Radio(
              value: itemList[index],
              groupValue: selectedValue,
              onChanged: press,
            ),
            Text(
              itemList[index],
              style: TextStyle(fontSize: 14),
            )
          ],
        );
      },
      itemCount: itemList.length,
    );
  }
}
