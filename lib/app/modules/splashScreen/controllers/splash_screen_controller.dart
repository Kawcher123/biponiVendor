import 'dart:async';
import 'package:biponi_vendor/app/routes/app_pages.dart';
import 'package:biponi_vendor/app/services/auth_service.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController

  final count = 0.obs;

  @override
  void onInit() {
    print('called');
    Timer(Duration(seconds: 3), () {
      if (Get.find<AuthService>().used.value) {
        if (Get.find<AuthService>().isAuth) {
          Get.offAllNamed(Routes.root);
        } else {
          Get.offAllNamed(Routes.login);
        }
      } else {
        Get.offAllNamed(Routes.WELCOME_SCREEN);
      }
    });

    super.onInit();
  }
}
