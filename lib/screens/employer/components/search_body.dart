import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({Key key}) : super(key: key);

  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  List<String> _statusList = [
    "Divorced",
    "Married",
    "Separated",
    "Single",
    "Widowed"
  ];
  List<String> _filtersStatus = [];
  List<String> _religionList = [
    "Buddhist",
    "Christian",
    "Free Thinker",
    "Hindu",
    "Mulism",
    "Sikh",
    "Other"
  ];
  List<String> _filtersReligion = [];
  var salaryRange = RangeValues(400, 800);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(29.5),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: " Name",
                        suffixIcon: Icon(
                          Icons.search_rounded,
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Filters',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                Text(
                  'MARITAL STATUS',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Wrap(
                  spacing: 10,
                  children: List<Widget>.generate(_statusList.length, (index) {
                    final name = _statusList[index];
                    final isSelected =
                        _filtersStatus.contains(_statusList[index]);
                    return FilterChip(
                        label: Text(name),
                        labelStyle: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : Theme.of(context).textTheme.bodyText1.color,
                          fontWeight: FontWeight.bold,
                        ),
                        selected: isSelected,
                        selectedColor: Colors.cyan,
                        checkmarkColor: Colors.white,
                        onSelected: (bool value) {
                          setState(() {
                            if (value) {
                              _filtersStatus.add(_statusList[index]);
                            } else {
                              _filtersStatus.remove(_statusList[index]);
                            }
                          });
                        });
                  }),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                Text(
                  'RELIGION',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Wrap(
                  spacing: 10,
                  children:
                      List<Widget>.generate(_religionList.length, (index) {
                    final name = _religionList[index];
                    final isSelected =
                        _filtersReligion.contains(_religionList[index]);
                    return FilterChip(
                        label: Text(name),
                        labelStyle: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : Theme.of(context).textTheme.bodyText1.color,
                          fontWeight: FontWeight.bold,
                        ),
                        selected: isSelected,
                        selectedColor: Colors.cyan,
                        checkmarkColor: Colors.white,
                        onSelected: (bool value) {
                          setState(() {
                            if (value) {
                              _filtersReligion.add(_religionList[index]);
                            } else {
                              _filtersReligion.remove(_religionList[index]);
                            }
                          });
                        });
                  }),
                ),
                Row(
                  children: [
                    Text(
                      'RELIGION',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '400  1500' + r"$",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                RangeSlider(
                    values: salaryRange,
                    min: 400,
                    max: 1500,
                    divisions: 11,
                    labels: RangeLabels(
                        "${salaryRange.start}", "${salaryRange.end}"),
                    onChanged: (RangeValues value) {
                      setState(() {
                        salaryRange = value;
                      });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
