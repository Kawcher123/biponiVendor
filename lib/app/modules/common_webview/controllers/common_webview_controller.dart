import 'package:get/get.dart';

class CommonWebviewController extends GetxController {
  //TODO: Implement CommonWebviewController

  final webUrl = ''.obs;
  final title = ''.obs;
  @override
  void onInit() {
    webUrl.value = Get.arguments['url'];
    title.value = Get.arguments['title'];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
