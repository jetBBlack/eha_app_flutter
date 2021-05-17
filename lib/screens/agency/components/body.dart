import 'package:eha_app/models/agency.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constant.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Agency> agencies = getAgencies();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: buildAgencies(),
          ),
        ),
      ),
    );
  }

  List<Widget> buildAgencies() {
    List<Widget> list = [];
    for (var i = 0; i < agencies.length; i++) {
      list.add(buildImageCard(agencies[i]));
    }
    return list;
  }

  Widget buildImageCard(Agency agency) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Ink.image(
                image: AssetImage('assets/images/Agency.jpg'),
                child: InkWell(
                  onTap: () {},
                ),
                height: 240,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: Text(
                  'Agency Name',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 200, left: 10),
            child: Container(
                // decoration: BoxDecoration(
                //     border: Border.all(color: Colors.grey),
                //     borderRadius: BorderRadius.circular(12)),
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  'assets/icons/flag_svg/singapore.svg',
                  height: 22,
                  width: 22,
                ),
                Text(
                  'Singapore',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            )),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.topLeft,
              child: ourServices(agency.services),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              TextButton(onPressed: () {}, child: Text('CONTACT')),
              TextButton(onPressed: () {}, child: Text('MORE DETAILS')),
            ],
          )
        ],
      ),
    );
  }

  Widget ourServices(List<String> services) {
    List<Widget> serviceList = [];
    for (var i = 0; i < services.length; i++) {
      serviceList.add(
        Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            services[i],
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      );
    }
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      direction: Axis.horizontal,
      children: serviceList,
    );
  }
}
