import 'package:biponi_vendor/app/commons/colors.dart';
import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:biponi_vendor/app/commons/text_field_widget.dart';
import 'package:biponi_vendor/app/modules/root/controllers/root_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Get.theme.primaryColor),
          onPressed: (){
            Get.back();
          },
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 25,right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reset Password',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'Please enter the account that you want to reset the password.',
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30,),
              TextFieldWidget(
                hintText: "+880xxxxxx",
                keyboardType: TextInputType.number,
                initialValue: '',
                obscureText: false,
                onChanged: (input) {},
                validator: (input) {
                  return input!.length < 11 ? 'The phone cannot be less than 11 characters.' : null;
                },
                suffixIcon: Icon(CupertinoIcons.phone),
              ),
              SizedBox(height: 100,),
              CommonWidgets.customButton(
                  text: "Continue",
                  press: () {
                  },
                  color: secondaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
