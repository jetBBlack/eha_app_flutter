import 'package:eha_app/screens/helper/components/search_body.dart';
import 'package:eha_app/size_config.dart';
import 'package:flutter/material.dart';

class EmployerSearch extends StatelessWidget {
  static String routeName = "/employer-search";
  const EmployerSearch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.close),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: EdgeInsets.all(8.0),
            width: 50,
            height: 50,
            decoration:
                BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
            child: Icon(Icons.more_horiz),
          )
        ],
      ),
      body: SearchBody(),
      bottomSheet: Padding(
        padding: EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Clear All'),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(
                    Size(SizeConfig.screenWidth / 2 - 12, 55)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blueGrey[300]),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide.none,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Apply Filters'),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(
                    Size(SizeConfig.screenWidth / 2 - 12, 55)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.yellow[700]),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
