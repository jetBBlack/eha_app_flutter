import 'package:eha_app/components/default_button.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';

class SubscriptionScreen extends StatelessWidget {
  static String routeName = "/subscription";
  const SubscriptionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Subscription'),
          bottom: TabBar(
            indicatorColor: Colors.cyan[600],
            labelColor: Colors.cyan[600],
            isScrollable: true,
            tabs: [
              Tab(
                text: "INFO",
              ),
              Tab(
                text: 'SUBSCRIPTION TYPE',
              ),
              Tab(
                text: "HOW TO SUBSCRIBE",
              )
            ],
          ),
        ),
        body: TabBarView(children: [
          BuildInfo(),
          BuildSubType(),
          BuildHowToSub(),
        ]),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(13),
          child: DefaultButton(
            text: 'Close',
            press: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }
}

class BuildHowToSub extends StatelessWidget {
  const BuildHowToSub({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              Text(
                'You can make payment to one of the following',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              Text(
                '(1) Paynow to +65-9222-9979',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              SizedBox(
                height: getProportionateScreenWidth(5),
              ),
              Text(
                '(2) Paylah to +65-9222-9979',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              SizedBox(
                height: getProportionateScreenWidth(5),
              ),
              Text(
                '(3) UOB Bank Account 373-304-327-8',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              SizedBox(
                height: getProportionateScreenWidth(5),
              ),
              Text(
                '(4) Cash payment',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              Text(
                'Please screenshot your payment and provide your (1) Phone number or (2) Email address to the following',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              SizedBox(
                height: getProportionateScreenWidth(15),
              ),
              Text(
                '(1) Whatsapp to +65-9222-9979',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              SizedBox(
                height: getProportionateScreenWidth(5),
              ),
              Text(
                '(2) Email to cheebang@gmail.com',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildInfo extends StatelessWidget {
  const BuildInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              Text(
                'You will need to have subscription in order to send private messages to recipients',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              SizedBox(
                height: getProportionateScreenWidth(15),
              ),
              Text(
                'Helper cannot send private message to helpers',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              SizedBox(
                height: getProportionateScreenWidth(15),
              ),
              Text(
                'Employer cannot send private message to employers',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              SizedBox(
                height: getProportionateScreenWidth(15),
              ),
              Text(
                'Please look at the subscription tab for subscription types',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildSubType extends StatelessWidget {
  const BuildSubType({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Subscription Type",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: getProportionateScreenWidth(25),
              ),
              buildType("(A) Basic Subscription", "", "1", "1", "30"),
              SizedBox(
                height: 10,
              ),
              buildType(
                  "(B) Gold Subscription ", "(Most Popular)", "1", "5", "100"),
              SizedBox(
                height: 10,
              ),
              buildType("(C) Platinum Subscription ", "(Value for money)", "2",
                  "20", "200"),
            ],
          ),
        ),
      ),
    );
  }

  Container buildType(String type, String subType, String month,
      String noMessage, String cost) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
                text: type,
                style: TextStyle(fontSize: 15),
                children: <TextSpan>[
                  TextSpan(
                      text: subType,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      )),
                ]),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(
                "Number of recipients you can send private message to: $noMessage \nValidity: $month month \nCost: " +
                    r"$" +
                    "$cost"),
          ),
        ],
      ),
    );
  }
}
