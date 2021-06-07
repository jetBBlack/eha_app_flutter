import 'package:dropdown_search/dropdown_search.dart';
import 'package:eha_app/providers/helper_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../../size_config.dart';

class BuildOtherInfo extends StatefulWidget {
  @override
  _BuildOtherInfoState createState() => _BuildOtherInfoState();
}

class _BuildOtherInfoState extends State<BuildOtherInfo>
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
  TextEditingController _noLeaveCtl;
  TextEditingController _salaryCtl;
  TextEditingController _earliestDateCtl;
  TextEditingController _releasePaperClt;
  TextEditingController _selfDesCtl;
  TextEditingController _agencyIdCtl;

  @override
  void initState() {
    final otherInfoProvider =
        Provider.of<HelperProvider>(context, listen: false);
    super.initState();
    _noLeaveCtl =
        TextEditingController(text: otherInfoProvider.noLeavesPerMonth);
    _salaryCtl = TextEditingController(
        text: otherInfoProvider.expectedSalary == null
            ? 0
            : otherInfoProvider.expectedSalary.toString());
    _earliestDateCtl =
        TextEditingController(text: otherInfoProvider.earliestJoiningOn);
    _releasePaperClt =
        TextEditingController(text: otherInfoProvider.hasReleasePaper);
    _selfDesCtl =
        TextEditingController(text: otherInfoProvider.selfDescription);
    _agencyIdCtl = TextEditingController(text: otherInfoProvider.agencyId);
  }

  @override
  void dispose() {
    _noLeaveCtl.dispose();
    _salaryCtl.dispose();
    _earliestDateCtl.dispose();
    _releasePaperClt.dispose();
    _selfDesCtl.dispose();
    _agencyIdCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final otherInfoProvider = Provider.of<HelperProvider>(context);
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _noLeaveCtl,
            onChanged: otherInfoProvider.setnoLeavesPerMonth,
            decoration: InputDecoration(
              labelText: "No Of Leave Per Month",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _salaryCtl,
            onChanged: (value) =>
                otherInfoProvider.setexpectedSalary(int.parse(value)),
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: "Expected Salary",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _earliestDateCtl,
            onChanged: otherInfoProvider.setearliestJoiningOn,
            onTap: () async {
              DateTime date = DateTime(2021);
              FocusScope.of(context).requestFocus(new FocusNode());

              date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              _earliestDateCtl.text = date.toIso8601String();
              otherInfoProvider.setearliestJoiningOn(date.toIso8601String());
            },
            decoration: InputDecoration(
              labelText: "Earliest date to join employer",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DropdownSearch<String>(
            mode: Mode.MENU,
            showSelectedItem: true,
            items: ['Yes', 'No'],
            label: 'Has Release Paper',
            selectedItem: _releasePaperClt.text,
            onChanged: (value) => otherInfoProvider.sethasReleasePaper(value),
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 45, top: 10, bottom: 10),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            maxLines: 3,
            controller: _selfDesCtl,
            onChanged: otherInfoProvider.setselfDescription,
            decoration: InputDecoration(
              labelText: "Self Description",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TextFormField(
            controller: _agencyIdCtl,
            onChanged: otherInfoProvider.setagencyId,
            decoration: InputDecoration(
              labelText: "Agency ID",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
        ],
      ),
    );
  }
}
