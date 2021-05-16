import 'package:eha_app/constant.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
      ),
      body: Favorite(),
    );
  }
}

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return favoriteUser();
        },
      ),
    );
  }

  Widget favoriteUser() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/images/Profile Image.png"),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sample Helper',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kTextColor),
              ),
              Text(
                'Helper',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(
            width: getProportionateScreenWidth(35),
          ),
          Icon(Icons.more_vert),
        ],
      ),
    );
  }
}
