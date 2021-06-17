import 'package:flutter/material.dart';

import 'components/search_body.dart';

class HelperSearch extends StatelessWidget {
  const HelperSearch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.close),
        ),
        actions: [
          Container(
            decoration:
                BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
            child: Icon(Icons.more_horiz),
          )
        ],
      ),
      body: SearchBody(),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {},
            child: Text('Clear All'),
            style: ButtonStyle(
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
    );
  }
}
