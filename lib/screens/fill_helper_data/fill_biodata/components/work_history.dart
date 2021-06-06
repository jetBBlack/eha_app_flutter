import 'package:eha_app/constant.dart';
import 'package:eha_app/models/helper.dart';
import 'package:eha_app/providers/helper_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../size_config.dart';

class BuildEmploymentHistory extends StatefulWidget {
  const BuildEmploymentHistory({Key key}) : super(key: key);

  @override
  _BuildEmploymentHistoryState createState() => _BuildEmploymentHistoryState();
}

class _BuildEmploymentHistoryState extends State<BuildEmploymentHistory> {
  GlobalKey<FormState> _formKey;
  TextEditingController _reasonCtl;
  TextEditingController _startDateCtl;
  TextEditingController _endDateCtl;
  EmploymentHistories employmentHistory;
  int counter = 0;

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
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKey = GlobalKey();
    _reasonCtl = TextEditingController();
    _startDateCtl = TextEditingController();
    _endDateCtl = TextEditingController();
    employmentHistory = new EmploymentHistories();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _reasonCtl.dispose();
    _startDateCtl.dispose();
    _endDateCtl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HelperProvider workHistoryProvider =
        Provider.of<HelperProvider>(context, listen: false);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                child: Column(
                  children: [
                    AppBar(
                      backgroundColor: kPrimaryColor,
                      title: Text(
                        'Work histoty',
                        style: TextStyle(color: Colors.black),
                      ),
                      centerTitle: true,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 15, 5, 10),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            buildMultiSelectBottomSheetField(),
                            _selectedDuties == null || _selectedDuties.isEmpty
                                ? Container(
                                    padding: EdgeInsets.all(10),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "None selected ",
                                      style: TextStyle(color: Colors.black54),
                                    ))
                                : Container(),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 5,
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 13),
                                    controller: _startDateCtl,
                                    onSaved: (value) =>
                                        employmentHistory.startOn = value,
                                    validator: (value) {
                                      if (value.isEmpty || value.length == 0) {
                                        return "Select start date";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onTap: () async {
                                      DateTime date = DateTime(1900);
                                      FocusScope.of(context)
                                          .requestFocus(new FocusNode());

                                      date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2050),
                                      );
                                      var dateparse = DateTime.parse(
                                          date.toIso8601String());

                                      _startDateCtl.text =
                                          "${dateparse.year}-${dateparse.month}-${dateparse.day}";
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Start",
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.auto,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text('-',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black)),
                                ),
                                Flexible(
                                  flex: 5,
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 13),
                                    controller: _endDateCtl,
                                    onSaved: (value) =>
                                        employmentHistory.endOn = value,
                                    validator: (value) {
                                      if (value.isEmpty || value.length == 0) {
                                        return "Select end date";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onTap: () async {
                                      DateTime date = DateTime(1900);
                                      FocusScope.of(context)
                                          .requestFocus(new FocusNode());

                                      date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2050),
                                      );
                                      var dateparse = DateTime.parse(
                                          date.toIso8601String());
                                      _endDateCtl.text =
                                          "${dateparse.year}-${dateparse.month}-${dateparse.day}";
                                    },
                                    decoration: InputDecoration(
                                      labelText: "End",
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.auto,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                            TextFormField(
                              controller: _reasonCtl,
                              validator: (value) {
                                if (value.length == 0 || value.isEmpty) {
                                  return "Add a reason";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) =>
                                  employmentHistory.leavingReason = value,
                              autofocus: false,
                              decoration: InputDecoration(
                                  labelText: 'Leaving Reason',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    workHistoryProvider.setEmploymentHistory(employmentHistory);
                  }
                },
                child: Text('Add'),
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/history.svg',
                    width: 22,
                    height: 22,
                    color: Colors.cyan,
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  Text(
                    'WORK HISTORY',
                    style: TextStyle(color: Colors.cyan, fontSize: 18),
                  ),
                ],
              ),
              Consumer<HelperProvider>(
                builder: (context, provider, child) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: workHistoryProvider.employmentHistories.length,
                      itemBuilder: buildList,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  MultiSelectBottomSheetField buildMultiSelectBottomSheetField() {
    return MultiSelectBottomSheetField(
      onSaved: (value) => employmentHistory.duties = value.cast<String>(),
      title: Text('Employment History'),
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
    );
  }

  Widget buildList(BuildContext context, int index) {
    final List<EmploymentHistories> listHistory =
        Provider.of<HelperProvider>(context, listen: false).employmentHistories;
    List<Widget> duties = List.generate(
      listHistory[index].duties.length,
      (ind) => Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          listHistory[index].duties[ind],
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
    counter++;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: EdgeInsets.only(left: 14),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey[400]),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        listHistory[index].startOn,
                        //'${DateFormat('MM/dd/yyyy').format(_startDate).toString()}',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Text('-',
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                      Text(listHistory[index].endOn,
                          //'${DateFormat('MM/dd/yyyy').format(_endDate).toString()}',
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: kTextColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Wrap(
                        runSpacing: 10,
                        spacing: 10,
                        direction: Axis.horizontal,
                        children: duties,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(listHistory[index].leavingReason),
        ],
      ),
    );
  }
}
