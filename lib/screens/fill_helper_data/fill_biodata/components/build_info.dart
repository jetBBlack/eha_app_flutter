import 'package:dropdown_search/dropdown_search.dart';
import 'package:eha_app/constant.dart';
import 'package:eha_app/models/helper.dart';
import 'package:eha_app/providers/helper_provider.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class BuildPersonalInfoPage extends StatefulWidget {
  @override
  _BuildPersonalInfoPageState createState() => _BuildPersonalInfoPageState();
}

class _BuildPersonalInfoPageState extends State<BuildPersonalInfoPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                      style: TextStyle(color: Colors.cyan, fontSize: 18),
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
                      style: TextStyle(color: Colors.cyan, fontSize: 18),
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
                      style: TextStyle(color: Colors.cyan, fontSize: 18),
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
                      style: TextStyle(color: Colors.cyan, fontSize: 18),
                    ),
                  ],
                ),
                BuildSkillLevel(),
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
                      "MEDICAL INFO",
                      style: TextStyle(color: Colors.cyan, fontSize: 18),
                    ),
                  ],
                ),
                BuildMedicalInfo()
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class BuildGeneralInfo extends StatefulWidget {
  @override
  _BuildGeneralInfoState createState() => _BuildGeneralInfoState();
}

class _BuildGeneralInfoState extends State<BuildGeneralInfo> {
  Key _formKey = GlobalKey<FormState>(); //key

  //Controller var
  TextEditingController _name = TextEditingController();
  TextEditingController _province = TextEditingController();
  TextEditingController dateCtl = TextEditingController();
  TextEditingController _nationality = TextEditingController();
  TextEditingController _birthCountry = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _maritalStatus = TextEditingController();
  //Data var
  List<String> genderList = ["Male", "Female"];
  List<String> maritalStatusList = [
    "Divorced",
    "Married",
    "Separated",
    "Single",
    "Widowed"
  ];
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

  @override
  void initState() {
    final myProvider = Provider.of<HelperProvider>(context, listen: false);
    super.initState();
    _name = TextEditingController(text: myProvider.name);
    _gender = TextEditingController(text: myProvider.gender);
    _maritalStatus = TextEditingController(text: myProvider.maritalStatus);
    _nationality = TextEditingController(text: myProvider.nationality);
    _birthCountry = TextEditingController(text: myProvider.birthCountry);
    _province = TextEditingController(text: myProvider.province);
  }

  @override
  void dispose() {
    _name.dispose();
    _gender.dispose();
    _maritalStatus.dispose();
    _birthCountry.dispose();
    _nationality.dispose();
    _province.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HelperProvider myProvider = Provider.of<HelperProvider>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _name,
            onChanged: (value) => myProvider.setname(value),
            decoration: InputDecoration(
              labelText: "Name",
              hintText: "Enter your name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.MENU,
            showSelectedItem: true,
            items: ['Male', 'Female'],
            label: 'Gender',
            searchBoxController: _gender,
            onChanged: myProvider.setgender,
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.MENU,
            showSelectedItem: true,
            items: maritalStatusList,
            label: 'Marital Status',
            searchBoxController: _maritalStatus,
            onChanged: myProvider.setmaritalStatus,
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: dateCtl,
            inputFormatters: [],
            onTap: () async {
              DateTime date = DateTime(1900);
              FocusScope.of(context).requestFocus(new FocusNode());

              date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2050),
              );
              var dateparse = DateTime.parse(date.toIso8601String());
              dateCtl.text =
                  "${dateparse.year}-${dateparse.month}-${dateparse.day}";
            },
            decoration: InputDecoration(
              labelText: "D.O.B",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.MENU,
            showSelectedItem: true,
            items: countryList,
            label: 'Nationality',
            searchBoxController: _nationality,
            onChanged: myProvider.setnationality,
            selectedItem: countryList[0],
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.MENU,
            showSelectedItem: true,
            items: countryList,
            label: 'Birth Country',
            searchBoxController: _birthCountry,
            onChanged: myProvider.setbirthCountry,
            selectedItem: countryList[0],
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _province,
            onChanged: myProvider.setprovince,
            decoration: InputDecoration(
              labelText: "Provine",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          // DropDownContainer(
          //   labelText: "Status",
          //   valueList: genderList,
          //   press: (String newValue) {
          //     genderSelect = newValue;
          //   },
          // ),
          // SizedBox(
          //   height: getProportionateScreenWidth(5),
          // ),
          // Text(
          //   "Transer => You are  currently working in Singapore and you are looking for another employer. You must get release paper form your currnt employer in order to do the transfer.\n New => You have never worked as domestic helper in Singapore before. You want to come to Singapore to work as domestic helper",
          //   style: TextStyle(
          //     color: kTextColor,
          //     fontSize: 13,
          //     fontStyle: FontStyle.italic,
          //   ),
          // ),
          // SizedBox(
          //   height: getProportionateScreenWidth(20),
          // ),
          // DropDownContainer(
          //   labelText: "Ethnic Group",
          //   valueList: genderList,
          //   press: (String newValue) {
          //     genderSelect = newValue;
          //   },
          // ),
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
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            child: Text(
              'Home many children do you have?',
              style: TextStyle(color: kTextColor, fontSize: 14),
            ),
          ),
          SizedBox(height: 5),
          TextFormField(
            maxLines: 2,
            decoration: InputDecoration(
              labelText: 'Your answer',
              hintText: "e.g 2 girls age 8 and 6, 1 boy age at 15",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            child: Text(
              'Home many siblings do you have?',
              style: TextStyle(color: kTextColor, fontSize: 14),
            ),
          ),
          SizedBox(height: 5),
          TextFormField(
            maxLines: 2,
            decoration: InputDecoration(
              labelText: "Your answer",
              hintText: "e.g 2 girls age 8 and 6, 1 boy age at 15",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            child: Text(
              'What is something you expect from employer?',
              style: TextStyle(color: kTextColor, fontSize: 14),
            ),
          ),
          SizedBox(height: 5),
          TextFormField(
            maxLines: 2,
            decoration: InputDecoration(
              isDense: true,
              labelText: "Your answer",
              hintText:
                  "e.g Employer should provide a minimum of 9 hours for resting",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            child: Text(
              'What is something you want your employer to know?',
              style: TextStyle(color: kTextColor, fontSize: 14),
            ),
          ),
          SizedBox(height: 5),
          TextFormField(
            maxLines: 2,
            decoration: InputDecoration(
              isDense: true,
              //labelText: "What is something you want your employer to know?",
              labelText: 'Your answer',
              labelStyle: TextStyle(),
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
  bool _canEatBeef = false;
  bool _canEatPork = false;
  bool _canHandlePork = false;
  bool _canCall = false;
  bool _canNotCall = false;
  bool _afraidDog = false;
  bool _canWakeUpEarly = false;

  @override
  Widget build(BuildContext context) {
    final yesNoProvider = Provider.of<HelperProvider>(context);
    return Column(
      children: [
        SwitchListTile(
          title: Text("Can eat beef"),
          value: _canEatBeef,
          onChanged: (value) {
            if (value == true) {
              yesNoProvider.setYesNoData(
                  YesNoQuestions(id: 'Can eat beef', value: 'yes'));
            }
            setState(() {
              _canEatBeef = value;
            });
          },
        ),
        SwitchListTile(
          title: Text("Can eat pork"),
          value: _canEatPork,
          onChanged: (value) {
            if (value == true) {
              yesNoProvider.setYesNoData(
                  YesNoQuestions(id: 'Can eat pork', value: 'yes'));
            }
            setState(() {
              _canEatPork = value;
            });
          },
        ),
        SwitchListTile(
          title: Text("Can handle pork"),
          value: _canHandlePork,
          onChanged: (value) {
            if (value == true) {
              yesNoProvider.setYesNoData(
                  YesNoQuestions(id: 'Can handle pork', value: 'yes'));
            }
            setState(() {
              _canHandlePork = value;
            });
          },
        ),
        SwitchListTile(
          title: Text(
              "Can you ensure that you will only emergency call or your employer call during your working hour"),
          value: _canCall,
          onChanged: (value) {
            if (value == true) {
              yesNoProvider.setYesNoData(YesNoQuestions(
                  id: 'Can you ensure that you will only emergency call or your employer call during your working hour',
                  value: 'yes'));
            }
            setState(() {
              _canCall = value;
            });
          },
        ),
        SwitchListTile(
          title: Text(
              "Can you let your employer to keep your phone during your working hour"),
          value: _canNotCall,
          onChanged: (value) {
            if (value == true) {
              yesNoProvider.setYesNoData(YesNoQuestions(
                  id: 'Can you let your employer to keep your phone during your working hour',
                  value: 'yes'));
            }
            setState(() {
              _canNotCall = value;
            });
          },
        ),
        SwitchListTile(
          title: Text("Not afraid of dogs"),
          value: _afraidDog,
          onChanged: (value) {
            if (value == true) {
              yesNoProvider.setYesNoData(
                  YesNoQuestions(id: 'Not afraid of dogs', value: 'yes'));
            }
            setState(() {
              _afraidDog = value;
            });
          },
        ),
        SwitchListTile(
          title: Text("Prepare to wake up as early as 5am"),
          value: _canWakeUpEarly,
          onChanged: (value) {
            setState(() {
              _canWakeUpEarly = value;
            });
            if (value == true) {
              yesNoProvider.setYesNoData(YesNoQuestions(
                  id: 'Prepare to wake up as early as 5am', value: 'yes'));
            }
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
  List<String> skillLevel = ['Average', 'No Experience', 'Very Experience'];
  List<String> skills = [
    "Can cook Basic food ?",
    "Can cook India food ?",
    "Can cook Chinese food ?",
    "Can cook Malay food ?",
    "Can cook Western food ?",
    "Can speak Chinese ?",
    "Can speak Indian ?",
  ];
  List<String> selectedLevel = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < skills.length; i++) {
      selectedLevel.add(skillLevel.first);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: skills.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              skills[index],
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                    title: Text('Average'),
                    value: skillLevel.first,
                    groupValue: selectedLevel[index],
                    onChanged: (value) {
                      setState(() {
                        selectedLevel[index] = value;
                      });
                    }),
                RadioListTile(
                    title: Text('No Experience'),
                    value: skillLevel[1],
                    groupValue: selectedLevel[index],
                    onChanged: (value) {
                      setState(() {
                        selectedLevel[index] = value;
                      });
                    }),
                RadioListTile(
                    title: Text('Very Experience'),
                    value: skillLevel[2],
                    groupValue: selectedLevel[index],
                    onChanged: (value) {
                      setState(() {
                        selectedLevel[index] = value;
                      });
                    })
              ],
            ),
            // SingleChoice(
            //   itemList: skillLevel,
            //   selectedValue: selectedValue,
            //   press: (newValue) {
            //     setState(() {
            //       selectedValue = newValue;
            //     });
            //   },
            // ),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
          ],
        );
      },
    );
  }
}

class BuildMedicalInfo extends StatefulWidget {
  @override
  _BuildMedicalInfoState createState() => _BuildMedicalInfoState();
}

class _BuildMedicalInfoState extends State<BuildMedicalInfo> {
  bool _asthma = false;
  bool _diabetes = false;
  bool _malaria = false;
  bool _epilepsy = false;
  bool _mentalIllness = false;
  bool _operation = false;
  bool _tuberculosis = false;
  @override
  Widget build(BuildContext context) {
    final medicalProvider = Provider.of<HelperProvider>(context);
    return Column(
      children: [
        SwitchListTile(
          title: Text("Asthma"),
          value: _asthma,
          onChanged: (value) {
            if (value == true) {
              medicalProvider
                  .setMedicalInfoData(Medicals(id: 'Asthmas', value: 'yes'));
            }
            setState(() {
              _asthma = value;
            });
          },
        ),
        SwitchListTile(
          title: Text("Diabetes"),
          value: _diabetes,
          onChanged: (value) {
            setState(() {
              _diabetes = value;
            });
          },
        ),
        SwitchListTile(
          title: Text("Epilepsy"),
          value: _epilepsy,
          onChanged: (value) {
            setState(() {
              _epilepsy = value;
            });
          },
        ),
        SwitchListTile(
          title: Text("Malaria"),
          value: _malaria,
          onChanged: (value) {
            setState(() {
              _malaria = value;
            });
          },
        ),
        SwitchListTile(
          title: Text("Mental Illness"),
          value: _mentalIllness,
          onChanged: (value) {
            setState(() {
              _mentalIllness = value;
            });
          },
        ),
        SwitchListTile(
          title: Text("Operation"),
          value: _operation,
          onChanged: (value) {
            setState(() {
              _operation = value;
            });
          },
        ),
        SwitchListTile(
          title: Text("Tuberculosis"),
          value: _tuberculosis,
          onChanged: (value) {
            setState(() {
              _tuberculosis = value;
            });
          },
        ),
      ],
    );
  }
}
