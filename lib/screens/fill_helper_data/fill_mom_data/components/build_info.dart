import 'package:dropdown_search/dropdown_search.dart';
import 'package:eha_app/components/drop_down_container.dart';
import 'package:eha_app/constant.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                      height: 20,
                      width: 20,
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
                FillGeneralForm(),
                SizedBox(
                  height: getProportionateScreenWidth(30),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/wives.svg',
                      height: 20,
                      width: 20,
                      color: Colors.cyan,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(
                      "SPOUSE INFOMATION",
                      style: TextStyle(color: Colors.cyan),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                BuildSpouseForm(),
                SizedBox(
                  height: getProportionateScreenWidth(30),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/clipboard.svg',
                      height: 20,
                      width: 20,
                      color: Colors.cyan,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(
                      "MALAYSIA INFOMATION",
                      style: TextStyle(color: Colors.cyan),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                BuildMalaysiaForm(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Spacer(),
                    Column(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: kPrimaryColor,
                        ),
                        Text('Swipe to continue'),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FillGeneralForm extends StatefulWidget {
  @override
  _FillGeneralFormState createState() => _FillGeneralFormState();
}

class _FillGeneralFormState extends State<FillGeneralForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> gender = ["Male", "Female"];
  List<String> has8yeducation = ["Yes", "No"];
  String selectedEducation = 'Yes';
  String genderSelect = "Male";
  List<String> passType = [
    'Not In Singapore Yet',
    'Socail Visit Pass',
    'Special Pass',
    'work pass(includs WP, ER, REP and S pass)'
  ];

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
  TextEditingController _nationality = TextEditingController();
  TextEditingController _birthCountry = TextEditingController();
  TextEditingController _passTypeController = TextEditingController();
  TextEditingController dateCtl = TextEditingController();

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
            height: getProportionateScreenWidth(12),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "FIN",
              hintText: "For Exmaple, A 1234567",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(12),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Work Permit Number",
              hintText: "For Exmaple, 12345678",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(15),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Citizen grandted at state/province",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Passport Number",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: dateCtl,
            onTap: () async {
              DateTime date = DateTime(2021);
              FocusScope.of(context).requestFocus(new FocusNode());

              date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              dateCtl.text = date.toIso8601String();
            },
            decoration: InputDecoration(
              labelText: "Passport Expired On",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(12),
          ),
          DropDownContainer(
            labelText: "Gender",
            selectedValue: genderSelect,
            valueList: gender,
            press: (String newValue) {
              setState(() {
                genderSelect = newValue;
              });
            },
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.MENU,
            showSelectedItem: true,
            items: passType,
            label: 'Immigration Pass Type',
            searchBoxController: _passTypeController,
            //onChanged: myProvider.setnationality,
            selectedItem: passType[0],
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropDownContainer(
            labelText: "Has 8 years of education",
            selectedValue: selectedEducation,
            valueList: has8yeducation,
            press: (String newValue) {
              setState(() {
                selectedEducation = newValue;
              });
            },
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.MENU,
            showSelectedItem: true,
            items: passType,
            label: 'Education',
            searchBoxController: _passTypeController,
            //onChanged: myProvider.setnationality,
            selectedItem: passType[0],
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
          DropdownSearch<String>(
            mode: Mode.MENU,
            showSelectedItem: true,
            items: countryList,
            label: 'Nationality',
            searchBoxController: _nationality,
            //onChanged: myProvider.setnationality,
            selectedItem: countryList[0],
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
            //onChanged: myProvider.setbirthCountry,
            selectedItem: countryList[0],
          ),
        ],
      ),
    );
  }
}

class BuildSpouseForm extends StatefulWidget {
  @override
  _BuildSpouseFormState createState() => _BuildSpouseFormState();
}

class _BuildSpouseFormState extends State<BuildSpouseForm> {
  TextEditingController dateCtl = TextEditingController();
  final _formKeyS = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKeyS,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Spouse Name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(15),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Spouse NRIC",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(15),
          ),
          TextFormField(
            controller: dateCtl,
            onTap: () async {
              DateTime date = DateTime(2021);
              FocusScope.of(context).requestFocus(new FocusNode());

              date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              dateCtl.text = date.toIso8601String();
            },
            decoration: InputDecoration(
              labelText: "Married On",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
        ],
      ),
    );
  }
}

class BuildMalaysiaForm extends StatefulWidget {
  @override
  _BuildMalaysiaFormState createState() => _BuildMalaysiaFormState();
}

class _BuildMalaysiaFormState extends State<BuildMalaysiaForm> {
  List<String> colorList = ['Pink', 'Blue'];
  String selectedColor = 'Blue';
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "IC Number",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(15),
          ),
          DropDownContainer(
            selectedValue: selectedColor,
            labelText: "IC Color",
            valueList: colorList,
            press: (String newValue) {
              setState(() {
                selectedColor = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
