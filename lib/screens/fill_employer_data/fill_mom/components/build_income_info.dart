import 'package:dropdown_search/dropdown_search.dart';
import 'package:eha_app/components/info_title.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';

class BuildInComeInfo extends StatefulWidget {
  @override
  _BuildInComeInfoState createState() => _BuildInComeInfoState();
}

class _BuildInComeInfoState extends State<BuildInComeInfo>
    with AutomaticKeepAliveClientMixin {
  TextEditingController _monthlyIncomeCtl = TextEditingController();
  TextEditingController _spouseIncomeCtl = TextEditingController();
  TextEditingController _incomeProofCtl = TextEditingController();

  List<String> incomeProofList = [
    'Allow MOM to verity income with IRAS',
    'Any Income Statement',
    'Notice of assessment',
  ];
  @override
  void initState() {
    super.initState();
  }

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
                InfoTitle(
                    icon: 'assets/icons/income info.svg',
                    title: 'INCOME SUMARY'),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _monthlyIncomeCtl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Employer monthly income',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenWidth(20),
                      ),
                      TextFormField(
                        controller: _spouseIncomeCtl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Spouse monthly income',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenWidth(20),
                      ),
                      DropdownSearch<String>(
                        mode: Mode.MENU,
                        showSelectedItem: true,
                        items: incomeProofList,
                        label: 'Income Proof',
                        searchBoxController: _incomeProofCtl,
                        //onChanged: (value) => formProvider.setgender(value),
                        dropdownSearchDecoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 45, top: 10, bottom: 10),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _incomeProofCtl.dispose();
    _monthlyIncomeCtl.dispose();
    _spouseIncomeCtl.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
