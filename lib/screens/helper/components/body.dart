import 'package:eha_app/models/helper.dart';
import 'package:eha_app/screens/helper/components/helper_item.dart';
import 'package:eha_app/screens/helper/helper_search.dart';
import 'package:eha_app/services_api/helper_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  HelperService get _service => GetIt.I<HelperService>();
  var getHelperProvider;
  @override
  void initState() {
    super.initState();
  }

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
                      "Helper",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, HelperSearch.routeName),
                    child: Container(
                      width: getProportionateScreenWidth(60),
                      height: getProportionateScreenHeight(60),
                      padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset('assets/icons/filter.svg'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            FutureBuilder(
                future: _service.getHelperList(1, 10, 'ASC'),
                builder: (BuildContext context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(child: new CircularProgressIndicator());
                    default:
                      if (snapshot.hasError) {
                        return Center(child: new Text('Error retrieving data'));
                      } else {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20),
                          ),
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            children: snapshot.data
                                .map<Widget>((item) => HelperItem(
                                    helper: HelperModel.fromJson(item)))
                                .toList(),
                          ),
                        );
                      }
                  }
                }),
          ],
        ),
      ),
    );
  }
}
