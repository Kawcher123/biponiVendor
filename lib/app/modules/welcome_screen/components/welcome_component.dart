import 'package:flutter/material.dart';
import 'package:get/get.dart';
class WelcomeComponent extends StatelessWidget {
  WelcomeComponent({Key? key,this.text, this.image,}) : super(key: key);
  final String? text, image;

  final Size _size = Get.size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "Logo",
          style: TextStyle(
            fontSize: 36,
            color: Get.theme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          text!.tr,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 50,
        ),
        Image.asset(
          image!,
          height: _size.width * .8,
          width: _size.width,
        ),
      ],
    );
  }
}
