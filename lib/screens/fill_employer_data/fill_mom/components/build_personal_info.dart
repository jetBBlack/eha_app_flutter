import 'package:dropdown_search/dropdown_search.dart';
import 'package:eha_app/components/info_title.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';

class BuildPersonalInfo extends StatefulWidget {
  @override
  _BuildPersonalInfoState createState() => _BuildPersonalInfoState();
}

class _BuildPersonalInfoState extends State<BuildPersonalInfo>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                InfoTitle(
                    icon: 'assets/icons/User.svg',
                    title: "GENERAL INFORMATION"),
                SizedBox(height: getProportionateScreenWidth(20)),
                BuildGeneralInfo(),
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
  TextEditingController _nameCtl = TextEditingController();
  TextEditingController _newOrReplaceCtl = TextEditingController();
  TextEditingController _genderCtl = TextEditingController();
  TextEditingController _dateOfBirth = TextEditingController();
  TextEditingController _residentailStatus = TextEditingController();
  TextEditingController _finCtl = TextEditingController();
  TextEditingController _passportNo = TextEditingController();
  TextEditingController _passportExpireDate = TextEditingController();
  TextEditingController _passportIssueIn = TextEditingController();
  TextEditingController _nationalityCtl = TextEditingController();
  TextEditingController _maritalStatusCtl = TextEditingController();
  TextEditingController _houseTypeCtl = TextEditingController();

  //Data list
  List<String> residentailStatusList = [
    "Depedant's Pass",
    "Diplomat",
    "Employment or S Pass",
    "Long Term Visit Pass",
    "Others",
    "Singapore Citizen",
    "Singapore PR",
  ];
  List<String> maritalStatusList = [
    "Divorced",
    "Married",
    "Separated",
    "Single",
    "Widowed"
  ];
  List<String> countryList = [
    "Philippines",
    "India",
    "Sri Lanka",
    "Bangladesh",
    "Malaysia",
    "Indonesia",
    "HongKong",
    "Macau",
    "Taiwan",
    "Thailand",
    "South Korea",
    "Camboida",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _nameCtl,
            decoration: InputDecoration(
              labelText: "Name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.MENU,
            showSelectedItem: true,
            items: ['New Helper', 'Replacement Helper'],
            label: 'Immigration Pass Type',
            searchBoxController: _newOrReplaceCtl,
            //onChanged: (value) => formProvider.setpassType(value),
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
            //onChanged: (value) => formProvider.setgender(value),
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _dateOfBirth,
            //onChanged: formProvider.setmarriedDate,
            onTap: () async {
              DateTime date = DateTime(2021);
              FocusScope.of(context).requestFocus(new FocusNode());

              date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              _dateOfBirth.text = date.toIso8601String();
              //formProvider.setmarriedDate(date.toIso8601String());
            },
            decoration: InputDecoration(
              labelText: "Date of birth",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.MENU,
            showSelectedItem: true,
            items: residentailStatusList,
            label: 'Residentail Status',
            searchBoxController: _residentailStatus,
            //onChanged: (value) => formProvider.setgender(value),
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _finCtl,
            decoration: InputDecoration(
                labelText: "FIN",
                hintText: "For example, A 123456 or A 1234567-",
                floatingLabelBehavior: FloatingLabelBehavior.always),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _finCtl,
            decoration: InputDecoration(
              labelText: "NRIC",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _passportNo,
            decoration: InputDecoration(
              labelText: "Passport Number",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _passportExpireDate,
            //onChanged: formProvider.setmarriedDate,
            onTap: () async {
              DateTime date = DateTime(2021);
              FocusScope.of(context).requestFocus(new FocusNode());

              date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              var dateparse = DateTime.parse(date.toIso8601String());
              _passportExpireDate.text =
                  "${dateparse.year}-${dateparse.month}-${dateparse.day}";
              //formProvider.setmarriedDate(date.toIso8601String());
            },
            decoration: InputDecoration(
              labelText: "Passport expired on",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _passportIssueIn,
            decoration: InputDecoration(
                labelText: "Passport issue in",
                floatingLabelBehavior: FloatingLabelBehavior.always),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.MENU,
            showSelectedItem: true,
            items: countryList,
            label: 'Nationality',
            searchBoxController: _nationalityCtl,
            //onChanged: (value) => formProvider.setgender(value),
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
            searchBoxController: _maritalStatusCtl,
            //onChanged: (value) => formProvider.setgender(value),
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
            label: 'Housing Type',
            searchBoxController: _houseTypeCtl,
            //onChanged: (value) => formProvider.setgender(value),
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
        ],
      ),
    );
  }
}
