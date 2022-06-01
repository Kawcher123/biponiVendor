import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          //  primary: Get.theme.primaryColor,
          padding: EdgeInsets.all(20),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFF979797)
              .withOpacity(0.1), //Colors.blue.withOpacity(0.15),
        ),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: Get.theme.primaryColor,
              width: 22,
            ),
            SizedBox(width: 20),
            Expanded(
                child: Text(
                  text,
                  style: TextStyle(color: Get.theme.primaryColor),
                )),
            Icon(Icons.arrow_forward_ios, color: Get.theme.hintColor),
          ],
        ),
      ),
    );
  }
}