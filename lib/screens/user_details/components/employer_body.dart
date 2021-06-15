import 'package:eha_app/components/info_title.dart';
import 'package:eha_app/constant.dart';
import 'package:eha_app/models/employer.dart';
import 'package:eha_app/components/photo_view.dart';
import 'package:eha_app/util/app_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../size_config.dart';

class EmployerBody extends StatefulWidget {
  final Employer employer;
  const EmployerBody({Key key, @required this.employer}) : super(key: key);

  @override
  _EmployerBodyState createState() => _EmployerBodyState();
}

class _EmployerBodyState extends State<EmployerBody> {
  bool _favorite;

  @override
  void initState() {
    _favorite = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  image: NetworkImage(
                      AppUrl.getImage + widget.employer.photo.first.fileName),
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
                                  widget.employer.personalInfo.name,
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
                                  widget.employer.personalInfo.gender == "male"
                                      ? 'assets/icons/male.svg'
                                      : 'assets/icons/female.svg',
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
                                  widget.employer.personalInfo.nationality,
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
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      widget.employer.personalInfo.maritalStatus,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 17,
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
                    height: getProportionateScreenWidth(10),
                  ),
                  BuildPicture(
                    photos: widget.employer.photo,
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(25),
                  ),
                  BuildExpectationInfo(
                    expectation: widget.employer.expectation,
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(20),
                  ),
                  BuildFamilyInfo(
                    familyMember: widget.employer.familyMember,
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(20),
                  ),
                  BuildHouseInfo(
                    houseInfo: widget.employer.houseInfo,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildExpectationInfo extends StatelessWidget {
  final Expectation expectation;
  const BuildExpectationInfo({
    Key key,
    this.expectation,
  }) : super(key: key);

  String convertDate(String dayOfBirth) {
    String datePattern = "yyyy-MM-dd";

    DateTime joinDate = DateFormat(datePattern).parse(dayOfBirth);
    String month = DateFormat.MMMM().format(joinDate);
    return month + ' ${joinDate.day} ${joinDate.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          InfoTitle(
              icon: 'assets/icons/happiness.svg', title: "EXPECTATION INFO"),
          SizedBox(
            height: 15,
          ),
          buildExpectContainer("Offer salary",
              expectation.offerSalary.toString(), Colors.grey[100]),
          SizedBox(
            height: 12,
          ),
          buildExpectContainer("Expect the date to start",
              convertDate(expectation.helperJoinOn), Colors.grey[100]),
          SizedBox(
            height: 12,
          ),
          buildExpectContainer(
              "Expectation", expectation.expectation, Colors.grey[400])
        ],
      ),
    );
  }

  Container buildExpectContainer(String title, String text, Color color) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.grey[500]),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              text,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 14,
                color: kTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildFamilyInfo extends StatelessWidget {
  final FamilyMember familyMember;
  const BuildFamilyInfo({
    Key key,
    this.familyMember,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/wives.svg',
                width: 22,
                height: 22,
                color: Colors.cyan,
              ),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              Text(
                'FAMILY INFO',
                style: TextStyle(color: Colors.cyan, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          ListView.separated(
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.grey[500]),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        familyMember.familyMembers[index].relationToEmployeer,
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        familyMember.familyMembers[index].name,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14,
                          color: kTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: familyMember.familyMembers.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 12,
              );
            },
          ),
        ],
      ),
    );
  }
}

class BuildPicture extends StatelessWidget {
  final List<Photo> photos;
  const BuildPicture({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> photosList = List.generate(
      photos.length > 3 ? 3 : photos.length,
      (index) => GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PhotoView(
                        photos: photos,
                      )));
        },
        child: Hero(
          tag: photos[index].fileName,
          child: Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(AppUrl.getImage + photos[index].fileName),
                fit: BoxFit.cover,
              ),
              border: Border.all(color: Colors.grey[500]),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
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
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.cyan,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PhotoView(
                                photos: photos,
                              )));
                },
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: photosList,
          )
        ],
      ),
    );
  }
}

class BuildHouseInfo extends StatelessWidget {
  final HouseInfo houseInfo;
  const BuildHouseInfo({Key key, this.houseInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          InfoTitle(icon: 'assets/icons/house.svg', title: 'HOUSE INFO'),
          SizedBox(
            height: 15,
          ),
          buildHouseContainer("Housing Type", houseInfo.houseType),
          SizedBox(
            height: 12,
          ),
          buildHouseContainer("No of rooms", houseInfo.noOfRooms.toString()),
          SizedBox(
            height: 12,
          ),
          buildHouseContainer(
              "No of bathrooms", houseInfo.noOfBathrooms.toString()),
          SizedBox(
            height: 12,
          ),
          buildHouseContainer("No of floors", houseInfo.noOfFloors.toString()),
          SizedBox(
            height: 12,
          ),
          buildHouseContainer("No of toilets", houseInfo.noOfToilets.toString())
        ],
      ),
    );
  }

  Container buildHouseContainer(String title, String text) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(color: Colors.grey[500]),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              text,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 14,
                color: kTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
