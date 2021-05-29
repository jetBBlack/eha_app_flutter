import 'package:dropdown_search/dropdown_search.dart';
import 'package:eha_app/components/info_title.dart';
import 'package:eha_app/constant.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'package:multi_select_flutter/util/multi_select_item.dart';

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
  TextEditingController dateCtl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
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
            mode: Mode.BOTTOM_SHEET,
            items: [
              'Can cook Basic food',
              'Can cook India food',
              'Can cook Western food'
            ],
            label: '1st Priority',
            showClearButton: true,
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
            showSearchBox: true,
            searchBoxDecoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 8),
              labelText: "Search",
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.DIALOG,
            items: [
              'Can cook Basic food',
              'Can cook India food',
              'Can cook Malay food',
              'Can cook Western food'
            ],
            label: '2st Priority',
            showClearButton: true,
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
            showSearchBox: true,
            searchBoxDecoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 8),
              labelText: "Search",
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.BOTTOM_SHEET,
            items: [
              'Can cook Basic food',
              'Can cook India food',
              'Can cook Western food'
            ],
            label: '3st Priority',
            showClearButton: true,
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
            showSearchBox: true,
            searchBoxDecoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 8),
              labelText: "Search",
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: dateCtl,
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
              labelText: "I expect to get domestic helper on",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "My expectation for domestic helper",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
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
