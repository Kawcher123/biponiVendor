import 'package:get/get.dart';

class WelcomeScreenController extends GetxController {
  //TODO: Implement WelcomeScreenController

  final count = 0.obs;
  RxInt currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
