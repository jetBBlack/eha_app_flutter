import 'package:dropdown_search/dropdown_search.dart';
import 'package:eha_app/components/info_title.dart';
import 'package:eha_app/constant.dart';
import 'package:eha_app/providers/employer_provider.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider/provider.dart';

class BuildExpectation extends StatefulWidget {
  @override
  _BuildExpectationState createState() => _BuildExpectationState();
}

class _BuildExpectationState extends State<BuildExpectation>
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
                InfoTitle(
                    icon: 'assets/icons/happiness.svg', title: "EXPECTATION"),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                BuildExpectationForm(),
                SizedBox(
                  height: getProportionateScreenWidth(30),
                ),
                InfoTitle(icon: 'assets/icons/duty-free.svg', title: 'Duties'),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                BuildDuties(),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
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

class BuildExpectationForm extends StatefulWidget {
  @override
  _BuildExpectationFormState createState() => _BuildExpectationFormState();
}

class _BuildExpectationFormState extends State<BuildExpectationForm> {
  TextEditingController _offSalaryCtl = TextEditingController();
  TextEditingController _firstPriorityCtl = TextEditingController();
  TextEditingController _secondPriority = TextEditingController();
  TextEditingController _thirdPriority = TextEditingController();
  TextEditingController _helperJoinOn = TextEditingController();
  TextEditingController _expectationCtl = TextEditingController();
  TextEditingController _nonExpectationCtl = TextEditingController();
  List<String> priorities = [
    "Can cook Basic food",
    "Can cook Indian food",
    "Can cook Malay food",
    "Can cook Western food",
    "Can cook Chinese food",
    "Can speak Chinese",
    "Can speak English",
    "Can speak Indian",
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

  String expectationValidate(String value) {
    if (value.isEmpty || value.length == 0) {
      return "Required field";
    } else {
      return null;
    }
  }

  @override
  void initState() {
    final expectProvider =
        Provider.of<EmployerProvider>(context, listen: false);
    super.initState();
    _offSalaryCtl = TextEditingController(text: expectProvider.offerSalary);
    _firstPriorityCtl =
        TextEditingController(text: expectProvider.firstPriority);
    _secondPriority =
        TextEditingController(text: expectProvider.secondPriority);
    _thirdPriority = TextEditingController(text: expectProvider.thirdPriority);
    _helperJoinOn = TextEditingController(text: expectProvider.helperJoinOn);
    _expectationCtl =
        TextEditingController(text: expectProvider.expectationInfo);
    _nonExpectationCtl =
        TextEditingController(text: expectProvider.nonExpectation);
  }

  @override
  void dispose() {
    _offSalaryCtl.dispose();
    _firstPriorityCtl.dispose();
    _secondPriority.dispose();
    _thirdPriority.dispose();
    _helperJoinOn.dispose();
    _expectationCtl.dispose();
    _nonExpectationCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final EmployerProvider expectProvider =
        Provider.of<EmployerProvider>(context);
    return Form(
      key: expectProvider.expectationKey,
      child: Column(
        children: [
          TextFormField(
            controller: _offSalaryCtl,
            validator: (value) => expectationValidate(value),
            onChanged: (value) =>
                expectProvider.setOfferSalary(int.parse(value)),
            decoration: InputDecoration(
              labelStyle: TextStyle(fontSize: 16),
              labelText: "Offer Salary",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.DIALOG,
            onChanged: expectProvider.setFirstPriority,
            validator: (value) => expectationValidate(value),
            popupBackgroundColor: Colors.grey[200],
            popupShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            items: priorities,
            showSelectedItem: true,
            selectedItem: _firstPriorityCtl.text,
            label: '1st Priority',
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
            showSearchBox: true,
            searchBoxDecoration: InputDecoration(
              hintText: 'Search duty',
              prefixIcon: Icon(
                Icons.search,
                color: kTextColor,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: kTextColor)),
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
            onChanged: expectProvider.setSecondPriority,
            validator: (value) => expectationValidate(value),
            items: priorities,
            selectedItem: _secondPriority.text,
            label: '2st Priority',
            showSelectedItem: true,
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
            showSearchBox: true,
            searchBoxDecoration: InputDecoration(
              hintText: 'Search Duty',
              prefixIcon: Icon(
                Icons.search,
                color: kTextColor,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: kTextColor)),
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
            validator: (value) => expectationValidate(value),
            onChanged: expectProvider.setThirdPriority,
            items: priorities,
            label: '3st Priority',
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
            showSearchBox: true,
            showSelectedItem: true,
            selectedItem: _thirdPriority.text,
            searchBoxDecoration: InputDecoration(
              hintText: 'Search Duty',
              prefixIcon: Icon(
                Icons.search,
                color: kTextColor,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: kTextColor)),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _helperJoinOn,
            validator: (value) => expectationValidate(value),
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
              _helperJoinOn.text =
                  "${dateparse.year}-${dateparse.month}-${dateparse.day}";
              expectProvider.setHelperJoinOn(date.toIso8601String());
            },
            decoration: InputDecoration(
              labelText: "I expect to get domestic helper on",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _expectationCtl,
            validator: (value) => expectationValidate(value),
            onChanged: expectProvider.setExpectationInfo,
            decoration: InputDecoration(
              labelText: "My expectation for domestic helper",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _nonExpectationCtl,
            validator: (value) => expectationValidate(value),
            onChanged: expectProvider.setNonExpectation,
            decoration: InputDecoration(
              labelText: "Not my expectation for domestic helper",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          )
        ],
      ),
    );
  }
}

class BuildDuties extends StatefulWidget {
  @override
  _BuildDutiesState createState() => _BuildDutiesState();
}

class _BuildDutiesState extends State<BuildDuties> {
  static List<String> _duties = [
    'Caring of children',
    'Caring of chronincally ill',
    'Caring if disable',
    'Caring of elderly',
    'Caring of infants',
    'Cleaning',
    'Cooking',
    'Gardering',
    'Laundry/Ironing',
    'Marketing',
    'Other'
  ];
  final _items = _duties.map((duty) => MultiSelectItem(duty, duty)).toList();
  List _selectedDuties = [];
  @override
  Widget build(BuildContext context) {
    final dutiesProvider = Provider.of<EmployerProvider>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: kTextColor,
        ),
      ),
      child: Column(
        children: [
          MultiSelectBottomSheetField(
            title: Text('Select Duties'),
            initialChildSize: 0.5,
            listType: MultiSelectListType.CHIP,
            searchable: false,
            buttonText: Text(
              "Duties Selection",
              style: TextStyle(
                color: Colors.blue[800],
                fontSize: 16,
              ),
            ),
            items: _items,
            onConfirm: (values) {
              dutiesProvider.setDuties(values.cast<String>().toList());
              setState(() {
                _selectedDuties = values;
              });
            },
            chipDisplay: MultiSelectChipDisplay(
              onTap: (value) {
                setState(() {
                  _selectedDuties.remove(value);
                });
              },
            ),
          ),
          _selectedDuties == null || _selectedDuties.isEmpty
              ? Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "None selected ",
                    style: TextStyle(color: Colors.black54),
                  ))
              : Container(),
        ],
      ),
    );
  }
}
