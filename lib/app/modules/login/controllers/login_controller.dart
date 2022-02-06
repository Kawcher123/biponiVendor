import 'package:biponi_vendor/app/models/user_model.dart';
import 'package:biponi_vendor/app/repositories/auth_repositories.dart';
import 'package:biponi_vendor/app/routes/app_pages.dart';
import 'package:biponi_vendor/common/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final userData = UserModel().obs;

  final vendorData = Vendor().obs;

  late GlobalKey<FormState> loginFormKey;
  @override
  void onInit() {
    loginFormKey = GlobalKey<FormState>();
    super.onInit();
  }

  void login() async {
    Get.focusScope!.unfocus();
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();

      print(vendorData.value.password);

      Ui.customLoader();
      AuthRepository().userLogin(vendorData.value).then((response) {
        print(response.status);
        if (response.status == 0) {
          Get.back();
          Get.showSnackbar(Ui.ErrorSnackBar(message: 'Credentials not found!', title: 'Login Failed'));
        } else {
          Get.offAllNamed(Routes.root);
          // Get.find<RootController>().changePageOutRoot(0);
          Get.showSnackbar(Ui.SuccessSnackBar(message: 'Login Successful', title: 'Success'));
        }
      });
    }
  }
}
