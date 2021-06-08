import 'package:eha_app/constant.dart';
import 'package:eha_app/models/helper.dart';
import 'package:eha_app/screens/user_details/user_detail_screen.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _favorite;
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 7));
  @override
  void initState() {
    _favorite = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HelperModel helper = UserDetailInherited.of(context).helperModel;
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: SizeConfig.screenHeight * 0.45,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/demo-2.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  helper.personalInfo.name,
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                SvgPicture.asset(
                                  'assets/icons/gender.svg',
                                  color: Colors.red,
                                  width: 22,
                                  height: 22,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.grey[600],
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "Singapore",
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _favorite == true
                                ? Colors.red[400]
                                : Colors.white,
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                setState(() {
                                  _favorite = !_favorite;
                                });
                              });
                            },
                            icon: Icon(
                              Icons.favorite,
                              size: 24,
                              color: _favorite == true
                                  ? Colors.white
                                  : Colors.grey[300],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        buildFeature("160 cm", "Height"),
                        buildFeature("54 kg", "Weight"),
                        buildFeature("April 02, 98", "D.O.B"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      helper.selfDescription,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                        height: 2,
                        width: double.infinity,
                        color: Colors.grey[500]),
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(20),
                  ),
                  BuildPicture(),
                  SizedBox(
                    height: 15,
                  ),
                  BuildSkillLevel(skills: helper.skills),
                  SizedBox(
                    height: 15,
                  ),
                  BuildYesNo(),
                  SizedBox(
                    height: 15,
                  ),
                  BuildWorkHistoy(startDate: _startDate, endDate: _endDate),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildFeature(String value, String feature) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[200],
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              feature,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildWorkHistoy extends StatelessWidget {
  const BuildWorkHistoy({
    Key key,
    @required DateTime startDate,
    @required DateTime endDate,
  })  : _startDate = startDate,
        _endDate = endDate,
        super(key: key);

  final DateTime _startDate;
  final DateTime _endDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/history.svg',
                width: 22,
                height: 22,
                color: Colors.cyan,
              ),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              Text(
                'WORK HISTORY',
                style: TextStyle(color: Colors.cyan, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: EdgeInsets.only(left: 14),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey[400]),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        '${DateFormat('MM/dd/yyyy').format(_startDate).toString()}',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Text('-',
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                      Text(
                          '${DateFormat('MM/dd/yyyy').format(_endDate).toString()}',
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: kTextColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Wrap(
                        runSpacing: 10,
                        spacing: 10,
                        direction: Axis.horizontal,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Caring of children',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Cleaning',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Cook food',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Driver',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class BuildSkillLevel extends StatelessWidget {
  final List skills;
  const BuildSkillLevel({
    Key key,
    @required this.skills,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/settings.svg',
                width: 22,
                height: 22,
                color: Colors.cyan,
              ),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              Text(
                'SKILL LEVEL',
                style: TextStyle(color: Colors.cyan, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: EdgeInsets.only(left: 14),
            child: ListView.separated(
              itemBuilder: (BuildContext context, index) {
                return Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border.all(color: Colors.grey[500]),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        skills[index].id,
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        skills[index].value,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14,
                          color: kTextColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: skills.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10,
                );
              },
              // children: [
              //   Container(
              //     height: 60,
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //       color: Colors.grey[100],
              //       border: Border.all(color: Colors.grey[500]),
              //       borderRadius: BorderRadius.circular(5),
              //     ),
              //     alignment: Alignment.centerLeft,
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           ' Can cook Basic food',
              //           style: TextStyle(
              //               fontSize: 17,
              //               color: Colors.black,
              //               fontWeight: FontWeight.bold),
              //         ),
              //         Text(
              //           ' Very Experience',
              //           textAlign: TextAlign.start,
              //           style: TextStyle(
              //             fontSize: 14,
              //             color: kTextColor,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              //   SizedBox(
              //     height: 10,
              //   ),
              //   Container(
              //     height: 60,
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //       color: Colors.grey[100],
              //       border: Border.all(color: Colors.grey[500]),
              //       borderRadius: BorderRadius.circular(5),
              //     ),
              //     alignment: Alignment.centerLeft,
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.stretch,
              //       children: [
              //         Text(
              //           ' Can cook Indian food',
              //           style: TextStyle(
              //               fontSize: 17,
              //               color: Colors.black,
              //               fontWeight: FontWeight.bold),
              //         ),
              //         Text(
              //           ' No Experience',
              //           style: TextStyle(
              //             fontSize: 14,
              //             color: kTextColor,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ],
            ),
          ),
        ],
      ),
    );
  }
}

class BuildYesNo extends StatelessWidget {
  final List<YesNoQuestions> yesNoQuestions;
  const BuildYesNo({
    Key key,
    this.yesNoQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/question.svg',
                width: 22,
                height: 22,
                color: Colors.cyan,
              ),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              Text(
                'YES/NO',
                style: TextStyle(color: Colors.cyan, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: EdgeInsets.only(left: 14),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey[500]),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' Can drive',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' No',
                        style: TextStyle(
                          fontSize: 14,
                          color: kTextColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: yesNoQuestions.length,
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: 10,
              ),
              // children: [
              //   Container(
              //     height: 60,
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //       color: Colors.grey[200],
              //       border: Border.all(color: Colors.grey[500]),
              //       borderRadius: BorderRadius.circular(5),
              //     ),
              //     alignment: Alignment.centerLeft,
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           ' Can drive',
              //           style: TextStyle(
              //               fontSize: 17,
              //               color: Colors.black,
              //               fontWeight: FontWeight.bold),
              //         ),
              //         Text(
              //           ' No',
              //           style: TextStyle(
              //             fontSize: 14,
              //             color: kTextColor,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              //   SizedBox(
              //     height: 10,
              //   ),
              //   Container(
              //     height: 60,
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //       color: Colors.grey[200],
              //       border: Border.all(color: Colors.grey[500]),
              //       borderRadius: BorderRadius.circular(5),
              //     ),
              //     alignment: Alignment.centerLeft,
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           ' Can cook beef',
              //           style: TextStyle(
              //               fontSize: 17,
              //               color: Colors.black,
              //               fontWeight: FontWeight.bold),
              //         ),
              //         Text(
              //           ' Yes',
              //           style: TextStyle(
              //             fontSize: 14,
              //             color: kTextColor,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              //   SizedBox(
              //     height: 10,
              //   ),
              //   Container(
              //     height: 60,
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //       color: Colors.grey[200],
              //       border: Border.all(color: Colors.grey[500]),
              //       borderRadius: BorderRadius.circular(5),
              //     ),
              //     alignment: Alignment.centerLeft,
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           ' Can take care children',
              //           style: TextStyle(
              //               fontSize: 17,
              //               color: Colors.black,
              //               fontWeight: FontWeight.bold),
              //         ),
              //         Text(
              //           ' Yes',
              //           style: TextStyle(
              //             fontSize: 14,
              //             color: kTextColor,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ],
            ),
          ),
        ],
      ),
    );
  }
}

class BuildPicture extends StatelessWidget {
  const BuildPicture({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/image-gallery.svg',
                color: Colors.cyan,
              ),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              Text(
                'PICTURES',
                style: TextStyle(color: Colors.cyan, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/pic-3.jpg'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: Colors.grey[500]),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/pic-4.jpg'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: Colors.grey[500]),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/pic-2.jpg'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: Colors.grey[500]),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
