import 'package:biponi_vendor/app/models/orderlist_model.dart';
import 'package:biponi_vendor/app/modules/notification/controllers/notification_controller.dart';
import 'package:biponi_vendor/app/repositories/dashboard_repository.dart';
import 'package:biponi_vendor/app/repositories/order_repositories.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  final orderlist = OrderListModel().obs;
  final orderListLoaded = false.obs;

  final totalOrders = ''.obs;
  final totalRevenue = ''.obs;
  final totalProducts = ''.obs;
  final totalCustomers = ''.obs;

  @override
  void onInit() {
    getDashboardData();
    getOrderList();
    Get.put(NotificationController()).getNotifications();
    super.onInit();
  }

  refreshOrder()async
  {
    getOrderList();
  }

  getOrderList() async {
    OrderRepository().getOrderList().then((resp) {
      orderlist.value = resp;
      orderListLoaded.value = true;
    });
  }

  getDashboardData() async {
    DashBoardRepository().getDashboardData().then((resp) {
      totalOrders.value = resp['order'].toString();
      totalCustomers.value = resp['users'].toString();
      totalProducts.value = resp['product'].toString();
      totalRevenue.value = resp['revenue'].toString();
    });
  }
}
