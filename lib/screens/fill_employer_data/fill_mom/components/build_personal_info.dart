import 'package:dropdown_search/dropdown_search.dart';
import 'package:eha_app/components/info_title.dart';
import 'package:eha_app/providers/employer_mom_provider.dart';
import 'package:eha_app/services_api/country_services.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

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
                SizedBox(height: getProportionateScreenWidth(20)),
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
  CountryService get _service => GetIt.I<CountryService>();
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
  String momValidator(String value) {
    if (value.isEmpty || value.length == 0) {
      return "Required field";
    } else {
      return null;
    }
  }

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
  List<String> typeOfHouse = [
    "HDB (1-room)",
    "HDB (2-room)",
    "HDB (3-room)",
    "HDB (4-room)",
    "HDB (5-room)",
    "HUDC",
    "Landed property",
    "Non-HDB public flat / apartment",
    "Private flat / apartment",
    "Shop house",
    "Others",
  ];
  List<String> _countryList = [];

  @override
  void initState() {
    if (_countryList.length == 0 || _countryList.isEmpty) {
      _service.getCountryName().then((List<String> c) => setState(() {
            _countryList = c;
          }));
    }
    final momProivder =
        Provider.of<EmployerMomProvider>(context, listen: false);
    super.initState();
    _nameCtl = TextEditingController(text: momProivder.name);
    _newOrReplaceCtl =
        TextEditingController(text: momProivder.newOrReplaceHelper);
    _genderCtl = TextEditingController(text: momProivder.gender);
    _dateOfBirth = TextEditingController(text: momProivder.dob);
    _residentailStatus =
        TextEditingController(text: momProivder.residentStatus);
    _finCtl = TextEditingController(text: momProivder.nricOrFin);
    _passportNo = TextEditingController(text: momProivder.passport.no);
    _passportExpireDate =
        TextEditingController(text: momProivder.passport.expiredOn);
    _passportIssueIn =
        TextEditingController(text: momProivder.passport.issuedAt);
    _nationalityCtl = TextEditingController(text: momProivder.nationality);
    _maritalStatusCtl = TextEditingController(text: momProivder.martialStatus);
    _houseTypeCtl = TextEditingController(text: momProivder.houseType);
  }

  @override
  void dispose() {
    _nameCtl.dispose();
    _newOrReplaceCtl.dispose();
    _genderCtl.dispose();
    _dateOfBirth.dispose();
    _residentailStatus.dispose();
    _finCtl.dispose();
    _passportNo.dispose();
    _passportExpireDate.dispose();
    _passportIssueIn.dispose();
    _nationalityCtl.dispose();
    _maritalStatusCtl.dispose();
    _houseTypeCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final momProvider = Provider.of<EmployerMomProvider>(context);
    return Form(
      key: momProvider.momFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameCtl,
            validator: (value) => momValidator(value),
            onChanged: momProvider.setname,
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
            validator: (value) => momValidator(value),
            showSelectedItem: true,
            items: ['New Helper', 'Replacement Helper'],
            label: 'Immigration Pass Type',
            selectedItem: _newOrReplaceCtl.text,
            onChanged: (value) => momProvider.setnewOrReplaceHelper(value),
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
            validator: (value) => momValidator(value),
            onChanged: momProvider.setgender,
            items: ['Male', 'Female'],
            label: 'Gender',
            selectedItem: _genderCtl.text,
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _dateOfBirth,
            validator: (value) => momValidator(value),
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
              momProvider.setdob(date.toIso8601String());
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
            validator: (value) => momValidator(value),
            selectedItem: _residentailStatus.text,
            items: residentailStatusList,
            label: 'Residentail Status',
            searchBoxController: _residentailStatus,
            onChanged: (value) => momProvider.setresidentStatus(value),
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _finCtl,
            validator: (value) => momValidator(value),
            onChanged: (value) => momProvider.setnricOrFin(value),
            decoration: InputDecoration(
                labelText: "NRIC or FIN",
                hintText: "For example, A 123456 or A 1234567-",
                floatingLabelBehavior: FloatingLabelBehavior.always),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _passportNo,
            validator: (value) => momValidator(value),
            onChanged: momProvider.setpassportNo,
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
            validator: (value) => momValidator(value),
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
              momProvider.setexpiredOn(date.toIso8601String());
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
            validator: (value) => momValidator(value),
            onChanged: momProvider.setissueAt,
            decoration: InputDecoration(
                labelText: "Passport issue in",
                floatingLabelBehavior: FloatingLabelBehavior.always),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.DIALOG,
            popupBackgroundColor: Colors.grey[200],
            popupShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            validator: (value) => momValidator(value),
            onChanged: momProvider.setnationality,
            selectedItem: _nationalityCtl.text,
            searchBoxDecoration: InputDecoration(
              hintText: "Search country",
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            showSearchBox: true,
            showSelectedItem: true,
            items: _countryList,
            label: 'Nationality',
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
            validator: (value) => momValidator(value),
            selectedItem: _maritalStatusCtl.text,
            items: maritalStatusList,
            label: 'Marital Status',
            onChanged: (value) => momProvider.setmartialStatus(value),
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.DIALOG,
            popupBackgroundColor: Colors.grey[200],
            popupShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            searchBoxDecoration: InputDecoration(
              hintText: "Search type",
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            showSearchBox: true,
            onChanged: momProvider.sethouseType,
            validator: (value) => momValidator(value),
            selectedItem: _houseTypeCtl.text,
            items: typeOfHouse,
            label: "Housing Type",
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
        ],
      ),
    );
  }
}
