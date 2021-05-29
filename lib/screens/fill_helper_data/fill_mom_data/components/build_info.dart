import 'package:dropdown_search/dropdown_search.dart';

import 'package:eha_app/constant.dart';
import 'package:eha_app/providers/helper_mom_provider.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

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
  //controller
  TextEditingController _nameCtl = TextEditingController();
  TextEditingController _finCtl = TextEditingController();
  TextEditingController _workPromoteCtl = TextEditingController();
  TextEditingController _citizen = TextEditingController();
  TextEditingController _passportNoCtl = TextEditingController();
  TextEditingController _genderCtl = TextEditingController();
  TextEditingController _educationCtl = TextEditingController();
  TextEditingController _educationLvlCtl = TextEditingController();
  TextEditingController _ethnicGroupCtl = TextEditingController();
  TextEditingController _maritalStatusCtl = TextEditingController();
  //Data var

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
  List<String> educationLevelList = [];
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
  TextEditingController _passTypeCtl = TextEditingController();
  TextEditingController _expireDateCtl = TextEditingController();

  @override
  void initState() {
    final HelperMomProvider formProvdider =
        Provider.of<HelperMomProvider>(context, listen: false);
    super.initState();
    _nameCtl = TextEditingController(text: formProvdider.name);
    _finCtl = TextEditingController(text: formProvdider.fin);
    _workPromoteCtl = TextEditingController(text: formProvdider.workPromoteNo);
    _citizen = TextEditingController(text: formProvdider.citizen);
    _passportNoCtl = TextEditingController(text: formProvdider.passportNo);
    _genderCtl = TextEditingController(text: formProvdider.gender);
    _educationCtl = TextEditingController(text: formProvdider.educaton);
    _educationLvlCtl =
        TextEditingController(text: formProvdider.educationLevel);
    _ethnicGroupCtl = TextEditingController(text: formProvdider.ethnicGroup);
    _nationality = TextEditingController(text: formProvdider.nationality);
    _birthCountry = TextEditingController(text: formProvdider.birthCountry);
    _passTypeCtl = TextEditingController(text: formProvdider.passType);
    _expireDateCtl =
        TextEditingController(text: formProvdider.passportExpireDate);
  }

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<HelperMomProvider>(context);
    return Form(
      key: formProvider.globalHelperMomFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameCtl,
            onChanged: formProvider.setname,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your name";
              }
              return null;
            },
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
            controller: _finCtl,
            onChanged: formProvider.setfin,
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
            controller: _workPromoteCtl,
            onChanged: formProvider.setworkPromoteNo,
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
            controller: _citizen,
            onChanged: formProvider.setcitizen,
            decoration: InputDecoration(
              labelText: "Citizen grandted at state/province",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _passportNoCtl,
            onChanged: formProvider.setpassportNo,
            decoration: InputDecoration(
              labelText: "Passport Number",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _expireDateCtl,
            onChanged: (value) => formProvider.setpassportExpireDate(value),
            onTap: () async {
              DateTime date = DateTime(2021);
              FocusScope.of(context).requestFocus(new FocusNode());

              date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              _expireDateCtl.text = date.toIso8601String();
            },
            decoration: InputDecoration(
              labelText: "Passport Expired On",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(12),
          ),
          DropdownSearch<String>(
            mode: Mode.MENU,
            showSelectedItem: true,
            items: passType,
            label: 'Immigration Pass Type',
            searchBoxController: _passTypeCtl,
            onChanged: (value) => formProvider.setpassType(value),
            selectedItem: passType[0],
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
            items: ['Male', 'Female'],
            label: 'Gender',
            searchBoxController: _genderCtl,
            onChanged: (value) => formProvider.setgender(value),
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
            items: ['Yes', 'No'],
            label: 'Has 8 years of education',
            searchBoxController: _educationCtl,
            onChanged: (value) => formProvider.seteducation(value),
            selectedItem: 'Yes',
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
            items: educationLevelList,
            label: 'Education',
            searchBoxController: _educationLvlCtl,
            onChanged: (value) {
              formProvider.seteducationlevel(value);
            },
            selectedItem: passType[0],
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.MENU,
            showSelectedItem: true,
            items: maritalStatusList,
            label: 'Marital Status',
            onChanged: (value) {
              formProvider.setmaritalStatus(value);
            },
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
            label: 'Nationality',
            searchBoxController: _nationality,
            onChanged: formProvider.setnationality,
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
            onChanged: formProvider.setbirthCountry,
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
            label: 'Ethnic Group',
            searchBoxController: _ethnicGroupCtl,
            onChanged: (value) => formProvider.setethnicGroup(value),
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameCtl.dispose();
    _finCtl.dispose();
    _workPromoteCtl.dispose();
    _citizen.dispose();
    _passportNoCtl.dispose();
    _genderCtl.dispose();
    _educationCtl.dispose();
    _educationLvlCtl.dispose();
    _ethnicGroupCtl.dispose();
    _maritalStatusCtl.dispose();
    _nationality.dispose();
    _birthCountry.dispose();
    _expireDateCtl.dispose();
    super.dispose();
  }
}

class BuildSpouseForm extends StatefulWidget {
  @override
  _BuildSpouseFormState createState() => _BuildSpouseFormState();
}

class _BuildSpouseFormState extends State<BuildSpouseForm> {
  TextEditingController _spouseNameCtl = TextEditingController();
  TextEditingController _spouseNricCtl = TextEditingController();
  TextEditingController _marriedDateCtl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final spouseProvider = Provider.of<HelperMomProvider>(context);
    return Form(
      key: spouseProvider.globalHelperMomFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: _spouseNameCtl,
            onChanged: spouseProvider.setspouseName,
            decoration: InputDecoration(
              labelText: "Spouse Name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(15),
          ),
          TextFormField(
            controller: _spouseNricCtl,
            onChanged: spouseProvider.setspouseNric,
            decoration: InputDecoration(
              labelText: "Spouse NRIC",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(15),
          ),
          TextFormField(
            controller: _marriedDateCtl,
            onChanged: (value) => spouseProvider.setspouseMarriedOn,
            onTap: () async {
              DateTime date = DateTime(2021);
              FocusScope.of(context).requestFocus(new FocusNode());

              date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              _marriedDateCtl.text = date.toIso8601String();
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

  @override
  void dispose() {
    _spouseNameCtl.dispose();
    _spouseNricCtl.dispose();
    super.dispose();
  }
}

class BuildMalaysiaForm extends StatefulWidget {
  @override
  _BuildMalaysiaFormState createState() => _BuildMalaysiaFormState();
}

class _BuildMalaysiaFormState extends State<BuildMalaysiaForm> {
  TextEditingController _icNumber = TextEditingController();
  TextEditingController _colorCtl = TextEditingController();

  List<String> colorList = ['Pink', 'Blue'];

  @override
  void initState() {
    final malayProvider =
        Provider.of<HelperMomProvider>(context, listen: false);
    super.initState();
    _icNumber = TextEditingController(text: malayProvider.no);
    _colorCtl = TextEditingController(text: malayProvider.colour);
  }

  @override
  Widget build(BuildContext context) {
    final malayProvider = Provider.of<HelperMomProvider>(context);
    return Form(
      key: malayProvider.globalHelperMomFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: _icNumber,
            onChanged: (value) => malayProvider.setno(value),
            decoration: InputDecoration(
              labelText: "IC Number",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(15),
          ),
          DropdownSearch<String>(
            mode: Mode.MENU,
            showSelectedItem: true,
            items: colorList,
            label: 'IC Color',
            searchBoxController: _colorCtl,
            onChanged: (value) => malayProvider.setcolour(value),
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _colorCtl.dispose();
    _icNumber.dispose();
    super.dispose();
  }
}
