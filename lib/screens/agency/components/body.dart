import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              buildImageCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImageCard() {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Ink.image(
                image: AssetImage('assets/images/agency.jpg'),
                child: InkWell(
                  onTap: () {},
                ),
                height: 240,
                fit: BoxFit.cover,
              ),
              Text(
                'Agency Name',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white70),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text('Singapore'),
          SizedBox(
            height: 8,
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
}
