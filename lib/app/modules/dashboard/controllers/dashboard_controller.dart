import 'package:biponi_vendor/app/models/orderlist_model.dart';
import 'package:biponi_vendor/app/repositories/order_repositories.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  final orderlist=OrderListModel().obs;
  final orderListLoaded=false.obs;
  @override
  void onInit() {
    getOrderList();
    super.onInit();
  }

  getOrderList()async
  {
    OrderRepository().getOrderList().then((resp)
    {
      orderlist.value=resp;
      orderListLoaded.value=true;
    });
  }
}
