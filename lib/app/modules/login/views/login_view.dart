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
                  labelText: "Email",
                  hintText: "example@gmail.com",
                  onSaved: (input) {},
                  validator: (input) {},
                  suffixIcon: Icon(CupertinoIcons.phone),
                ),
                SizedBox(height: 15),
                TextFieldWidget(
                  labelText: "Password",
                  hintText: "Enter your password",
                  onSaved: (input) {},
                  validator: (input) {},
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
                        "Forgot Password",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 40),
                CommonWidgets.customButton(
                    text: "Login",
                    press: () {
                      Get.offNamed(Routes.root);
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
                        style: TextStyle(
                            fontSize: 16, color: Get.theme.primaryColor),
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
