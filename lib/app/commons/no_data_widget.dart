import 'package:flutter/material.dart';

class NoDataFound extends StatelessWidget {

  final text;

  NoDataFound({this.text = 'No data found.'});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Image(
              height: 300,
              width: 300,
              image: AssetImage('assets/images/nodata.gif'),
            ),
            Text(text)
          ],
        ));
  }
}
