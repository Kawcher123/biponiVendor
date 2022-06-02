import 'package:biponi_vendor/app/commons/colors.dart';
import 'package:biponi_vendor/app/commons/text_field_widget.dart';
import 'package:biponi_vendor/app/modules/profile/controllers/profile_controller.dart';
import 'package:biponi_vendor/app/services/auth_service.dart';
import 'package:biponi_vendor/common/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEdit extends GetView<ProfileController> {
  final Size _size = Get.size;
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          'Profile',
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
          key: controller.updateFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //ProfilePic(),
              // SizedBox(height: 30),
              TextFieldWidget(
                labelText: "Name",
                hintText: "Enter your name",
                initialValue: controller.userData.value.user?.name,
                onSaved: (input) {
                  controller.userData.value.user?.name = input;
                },
                onChanged: (input) {
                  controller.userData.value.user?.name = input;
                },
                validator: (input) {},
                iconData: CupertinoIcons.person_alt,
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                labelText: "Email",
                hintText: "example@gmail.com",
                initialValue: controller.userData.value.user?.email,
                onSaved: (input) {
                  controller.userData.value.user?.email = input;
                },
                onChanged: (input) {
                  controller.userData.value.user?.email = input;
                },
                validator: (input) {},
                iconData: Icons.alternate_email,
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                labelText: "Phone",
                hintText: "01xxxxxxxxx",
                initialValue: controller.userData.value.user?.phone,
                onSaved: (input) {
                  controller.userData.value.user?.phone = input;
                },
                onChanged: (input) {
                  controller.userData.value.user?.phone = input;
                },
                validator: (input) {},
                iconData: Icons.alternate_email,
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                labelText: "Shop Name",
                hintText: "example@gmail.com",
                initialValue: controller.userData.value.shopInfo?.name,
                onSaved: (input) {
                  controller.userData.value.shopInfo?.name = input;
                },
                onChanged: (input) {
                  controller.userData.value.shopInfo?.name = input;
                },
                validator: (input) {},
                iconData: Icons.alternate_email,
              ),
              SizedBox(height: 20),
              // TextFieldWidget(
              //   labelText: "Shop Phone",
              //   hintText: "example@gmail.com",
              //   initialValue: controller.userData.value.shopInfo?.name,
              //   onSaved: (input) {
              //     controller.userData.value.user?.email = input;
              //   },
              //   onChanged: (input) {
              //     controller.userData.value.user?.email = input;
              //   },
              //   validator: (input) {},
              //   iconData: Icons.alternate_email,
              // ),

              SizedBox(height: 40),
              Ui.customButton(
                  text: "Save Changes".tr,
                  press: () {
                    controller.updateData();
                  },
                  color: Get.theme.primaryColor),
            ],
          ),
        ),
      ),
    );
  }
}