import 'package:eha_app/models/employer.dart';
import 'package:eha_app/screens/employer/components/employer_item.dart';
import 'package:eha_app/services_api/employer_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  EmployerService get _service => GetIt.I<EmployerService>();
  List<Employer> employerList;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    child: Text(
                      "Employer",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                  ),
                  Container(
                    width: getProportionateScreenWidth(60),
                    height: getProportionateScreenHeight(60),
                    padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset('assets/icons/filter.svg'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            FutureBuilder(
              future: _service.getEmployerList(1, 10, 'ASC'),
              builder: (BuildContext context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(child: new CircularProgressIndicator());
                  default:
                    if (snapshot.hasError) {
                      return new Text('Error retrieving data');
                    } else {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20),
                        ),
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          children: snapshot.data
                              .map<Widget>((item) => EmployerItem(
                                  employer: Employer.fromJson(item)))
                              .toList(),
                        ),
                      );
                    }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // Future loadList() {
  //   Future<List<Employer>> futureCases = _service.getEmployerList(1, 10, 'ASC');
  //   futureCases.then((employer) {
  //     setState(() {
  //       this.employerList = employer;
  //       employerList.remove('');
  //     });
  //   });
  //   return futureCases;
  // }
}
