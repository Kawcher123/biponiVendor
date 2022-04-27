import 'package:get/get.dart';

import '../controllers/common_webview_controller.dart';

class CommonWebviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommonWebviewController>(
      () => CommonWebviewController(),
    );
  }
}
