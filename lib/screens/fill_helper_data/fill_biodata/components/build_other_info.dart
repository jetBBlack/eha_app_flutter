import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'package:uuid/uuid.dart';
import '../../../../size_config.dart';
import 'package:intl/intl.dart';

class BuildOtherInfo extends StatefulWidget {
  @override
  _BuildOtherInfoState createState() => _BuildOtherInfoState();
}

class _BuildOtherInfoState extends State<BuildOtherInfo>
    with AutomaticKeepAliveClientMixin {
  var uuid = Uuid();
  Map<String, Widget> _widget = {};
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 7));

  Future displayDateRangePicker(BuildContext context) async {
    final List<DateTime> picked = await DateRangePicker.showDatePicker(
        context: context,
        initialFirstDate: _startDate,
        initialLastDate: _endDate,
        firstDate: new DateTime(DateTime.now().year - 30),
        lastDate: new DateTime(DateTime.now().year + 30));
    if (picked != null && picked.length == 2) {
      setState(() {
        _startDate = picked[0];
        _endDate = picked[1];
      });
    }
  }

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
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/question-mark.svg',
                      height: 20,
                      width: 20,
                      color: Colors.cyan,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(
                      "EXPECTATION INFOMATION",
                      style: TextStyle(color: Colors.cyan, fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                BuildExpectInfo(),
                SizedBox(
                  height: getProportionateScreenWidth(30),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/history.svg',
                      height: 20,
                      width: 20,
                      color: Colors.cyan,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(
                      "WORK HISTORY",
                      style: TextStyle(color: Colors.cyan, fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenWidth(10),
                ),
                Container(
                  child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: _widget.entries
                        .map((e) => _buildHistoty(e.key))
                        .toList(),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        var newKey = uuid.v1();
                        _widget[newKey] = _buildHistoty(newKey);
                      });
                    },
                    child: FaIcon(FontAwesomeIcons.plusSquare)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget _buildHistoty(String key) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xFFF5F6F9),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              Positioned(
                top: -2,
                left: 10,
                child: GestureDetector(
                    child: Icon(Icons.close),
                    onTap: () {
                      print(key);
                      setState(() {
                        _widget.remove(key);
                      });
                    }),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 15, 5, 0),
                child: Column(
                  children: [
                    MultiSelectBottomSheetField(
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
                    ElevatedButton(
                        onPressed: () async {
                          await displayDateRangePicker(context);
                        },
                        child: Text('Select Date')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          '${DateFormat('MM/dd/yyyy').format(_startDate).toString()}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text('-',
                            style:
                                TextStyle(fontSize: 15, color: Colors.black)),
                        Text(
                            '${DateFormat('MM/dd/yyyy').format(_endDate).toString()}',
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(5),
                    ),
                    TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                          labelText: 'Leaving Reason',
                          floatingLabelBehavior: FloatingLabelBehavior.auto),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}

class BuildExpectInfo extends StatefulWidget {
  @override
  _BuildExpectInfoState createState() => _BuildExpectInfoState();
}

class _BuildExpectInfoState extends State<BuildExpectInfo> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Self Description",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "No Of Leave Per Month",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Expected Salary",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Earliest date to join employer",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
        ],
      ),
    );
  }
}
