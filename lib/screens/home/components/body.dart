import 'package:eha_app/screens/agency/agency_screen.dart';
import 'package:eha_app/screens/chat/chat_page.dart';
import 'package:eha_app/screens/employer/employer_screen.dart';
import 'package:eha_app/screens/fill_employer_data/fill_info/fill_info_screen.dart';
import 'package:eha_app/screens/fill_employer_data/fill_mom/fill_employer_mom.dart';
import 'package:eha_app/screens/helper/helper_screen.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/menu.svg"),
                    ),
                  ),
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
                    childAspectRatio: 1.08,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: <Widget>[
                      CategoryCard(
                        title: "Find Helper",
                        svgSrc: "assets/icons/maid-icon.svg",
                        press: () {
                          Navigator.pushNamed(context, HelperScreen.routeName);
                        },
                      ),
                      CategoryCard(
                        title: "Find Employer",
                        svgSrc: "assets/icons/employer.svg",
                        press: () {
                          Navigator.pushNamed(
                              context, EmployerScreen.routeName);
                        },
                      ),
                      CategoryCard(
                        title: "Find Agency",
                        svgSrc: "assets/icons/agency.svg",
                        press: () {
                          Navigator.pushNamed(context, AgencyScreen.routeName);
                        },
                      ),
                      CategoryCard(
                        title: "Fill Up BioData",
                        svgSrc: "assets/icons/tax.svg",
                        press: () {
                          // Navigator.pushNamed(
                          //     context, FillBioDataScreen.routeName);
                          Navigator.pushNamed(
                              context, FillEmployerInfoScreen.routeName);
                        },
                      ),
                      CategoryCard(
                        title: "M.O.M",
                        svgSrc: "assets/icons/mom.svg",
                        press: () {
                          Navigator.pushNamed(
                              context, FillEmployerMomScreen.routeName);
                        },
                      ),
                      CategoryCard(
                        title: "Message",
                        svgSrc: "assets/icons/message.svg",
                        press: () {
                          Navigator.pushNamed(context, ChatPage.routeName);
                        },
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
