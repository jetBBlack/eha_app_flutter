import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';
import 'category_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: SizeConfig.screenHeight * .45,
          decoration: BoxDecoration(
            color: Color(0xFFF5CEB8),
            image: DecorationImage(
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
                alignment: Alignment.centerLeft),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getProportionateScreenWidth(30),
                ),
                Text(
                  "We provide domestic helper \nservice",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: .85,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: [
                      CategoryCard(
                        title: "Find Helper",
                        svgSrc: "assets/icons/team.svg",
                        press: () {},
                      ),
                      CategoryCard(
                        title: "Find Employer",
                        svgSrc: "assets/icons/employer.svg",
                        press: () {},
                      ),
                      CategoryCard(
                        title: "Find Agency",
                        svgSrc: "assets/icons/agency.svg",
                        press: () {},
                      ),
                      CategoryCard(
                        title: "Service",
                        svgSrc: "assets/icons/service.svg",
                        press: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
