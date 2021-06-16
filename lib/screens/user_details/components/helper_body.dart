import 'package:eha_app/constant.dart';
import 'package:eha_app/models/helper.dart';
import 'package:eha_app/components/photo_view.dart';
import 'package:eha_app/screens/user_details/helper_detail_screen.dart';
import 'package:eha_app/size_config.dart';
import 'package:eha_app/util/app_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _favorite;

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
                  image: NetworkImage(
                      AppUrl.getImage + helper.photo.first.fileName),
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
                                  helper.personalInfo.gender == "male"
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
                                  helper.personalInfo.nationality,
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
                        buildFeature(
                            helper.personalInfo.maritalStatus, "Status"),
                        buildFeature("54 kg", "Weight"),
                        buildFeature(
                            helper.dob.split('T')[0].toString(), "D.O.B"),
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
                    height: getProportionateScreenWidth(10),
                  ),
                  BuildPicture(
                    photos: helper.photo,
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(25),
                  ),
                  BuildSkillLevel(skills: helper.skills),
                  SizedBox(
                    height: getProportionateScreenWidth(25),
                  ),
                  BuildYesNo(
                    yesNoQuestions: helper.yesNoQuestions,
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(25),
                  ),
                  BuildWorkHistoy(
                      employmentHistory: helper.employmentHistories),
                  SizedBox(
                    height: getProportionateScreenWidth(20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFeature(String value, String feature) {
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
  final List<EmploymentHistories> employmentHistory;

  const BuildWorkHistoy({Key key, this.employmentHistory}) : super(key: key);

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
          ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: employmentHistory.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      border: Border.all(color: Colors.grey[400]),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              employmentHistory[index]
                                  .startOn
                                  .split('T')[0]
                                  .toString(),
                              //'${DateFormat('MM/dd/yyyy').format(employmentHistory[index].startOn).toString()}',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            Text('-',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black)),
                            Text(
                                employmentHistory[index]
                                    .endOn
                                    .split('T')[0]
                                    .toString(),
                                //'${DateFormat('MM/dd/yyyy').format(_endDate).toString()}',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black)),
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
                              children: List.generate(
                                employmentHistory[index].duties.length,
                                (ind) => Container(
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    employmentHistory[index].duties[ind],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                'SKILL LEVEL',
                style: TextStyle(color: Colors.cyan, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 12,
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
                ),
              );
            },
            itemCount: skills.length,
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
          ListView.separated(
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey[400]),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        yesNoQuestions[index].id,
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        yesNoQuestions[index].value,
                        style: TextStyle(
                          fontSize: 15,
                          color: kTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: yesNoQuestions.length,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 10,
            ),
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
