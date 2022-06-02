import 'package:biponi_vendor/app/commons/colors.dart';
import 'package:biponi_vendor/app/commons/text_field_widget.dart';
import 'package:biponi_vendor/app/modules/profile/controllers/profile_controller.dart';
import 'package:biponi_vendor/common/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends GetView<ProfileController> {
  final Size _size = Get.size;
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          'Change Password',
          style: TextStyle(color: Get.theme.textTheme.bodyText1!.color),
        ),
        centerTitle: true,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 5, bottom: 5),
          child: Ui.getIconButton(
              svgSrc: 'assets/icons/arrow_back.svg',
              height: _size.width * .13,
              width: _size.width * .13,
              color: Colors.blue.withOpacity(0.15),
              svgColor: Get.theme.textTheme.bodyText1!.color,
              radius: 30,
              press: () {
                Get.back();
              }),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Form(
          key: controller.updatePassKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              TextFieldWidget(
                labelText: "Old Password".tr,
                hintText: "Enter Old password".tr,
                onSaved: (input) {
                  controller.oldPassword.value = input!;
                },
                onChanged: (input) {
                  controller.oldPassword.value = input;
                },
                validator: (input) {},
                initialValue: controller.oldPassword.value,
                iconData: CupertinoIcons.person_alt,
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                labelText: "New Password".tr,
                hintText: "Enter new password".tr,
                onSaved: (input) {
                  controller.newPassword.value = input!;
                },
                onChanged: (input) {
                  controller.newPassword.value = input;
                },
                validator: (input) {},
                initialValue: controller.newPassword.value,
                iconData: CupertinoIcons.person_alt,
              ),
              SizedBox(height: 40),
              Ui.customButton(
                  text: "Save Changes".tr,
                  press: () {
                    controller.updatePass();
                  },
                  color: Get.theme.primaryColor),
            ],
          ),
        ),
      ),
    );
  }
}