import 'package:biponi_vendor/app/commons/colors.dart';
import 'package:flutter/material.dart';

class SubHeadWidget extends StatelessWidget {
  String? title;
  String? subTitle;
  VoidCallback? onTap;
  SubHeadWidget({Key? key, required this.title, this.subTitle, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title??'',
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            subTitle??'',
            style:
            const TextStyle(fontWeight: FontWeight.bold, color: primaryColor, fontSize: 15),
          ),
        ),
      ],
    );
  }
}