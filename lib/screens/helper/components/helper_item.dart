import 'package:eha_app/models/helper.dart';
import 'package:eha_app/screens/user_details/user_detail_screen.dart';
import 'package:eha_app/util/app_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../size_config.dart';

class HelperItem extends StatefulWidget {
  final HelperModel helper;
  const HelperItem({Key key, this.helper}) : super(key: key);

  @override
  _HelperItemState createState() => _HelperItemState();
}

class _HelperItemState extends State<HelperItem> {
  String computeAge(String dayOfBirth) {
    String datePattern = "yyyy-MM-dd";

    DateTime birthDate = DateFormat(datePattern).parse(dayOfBirth);
    DateTime today = DateTime.now();

    int ageDiff = today.year - birthDate.year;
    return ageDiff.toString();
  }

  String mergeSkill(List skills) {
    String result;
    if (skills.length >= 2) {
      result = skills[0].id + ", " + skills[1].id + "...";
    } else {
      result = skills[0].id + "...";
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserDetailScreen(
                      helper: widget.helper,
                    )));
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        margin: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(AppUrl.getImage +
                            widget.helper.photo.first.fileName),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: widget.helper.personalInfo.name,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: " (" +
                                        computeAge(widget.helper.dob) +
                                        " year olds" +
                                        ")",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ]),
                        ),
                        Text('Domestic-helper',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ))
                      ],
                    ),
                  ),
                ),
                Icon(Icons.favorite_border),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: getProportionateScreenWidth(20),
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color(0xFF979797).withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/location.svg',
                          color: Colors.green.shade600,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.helper.personalInfo.nationality,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.green.shade600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    child: Center(
                      child: Text(
                        mergeSkill(widget.helper.skills),
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
