import 'package:biponi_vendor/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(
      () => RootController(),
    );

    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
  }
}
