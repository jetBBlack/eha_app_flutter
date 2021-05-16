import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:search_choices/search_choices.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import '../../../../size_config.dart';
import 'package:intl/intl.dart';

class BuildOtherInfo extends StatefulWidget {
  @override
  _BuildOtherInfoState createState() => _BuildOtherInfoState();
}

class _BuildOtherInfoState extends State<BuildOtherInfo>
    with AutomaticKeepAliveClientMixin {
  int _count = 1;
  @override
  @override
  Widget build(BuildContext context) {
    List<Widget> _histories =
        new List.generate(_count, (int i) => new BuildWorkHistory());
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
                  height: getProportionateScreenWidth(20),
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
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final history = _histories[index];
                      return Dismissible(
                        key: UniqueKey(),
                        child: history,
                        background: Container(
                          color: Colors.cyan,
                        ),
                        onDismissed: (DismissDirection direction) {
                          setState(() {
                            _histories.removeAt(index);
                          });
                        },
                      );
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _count = _count + 1;
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

class BuildWorkHistory extends StatefulWidget {
  const BuildWorkHistory({
    Key key,
  }) : super(key: key);
  @override
  _BuildWorkHistoryState createState() => _BuildWorkHistoryState();
}

class _BuildWorkHistoryState extends State<BuildWorkHistory> {
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

  List<int> selectedItemsMultiDialog = [];
  List<DropdownMenuItem> items = [];
  String inputString = "";
  TextFormField input;
  String workList =
      " Caring of childern,Caring of chronically ill,Caring of disable,Caring of elderly,Caring of infants,Cleaning,Cooking,Gardening,Laundry,Ironing,Marketing,Other ";

  @override
  void initState() {
    workList.split(",").forEach((word) {
      items.add(DropdownMenuItem(
        child: Text(word),
        value: word,
      ));
    });
    input = TextFormField(
      validator: (value) {
        return ((value?.length ?? 0) < 6
            ? "must be at least 6 characters long"
            : null);
      },
      initialValue: inputString,
      onChanged: (value) {
        inputString = value;
      },
      autofocus: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF5F6F9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          SearchChoices.multiple(
            items: items,
            selectedItems: selectedItemsMultiDialog,
            hint: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("Select any"),
            ),
            searchHint: "Add Work History",
            onChanged: (value) {
              setState(() {
                selectedItemsMultiDialog = value;
              });
            },
            closeButton: (selectedItems) {
              return (selectedItems.isNotEmpty
                  ? "Save ${selectedItems.length == 1 ? '"' + items[selectedItems.first].value.toString() + '"' : '(' + selectedItems.length.toString() + ')'}"
                  : "Save without selection");
            },
            isExpanded: true,
          ),
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
              Text('-', style: TextStyle(fontSize: 15, color: Colors.black)),
              Text('${DateFormat('MM/dd/yyyy').format(_endDate).toString()}',
                  style: TextStyle(fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}
