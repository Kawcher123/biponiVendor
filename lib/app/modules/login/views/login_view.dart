import 'package:biponi_vendor/app/commons/colors.dart';
import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:biponi_vendor/app/commons/text_field_widget.dart';
import 'package:biponi_vendor/app/modules/root/controllers/root_controller.dart';
import 'package:biponi_vendor/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Sign In'.tr,
          style: TextStyle(color: Get.theme.textTheme.bodyText1!.color),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Get.theme.primaryColor),
          onPressed: () => {Get.find<RootController>().changePage(0)},
        ),
      ),
      body: Form(
        key: controller.loginFormKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 80),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in with your email and password  \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 60),
                TextFieldWidget(
                  labelText: "Phone",
                  hintText: "+880xxxxxx",
                  keyboardType: TextInputType.number,
                  onChanged: (input) {
                    controller.vendorData.value.phone = input;
                  },
                  validator: (input) {
                    return input!.length < 11 ? 'The phone cannot be less than 11 characters.' : null;
                  },
                  suffixIcon: Icon(CupertinoIcons.phone),
                ),
                SizedBox(height: 15),
                TextFieldWidget(
                  labelText: "Password",
                  hintText: "Enter your password",
                  onChanged: (input) {
                    controller.vendorData.value.password = input;
                  },
                  validator: (input) => input!.length < 6 ? "Should be more than 6 characters".tr : null,
                  obscureText: true,
                  iconData: Icons.lock_outline,
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    color: Get.theme.focusColor,
                    icon: Icon(Icons.visibility_outlined),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      activeColor: Get.theme.primaryColor,
                      onChanged: (value) {},
                    ),
                    Text("Remember me"),
                    Spacer(),
                    GestureDetector(
                      child: Text(
                        "Forgot Password?",
                      ),
                    )
                  ],
                ),
                SizedBox(height: 40),
                CommonWidgets.customButton(
                    text: "Login",
                    press: () {
                      controller.login();
                    },
                    color: secondaryColor),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account? ",
                      style: TextStyle(fontSize: 16),
                    ),
                    InkWell(
                      onTap: () => Get.toNamed(Routes.register),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 16, color: Get.theme.primaryColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
