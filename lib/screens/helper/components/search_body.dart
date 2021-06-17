import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({Key key}) : super(key: key);

  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  @override
  Widget build(BuildContext context) {
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
    double _currentSliderValue = 18;
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
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[200],
                    borderRadius: BorderRadius.circular(29.5),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Helper's name",
                      icon: SvgPicture.asset("assets/icons/Search Icon.svg"),
                      border: InputBorder.none,
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
                Slider(
                  value: _currentSliderValue,
                  min: 18,
                  max: 54,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
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
                          if (value) {
                            _filters.add(_nationality[index]);
                          } else {
                            _filters.remove(_nationality[index]);
                          }
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
