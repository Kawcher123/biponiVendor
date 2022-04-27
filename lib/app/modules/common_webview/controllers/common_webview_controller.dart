import 'package:get/get.dart';

class CommonWebviewController extends GetxController {
  //TODO: Implement CommonWebviewController

  final webUrl = ''.obs;
  @override
  void onInit() {
    webUrl.value = Get.arguments;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
