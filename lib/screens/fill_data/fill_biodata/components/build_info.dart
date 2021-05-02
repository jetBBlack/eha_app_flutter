import 'package:dropdownfield/dropdownfield.dart';
import 'package:eha_app/components/drop_down_container.dart';
import 'package:eha_app/constant.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildPersonalInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(18)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/User.svg',
                      color: Colors.cyan,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(
                      "GENERAL INFOMATION",
                      style: TextStyle(color: Colors.cyan),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                BuildGeneralInfo(),
                SizedBox(
                  height: getProportionateScreenWidth(30),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/request.svg',
                      height: 20,
                      width: 20,
                      color: Colors.cyan,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(
                      "Q & A",
                      style: TextStyle(color: Colors.cyan),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                BuildQAForm(),
                SizedBox(
                  height: getProportionateScreenWidth(30),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/question.svg',
                      height: 20,
                      width: 20,
                      color: Colors.cyan,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(
                      "YES/NO",
                      style: TextStyle(color: Colors.cyan),
                    ),
                  ],
                ),
                BuildYesNoForm(),
                SizedBox(
                  height: getProportionateScreenWidth(30),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/settings.svg',
                      height: 20,
                      width: 20,
                      color: Colors.cyan,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(
                      "SKILL LEVEL",
                      style: TextStyle(color: Colors.cyan),
                    ),
                  ],
                ),
                BuildSkillLevel()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildGeneralInfo extends StatefulWidget {
  @override
  _BuildGeneralInfoState createState() => _BuildGeneralInfoState();
}

class _BuildGeneralInfoState extends State<BuildGeneralInfo> {
  Key _formKey = GlobalKey<FormState>();
  TextEditingController dateCtl = TextEditingController();
  List<String> genderList = ["Male", "Female"];
  String genderSelect = "Male";
  List<String> maritalStatusList = [
    "Divorced",
    "Married",
    "Separated",
    "Single",
    "Widowed"
  ];
  String maritalSelect = "Married";
  List<String> countryList = [
    "Filipino",
    "Burman",
    "India",
    "Sri Lanka",
    "Bangladesh",
    "Malaysian",
    "Indonesian",
    "Chinese-HongKong",
    "Chinese-Macau",
    "Chinese-Taiwan",
    "Thai",
    "Korean"
  ];
  TextEditingController nationalities = TextEditingController();
  String selectNational = " ";
  TextEditingController birthCountry = TextEditingController();
  String selectBirthCountry = " ";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Name",
              hintText: "Enter your name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropDownContainer(
            labelText: "Gender",
            selectedValue: genderSelect,
            valueList: genderList,
            press: (String newValue) {
              genderSelect = newValue;
            },
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropDownContainer(
            selectedValue: maritalSelect,
            labelText: "Martial Status",
            valueList: maritalStatusList,
            press: (String newValue) {
              setState(() {
                maritalSelect = newValue;
              });
            },
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          // TextFormField(
          //   controller: dateCtl,
          //   onTap: () async {
          //     DateTime date = DateTime(1900);
          //     FocusScope.of(context).requestFocus(new FocusNode());

          //     date = await showDatePicker(
          //       context: context,
          //       initialDate: DateTime.now(),
          //       firstDate: DateTime(1900),
          //       lastDate: DateTime(2050),
          //     );
          //     var dateparse = DateTime.parse(date.toIso8601String());
          //     dateCtl.text =
          //         "${dateparse.year}-${dateparse.month}-${dateparse.day}";
          //   },
          //   decoration: InputDecoration(
          //     labelText: "D.O.B",
          //     floatingLabelBehavior: FloatingLabelBehavior.always,
          //   ),
          // ),
          SizedBox(
            height: getProportionateScreenWidth(15),
          ),
          DropDownField(
            controller: nationalities,
            hintText: "Select any Country",
            labelText: "Nationality",
            items: countryList,
            itemsVisibleInDropdown: 4,
            onValueChanged: (value) {
              selectNational = value;
            },
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropDownField(
            controller: birthCountry,
            hintText: "Select any Country",
            labelText: "Birth Country",
            items: countryList,
            itemsVisibleInDropdown: 4,
            onValueChanged: (value) {
              selectBirthCountry = value;
            },
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Provine",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          DropDownContainer(
            labelText: "Status",
            valueList: genderList,
            press: (String newValue) {
              genderSelect = newValue;
            },
          ),
          SizedBox(
            height: getProportionateScreenWidth(5),
          ),
          Text(
            "Transer => You are  currently working in Singapore and you are looking for another employer. You must get release paper form your currnt employer in order to do the transfer.\n New => You have never worked as domestic helper in Singapore before. You want to come to Singapore to work as domestic helper",
            style: TextStyle(
              color: kTextColor,
              fontSize: 13,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropDownContainer(
            labelText: "Ethnic Group",
            valueList: genderList,
            press: (String newValue) {
              genderSelect = newValue;
            },
          ),
        ],
      ),
    );
  }
}

class BuildQAForm extends StatefulWidget {
  @override
  _BuildQAFormState createState() => _BuildQAFormState();
}

class _BuildQAFormState extends State<BuildQAForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            maxLines: 3,
            decoration: InputDecoration(
              labelText: "Home many children do you have?",
              hintText: "e.g 2 girls age 8 and 6, 1 boy age at 15",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          TextFormField(
            maxLines: 3,
            decoration: InputDecoration(
              labelText: "Home many siblings do you have?",
              hintText: "e.g 2 girls age 8 and 6, 1 boy age at 15",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          TextFormField(
            maxLines: 3,
            decoration: InputDecoration(
              errorMaxLines: 2,
              labelText: "What is something you expect from employer?",
              hintText:
                  "e.g Employer should provide a minimum of 9 hours for resting",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          TextFormField(
            maxLines: 3,
            decoration: InputDecoration(
              isDense: true,
              labelText: "What is something you want your employer to know?",
              hintText:
                  "e.g I always take care of of infant and chilren and I like children very much",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
        ],
      ),
    );
  }
}

class BuildYesNoForm extends StatefulWidget {
  @override
  _BuildYesNoFormState createState() => _BuildYesNoFormState();
}

class _BuildYesNoFormState extends State<BuildYesNoForm> {
  bool _can = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          title: Text("Can eat beef"),
          value: _can,
          onChanged: (value) {
            setState(() {
              _can = value;
            });
          },
        ),
        SwitchListTile(
          title: Text("Can eat pig"),
          value: _can,
          onChanged: (value) {
            setState(() {
              _can = value;
            });
          },
        ),
      ],
    );
  }
}

class BuildSkillLevel extends StatefulWidget {
  @override
  _BuildSkillLevelState createState() => _BuildSkillLevelState();
}

class _BuildSkillLevelState extends State<BuildSkillLevel> {
  bool _average = true;
  bool _noExp = false;
  bool _veryExp = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Can cook basic food ?",
          //textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        CheckboxListTile(
            title: Text(
              'Average',
              style: TextStyle(color: Colors.black),
            ),
            value: _average,
            onChanged: (bool value) {
              setState(() {
                _average = value;
              });
            }),
        CheckboxListTile(
            title: Text(
              'No Experience',
              style: TextStyle(color: Colors.black),
            ),
            value: _noExp,
            onChanged: (bool value) {
              setState(() {
                _noExp = value;
              });
            }),
        CheckboxListTile(
            title: Text(
              'Very Experience',
              style: TextStyle(color: Colors.black),
            ),
            value: _veryExp,
            onChanged: (bool value) {
              setState(() {
                _veryExp = value;
              });
            })
      ],
    );
  }
}
