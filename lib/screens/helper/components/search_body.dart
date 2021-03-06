import 'package:eha_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({Key key}) : super(key: key);

  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  final List<String> _nationality = [
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

  final List<String> _filters = <String>[];
  var _ageRange = RangeValues(24, 40);
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
                  'AGE',
                  style: TextStyle(fontSize: 16),
                ),
                RangeSlider(
                  values: _ageRange,
                  min: 18,
                  max: 54,
                  divisions: 18,
                  labels: RangeLabels('${_ageRange.start}', '${_ageRange.end}'),
                  onChanged: (RangeValues value) {
                    setState(() {
                      _ageRange = value;
                    });
                  },
                ),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                Text(
                  'NATIONALITY',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Wrap(
                  spacing: 10,
                  children: List<Widget>.generate(_nationality.length, (index) {
                    final name = _nationality[index];
                    final isSelected = _filters.contains(_nationality[index]);
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
                              _filters.add(_nationality[index]);
                            } else {
                              _filters.remove(_nationality[index]);
                            }
                          });
                        });
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
