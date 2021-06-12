import 'package:dropdown_search/dropdown_search.dart';
import 'package:eha_app/components/info_title.dart';
import 'package:eha_app/models/employer.dart';
import 'package:eha_app/providers/employer_provider.dart';
import 'package:eha_app/services_api/country_services.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../../../constant.dart';

class BuildEmployerPersonalInfo extends StatefulWidget {
  @override
  _BuildEmployerPersonalInfoState createState() =>
      _BuildEmployerPersonalInfoState();
}

class _BuildEmployerPersonalInfoState extends State<BuildEmployerPersonalInfo>
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
                  height: getProportionateScreenHeight(20),
                ),
                InfoTitle(
                    icon: 'assets/icons/User.svg',
                    title: 'PERSONAL INFOMATION'),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                BuildGeneralInfo(),
                SizedBox(
                  height: getProportionateScreenWidth(30),
                ),
                InfoTitle(icon: 'assets/icons/wives.svg', title: 'FAMILY INFO'),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                BuildFamilyInfo(),
                SizedBox(
                  height: getProportionateScreenWidth(30),
                ),
                InfoTitle(icon: 'assets/icons/house.svg', title: 'HOUSE INFO'),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                BuildHouseInfo(),
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
  TextEditingController _genderCtl = TextEditingController();
  TextEditingController _maritalStatusCtl = TextEditingController();
  TextEditingController _nationalityCtl = TextEditingController();
  TextEditingController _religionCtl = TextEditingController();
  TextEditingController _idCtl = TextEditingController();
  TextEditingController _valueCtl = TextEditingController();

  String formValidator(String value) {
    if (value.isEmpty || value.length == 0) {
      return "Required field";
    } else {
      return null;
    }
  }

  List<String> _religionList = [
    "Buddhist",
    "Christian",
    "Free Thinker",
    "Hindu",
    "Mulism",
    "Sikh",
    "Other"
  ];
  List<String> maritalStatusList = [
    "Divorced",
    "Married",
    "Separated",
    "Single",
    "Widowed"
  ];
  List<String> _countryList = [];
  List<String> ethnicGroupList = [
    'Chinese',
    'Filipino',
    'Indian',
    'Indonesian',
    'Malay',
    'No Selected',
    'Other',
  ];
  @override
  void initState() {
    if (_countryList.length == 0 || _countryList.isEmpty) {
      _service.getCountryName().then((List<String> c) => setState(() {
            _countryList = c;
          }));
    }
    final infoProvider = Provider.of<EmployerProvider>(context, listen: false);
    super.initState();
    _nameCtl = TextEditingController(text: infoProvider.name);
    _genderCtl = TextEditingController(text: infoProvider.gender);
    _maritalStatusCtl = TextEditingController(text: infoProvider.maritalStatus);
    _nationalityCtl = TextEditingController(text: infoProvider.nationality);
    _religionCtl = TextEditingController(text: infoProvider.religion);
    _idCtl = TextEditingController(text: infoProvider.groupId);
    _valueCtl = TextEditingController(text: infoProvider.groudValue);
  }

  @override
  Widget build(BuildContext context) {
    final EmployerProvider infoProvider =
        Provider.of<EmployerProvider>(context);
    return Form(
      key: infoProvider.personalFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameCtl,
            validator: (value) => formValidator(value),
            onChanged: infoProvider.setName,
            decoration: InputDecoration(
              labelText: "Name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            validator: (value) => formValidator(value),
            onChanged: infoProvider.setGender,
            mode: Mode.MENU,
            showSelectedItem: true,
            selectedItem: _genderCtl.text,
            items: ['Male', 'Female'],
            label: 'Gender',
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.MENU,
            validator: (value) => formValidator(value),
            onChanged: infoProvider.setMaritalStatus,
            showSelectedItem: true,
            selectedItem: _maritalStatusCtl.text,
            items: maritalStatusList,
            label: 'Marital Status',
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
            validator: (value) => formValidator(value),
            onChanged: infoProvider.setNationality,
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
            validator: (value) => formValidator(value),
            onChanged: infoProvider.setReligion,
            selectedItem: _religionCtl.text,
            showSelectedItem: true,
            items: _religionList,
            label: 'Religion',
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _idCtl,
            validator: (value) => formValidator(value),
            onChanged: infoProvider.setGroupId,
            decoration: InputDecoration(
              labelText: "Ethnic Group ID",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.MENU,
            validator: (value) => formValidator(value),
            onChanged: infoProvider.setGroupValue,
            selectedItem: _valueCtl.text,
            showSelectedItem: true,
            items: ethnicGroupList,
            label: 'Ethnic Group',
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameCtl.dispose();
    _genderCtl.dispose();
    _maritalStatusCtl.dispose();
    _nationalityCtl.dispose();
    _religionCtl.dispose();
    _idCtl.dispose();
    _valueCtl.dispose();
    super.dispose();
  }
}

class BuildFamilyInfo extends StatefulWidget {
  @override
  _BuildFamilyInfoState createState() => _BuildFamilyInfoState();
}

class _BuildFamilyInfoState extends State<BuildFamilyInfo> {
  TextEditingController _memberNameCtl;
  TextEditingController _relationCtl;
  TextEditingController _nricFinCtl;
  TextEditingController _dateOfBirthCtl;
  GlobalKey<FormState> _formKey;
  bool _stayWithParent = true;
  bool _stayWithParentInLaw = true;
  var familyMembersProvider;
  int counter = 0;

  String memberFormValidate(String value) {
    if (value.isEmpty || value.length == 0) {
      return "Member info is required";
    } else {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey();
    _memberNameCtl = TextEditingController();
    _relationCtl = TextEditingController();
    _nricFinCtl = TextEditingController();
    _dateOfBirthCtl = TextEditingController();
    familyMembersProvider =
        Provider.of<EmployerProvider>(context, listen: false);
  }

  @override
  void dispose() {
    _memberNameCtl.dispose();
    _relationCtl.dispose();
    _nricFinCtl.dispose();
    _dateOfBirthCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final familyProvider = Provider.of<EmployerProvider>(context);
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _memberNameCtl,
                validator: (value) => memberFormValidate(value),
                decoration: InputDecoration(
                    labelText: "Member's name",
                    floatingLabelBehavior: FloatingLabelBehavior.always),
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              TextFormField(
                controller: _relationCtl,
                validator: (value) => memberFormValidate(value),
                decoration: InputDecoration(
                    labelText: "Relation to employer",
                    floatingLabelBehavior: FloatingLabelBehavior.always),
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              TextFormField(
                controller: _nricFinCtl,
                validator: (value) => memberFormValidate(value),
                decoration: InputDecoration(
                    labelText: "NRIC or FIN",
                    floatingLabelBehavior: FloatingLabelBehavior.always),
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              TextFormField(
                controller: _dateOfBirthCtl,
                validator: (value) => memberFormValidate(value),
                onTap: () async {
                  DateTime date = DateTime(1900);
                  FocusScope.of(context).requestFocus(new FocusNode());

                  date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2050),
                  );
                  //var dateparse = DateTime.parse(date.toIso8601String());
                  _dateOfBirthCtl.text = date.toIso8601String();
                },
                decoration: InputDecoration(
                    labelText: "Date of birth",
                    floatingLabelBehavior: FloatingLabelBehavior.always),
              ),
              SizedBox(
                height: getProportionateScreenWidth(10),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    familyMembersProvider.setFamilyMembersData(FamilyMembers(
                      name: _memberNameCtl.text,
                      relationToEmployeer: _relationCtl.text,
                      dob: _dateOfBirthCtl.text,
                      nricFin: _nricFinCtl.text,
                    ));
                  }
                },
                child: Text(
                  'Add member',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              Consumer<EmployerProvider>(builder: (context, provider, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: provider.familyMembers.length,
                  itemBuilder: (BuildContext context, int index) {
                    counter++;
                    return Dismissible(
                      key: Key(counter.toString()),
                      direction: DismissDirection.startToEnd,
                      onDismissed: (direction) {
                        familyMembersProvider.removeFamilyMember(index);
                      },
                      child: Container(
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(14)),
                        child: ListTile(
                          title: Text(provider
                                  .familyMembers[index].relationToEmployeer +
                              ": " +
                              provider.familyMembers[index].name),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(25),
            ),
            border: Border.all(color: kTextColor),
          ),
          child: SwitchListTile(
            title: Text(
              'Staying with parents',
              style: TextStyle(color: kTextColor),
            ),
            value: _stayWithParent,
            onChanged: (bool newValue) {
              familyProvider.setStayWithParent(newValue);
              setState(() {
                _stayWithParent = newValue;
              });
            },
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(20),
        ),
        Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(25),
            ),
            border: Border.all(color: kTextColor),
          ),
          child: SwitchListTile(
            title: Text(
              'Staying with parents in law',
              style: TextStyle(color: kTextColor),
            ),
            value: _stayWithParentInLaw,
            onChanged: (bool newValue) {
              familyProvider.setStayWithParentInLaw(newValue);
              setState(() {
                _stayWithParentInLaw = newValue;
              });
            },
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(20),
        ),
      ],
    );
  }
}

class BuildHouseInfo extends StatefulWidget {
  @override
  _BuildHouseInfoState createState() => _BuildHouseInfoState();
}

class _BuildHouseInfoState extends State<BuildHouseInfo> {
  TextEditingController _houseTypeCtl = TextEditingController();
  TextEditingController _noOfRoomsClt = TextEditingController();
  TextEditingController _noOfBathRoomsClt = TextEditingController();
  TextEditingController _noOfToiletsCtl = TextEditingController();
  TextEditingController _noOfFloorsCtl = TextEditingController();
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
  String houseValidator(String value) {
    if (value.isEmpty || value.length == 0) {
      return "House info is required field";
    } else {
      return null;
    }
  }

  @override
  void initState() {
    final houseProvider = Provider.of<EmployerProvider>(context, listen: false);
    super.initState();
    _houseTypeCtl = TextEditingController(text: houseProvider.houseType);
    _noOfRoomsClt = TextEditingController(text: houseProvider.noOfRooms);
    _noOfBathRoomsClt =
        TextEditingController(text: houseProvider.noOfBathrooms);
    _noOfToiletsCtl = TextEditingController(text: houseProvider.noOfToilets);
    _noOfFloorsCtl = TextEditingController(text: houseProvider.noOfFloors);
  }

  @override
  Widget build(BuildContext context) {
    final houseProvider = Provider.of<EmployerProvider>(context);
    return Form(
      key: houseProvider.houseFormKey,
      child: Column(
        children: [
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
            onChanged: houseProvider.setHouseType,
            validator: (value) => houseValidator(value),
            selectedItem: _houseTypeCtl.text,
            items: typeOfHouse,
            label: "Housing Type",
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _noOfRoomsClt,
            validator: (value) => houseValidator(value),
            onChanged: (value) => houseProvider.setNoOfRooms(int.parse(value)),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "No of rooms",
                floatingLabelBehavior: FloatingLabelBehavior.always),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _noOfBathRoomsClt,
            validator: (value) => houseValidator(value),
            onChanged: (value) =>
                houseProvider.setNoOfBathRooms(int.parse(value)),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "No of bathrooms",
                floatingLabelBehavior: FloatingLabelBehavior.always),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _noOfToiletsCtl,
            validator: (value) => houseValidator(value),
            onChanged: (value) =>
                houseProvider.setNoOfToilets(int.parse(value)),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "No of toilets",
                floatingLabelBehavior: FloatingLabelBehavior.always),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _noOfFloorsCtl,
            validator: (value) => houseValidator(value),
            onChanged: (value) => houseProvider.setNoOfFloors(int.parse(value)),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "No of floors",
                floatingLabelBehavior: FloatingLabelBehavior.always),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _houseTypeCtl.dispose();
    _noOfRoomsClt.dispose();
    _noOfBathRoomsClt.dispose();
    _noOfToiletsCtl.dispose();
    _noOfFloorsCtl.dispose();
    super.dispose();
  }
}
