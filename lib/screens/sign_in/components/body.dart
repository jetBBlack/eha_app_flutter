import 'package:eha_app/components/no_account_text.dart';
import 'package:eha_app/components/social_card.dart';
import 'package:eha_app/providers/social_auth.dart';
import 'package:eha_app/screens/sign_in/components/sign_in_from.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.04,
                ),
                Text(
                  'Welcome to EHA',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(28),
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.07),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.07),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {
                        final provider = Provider.of<SocialAuthProvider>(
                            context,
                            listen: false);

                        provider.loginGoogle();
                      },
                    ),
                    SocialCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {
                        final provider = Provider.of<SocialAuthProvider>(
                            context,
                            listen: false);
                        provider.loginFacebook();
                      },
                    ),
                    SocialCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                    SocialCard(
                      icon: "assets/icons/linkedin.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
