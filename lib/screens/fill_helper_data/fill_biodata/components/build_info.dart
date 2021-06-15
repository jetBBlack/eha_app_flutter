import 'package:dropdown_search/dropdown_search.dart';
import 'package:eha_app/constant.dart';
import 'package:eha_app/models/helper.dart';
import 'package:eha_app/providers/helper_provider.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:provider/provider.dart';

class BuildPersonalInfoPage extends StatefulWidget {
  @override
  _BuildPersonalInfoPageState createState() => _BuildPersonalInfoPageState();
}

class _BuildPersonalInfoPageState extends State<BuildPersonalInfoPage>
    with AutomaticKeepAliveClientMixin {
  // @override
  // // void initState() {
  // //   final HelperProvider initProvider =
  // //       Provider.of<HelperProvider>(context, listen: false);
  // //   super.initState();
  // //   initProvider.initHelper();
  // // }

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
  //Controller var
  TextEditingController _name = TextEditingController();
  TextEditingController _province = TextEditingController();
  TextEditingController _dateCtl = TextEditingController();
  TextEditingController _nationality = TextEditingController();
  TextEditingController _birthCountry = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _maritalStatus = TextEditingController();
  TextEditingController _contactCtl = TextEditingController();
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
    _dateCtl = TextEditingController(text: myProvider.dayOfBirth.split('T')[0]);
    _maritalStatus = TextEditingController(text: myProvider.maritalStatus);
    _nationality = TextEditingController(text: myProvider.nationality);
    _birthCountry = TextEditingController(text: myProvider.birthCountry);
    _province = TextEditingController(text: myProvider.province);
    _contactCtl = TextEditingController(text: myProvider.contactInfo);
  }

  @override
  void dispose() {
    _name.dispose();
    _gender.dispose();
    _dateCtl.dispose();
    _maritalStatus.dispose();
    _birthCountry.dispose();
    _nationality.dispose();
    _province.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HelperProvider formProvider = Provider.of<HelperProvider>(context);
    return Form(
      key: formProvider.globalFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: _name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Name must be not null";
              }
              return null;
            },
            onChanged: (value) => formProvider.setname(value),
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
            selectedItem: _gender.text,
            showSelectedItem: true,
            items: ['Male', 'Female'],
            label: 'Gender',
            onChanged: formProvider.setgender,
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
            selectedItem: _maritalStatus.text,
            onChanged: formProvider.setmaritalStatus,
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _dateCtl,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp('[a-zA-Z]')),
              FilteringTextInputFormatter.allow(RegExp(r'[/\\]')),
              FilteringTextInputFormatter.digitsOnly,
            ],
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
              _dateCtl.text =
                  "${dateparse.year}-${dateparse.month}-${dateparse.day}";
              formProvider.setdayOfBirth(date.toIso8601String());
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
            selectedItem: _nationality.text,
            onChanged: formProvider.setnationality,
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
            selectedItem: _birthCountry.text,
            onChanged: formProvider.setbirthCountry,
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _province,
            onChanged: formProvider.setprovince,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Provine must be not null';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Provine",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          TextFormField(
            controller: _contactCtl,
            onChanged: formProvider.setcontactNo,
            decoration: InputDecoration(
              labelText: "Contact No",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          )
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
  bool _canWashClothesbyHand = false;
  bool _canCall = false;
  bool _canNotCall = false;
  bool _afraidDog = false;
  bool _canWakeUpEarly = false;

  @override
  Widget build(BuildContext context) {
    final yesNoProvider = Provider.of<HelperProvider>(context, listen: false);
    return Column(
      children: [
        SwitchListTile(
          title: Text("Can eat beef"),
          value: _canEatBeef,
          onChanged: (value) {
            if (value == true) {
              yesNoProvider.setYesNoData(
                  YesNoQuestions(id: 'Can eat beef', value: 'yes'));
            } else {
              yesNoProvider.removeYesNoData(
                  YesNoQuestions(id: 'Can eat beef', value: 'yes'));
            }
            setState(() {
              _canEatBeef = value;
            });
          },
        ),
        Divider(),
        SwitchListTile(
          title: Text("Can eat pork"),
          value: _canEatPork,
          onChanged: (value) {
            if (value == true) {
              yesNoProvider.setYesNoData(
                  YesNoQuestions(id: 'Can eat pork', value: 'yes'));
            } else {
              yesNoProvider.removeYesNoData(
                  YesNoQuestions(id: 'Can eat pork', value: 'yes'));
            }
            setState(() {
              _canEatPork = value;
            });
          },
        ),
        Divider(),
        SwitchListTile(
          title: Text("Can handle pork"),
          value: _canHandlePork,
          onChanged: (value) {
            if (value == true) {
              yesNoProvider.setYesNoData(
                  YesNoQuestions(id: 'Can handle pork', value: 'yes'));
            } else {
              yesNoProvider.removeYesNoData(
                  YesNoQuestions(id: 'Can handle pork', value: 'yes'));
            }
            setState(() {
              _canHandlePork = value;
            });
          },
        ),
        Divider(),
        SwitchListTile(
          title: Text("Can wash clothes by hand"),
          value: _canWashClothesbyHand,
          onChanged: (value) {
            if (value == true) {
              yesNoProvider.setYesNoData(
                  YesNoQuestions(id: 'Can wash clothes by hand', value: 'yes'));
            } else {
              yesNoProvider.removeYesNoData(
                  YesNoQuestions(id: 'Can wash clothes by hand', value: 'yes'));
            }
            setState(() {
              _canWashClothesbyHand = value;
            });
          },
        ),
        Divider(),
        SwitchListTile(
          title: Text(
              "Can you ensure that you will only emergency call or your employer call during your working hour"),
          value: _canCall,
          onChanged: (value) {
            if (value == true) {
              yesNoProvider.setYesNoData(YesNoQuestions(
                  id: 'Can you ensure that you will only emergency call or your employer call during your working hour',
                  value: 'yes'));
            } else {
              yesNoProvider.removeYesNoData(YesNoQuestions(
                  id: 'Can you ensure that you will only emergency call or your employer call during your working hour',
                  value: 'yes'));
            }
            setState(() {
              _canCall = value;
            });
          },
        ),
        Divider(),
        SwitchListTile(
          title: Text(
              "Can you let your employer to keep your phone during your working hour"),
          value: _canNotCall,
          onChanged: (value) {
            if (value == true) {
              yesNoProvider.setYesNoData(YesNoQuestions(
                  id: 'Can you let your employer to keep your phone during your working hour',
                  value: 'yes'));
            } else {
              yesNoProvider.removeYesNoData(YesNoQuestions(
                  id: 'Can you let your employer to keep your phone during your working hour',
                  value: 'yes'));
            }
            setState(() {
              _canNotCall = value;
            });
          },
        ),
        Divider(),
        SwitchListTile(
          title: Text("Not afraid of dogs"),
          value: _afraidDog,
          onChanged: (value) {
            if (value == true) {
              yesNoProvider.setYesNoData(
                  YesNoQuestions(id: 'Not afraid of dogs', value: 'yes'));
            } else {
              yesNoProvider.removeYesNoData(
                  YesNoQuestions(id: 'Not afraid of dogs', value: 'yes'));
            }
            setState(() {
              _afraidDog = value;
            });
          },
        ),
        Divider(),
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
            } else {
              yesNoProvider.removeYesNoData(YesNoQuestions(
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
    "Can cook Indian food ?",
    "Can cook Malay food ?",
    "Can cook Western food ?",
    "Can cook Chinese food ?",
    "Can speak Chinese ?",
    "Can speak English ?",
    "Can speak Indian ?",
    "Can speak Malay",
    "Do Marketting",
    "Do gardening",
    "Do general housework",
    "Take care of autism children",
    "Take care of children (2-12 years)",
    "Take care of elderly",
    "Take care of infants (4-24 months)",
    "Take care of new-born baby",
  ];
  List<String> selectedLevel = [];

  @override
  void initState() {
    for (int i = 0; i < skills.length; i++) {
      selectedLevel.add(skillLevel.first);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HelperProvider skillsProvider = Provider.of<HelperProvider>(context);
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: skills.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 8.0, top: 12.0, bottom: 0.0),
              child: Text(
                skills[index],
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            RadioButtonGroup(
              labels: skillLevel,
              labelStyle: TextStyle(
                fontSize: 16,
              ),
              onChange: (String label, int index) {},
              onSelected: (String label) {
                skillsProvider
                    .setSkillLevelData(Skills(id: skills[index], value: label));
              },
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
            } else if (value == false) {
              medicalProvider.setFalseMedicalInfoData(
                  Medicals(id: 'Asthmas', value: 'yes'));
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
            if (value == true) {
              medicalProvider
                  .setMedicalInfoData(Medicals(id: 'Diabetes', value: 'yes'));
            } else {
              medicalProvider.setFalseMedicalInfoData(
                  Medicals(id: 'Diabetes', value: 'yes'));
            }
            setState(() {
              _diabetes = value;
            });
          },
        ),
        SwitchListTile(
          title: Text("Epilepsy"),
          value: _epilepsy,
          onChanged: (value) {
            if (value == true) {
              medicalProvider
                  .setMedicalInfoData(Medicals(id: 'Epilepsy', value: 'yes'));
            } else {
              medicalProvider.setFalseMedicalInfoData(
                  Medicals(id: 'Epilepsy', value: 'yes'));
            }
            setState(() {
              _epilepsy = value;
            });
          },
        ),
        SwitchListTile(
          title: Text("Malaria"),
          value: _malaria,
          onChanged: (value) {
            if (value == true) {
              medicalProvider
                  .setMedicalInfoData(Medicals(id: 'Malaria', value: 'yes'));
            } else {
              medicalProvider.setFalseMedicalInfoData(
                  Medicals(id: 'Malaria', value: 'yes'));
            }
            setState(() {
              _malaria = value;
            });
          },
        ),
        SwitchListTile(
          title: Text("Mental Illness"),
          value: _mentalIllness,
          onChanged: (value) {
            if (value == true) {
              medicalProvider.setMedicalInfoData(
                  Medicals(id: 'Mental Illness', value: 'yes'));
            } else {
              medicalProvider.setFalseMedicalInfoData(
                  Medicals(id: 'Mental Illness', value: 'yes'));
            }
            setState(() {
              _mentalIllness = value;
            });
          },
        ),
        SwitchListTile(
          title: Text("Operation"),
          value: _operation,
          onChanged: (value) {
            if (value == true) {
              medicalProvider
                  .setMedicalInfoData(Medicals(id: 'Operation', value: 'yes'));
            } else {
              medicalProvider.setFalseMedicalInfoData(
                  Medicals(id: 'Operation', value: 'yes'));
            }
            setState(() {
              _operation = value;
            });
          },
        ),
        SwitchListTile(
          title: Text("Tuberculosis"),
          value: _tuberculosis,
          onChanged: (value) {
            if (value == true) {
              medicalProvider.setMedicalInfoData(
                  Medicals(id: 'Tuberculosis', value: 'yes'));
            } else {
              medicalProvider.setFalseMedicalInfoData(
                  Medicals(id: 'Tuberculosis', value: 'yes'));
            }
            setState(() {
              _tuberculosis = value;
            });
          },
        ),
      ],
    );
  }
}
