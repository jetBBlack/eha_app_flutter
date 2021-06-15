import 'package:dropdown_search/dropdown_search.dart';
import 'package:eha_app/components/info_title.dart';
import 'package:eha_app/providers/employer_mom_provider.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildInComeInfo extends StatefulWidget {
  @override
  _BuildInComeInfoState createState() => _BuildInComeInfoState();
}

class _BuildInComeInfoState extends State<BuildInComeInfo>
    with AutomaticKeepAliveClientMixin {
  TextEditingController _monthlyIncomeCtl = TextEditingController();
  TextEditingController _spouseIncomeCtl = TextEditingController();
  TextEditingController _incomeProofCtl = TextEditingController();

  String incomeValidator(String value) {
    if (value.isEmpty || value.length == 0) {
      return "Required field";
    } else {
      return null;
    }
  }

  List<String> incomeProofList = [
    'Allow MOM to verity income with IRAS',
    'Any Income Statement',
    'Notice of assessment',
  ];
  @override
  void initState() {
    final incomeProvider =
        Provider.of<EmployerMomProvider>(context, listen: false);
    super.initState();
    _monthlyIncomeCtl =
        TextEditingController(text: incomeProvider.monthlyIncome);
    _spouseIncomeCtl = TextEditingController(text: incomeProvider.spouseIncome);
    _incomeProofCtl =
        TextEditingController(text: incomeProvider.incomeProofInfo);
  }

  @override
  Widget build(BuildContext context) {
    final incomeProvider = Provider.of<EmployerMomProvider>(context);
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
                  key: incomeProvider.incomeFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _monthlyIncomeCtl,
                        validator: (value) => incomeValidator(value),
                        onChanged: (value) =>
                            incomeProvider.setMonthlyIncome(int.parse(value)),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          suffixText: 'SGD',
                          labelText: 'Employer monthly income',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenWidth(20),
                      ),
                      TextFormField(
                        controller: _spouseIncomeCtl,
                        validator: (value) => incomeValidator(value),
                        onChanged: (value) =>
                            incomeProvider.setSpouseIncome(int.parse(value)),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          suffixText: "SGD",
                          labelText: 'Spouse monthly income',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenWidth(20),
                      ),
                      DropdownSearch<String>(
                        mode: Mode.MENU,
                        validator: (value) => incomeValidator(value),
                        onChanged: (value) =>
                            incomeProvider.setIncomeProofInfo(value),
                        showSelectedItem: true,
                        items: incomeProofList,
                        label: 'Income Proof',
                        selectedItem: _incomeProofCtl.text,
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
