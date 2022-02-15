import 'package:biponi_vendor/app/models/orderDetails_model.dart';
import 'package:biponi_vendor/app/repositories/order_details_repositories.dart';
import 'package:biponi_vendor/common/ui.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  //TODO: Implement OrderDetailsController

  final orderDetails = OrderDetailsModel().obs;
  final orderDetailsLoaded = false.obs;
  final orderID = ''.obs;
  final selectedStatus = {}.obs;

  final orderStatus = [
    {'status': 'Pending', 'id': '1'},
    {'status': 'Processing', 'id': '2'},
    {'status': 'On Hold', 'id': '3'},
    {'status': 'Failed', 'id': '4'},
    {'status': 'Cancelled', 'id': '5'},
    {'status': 'Completed', 'id': '6'},
    {'status': 'Refunded', 'id': '7'},
  ];

  @override
  void onInit() {
    orderID.value = Get.arguments.toString();
    selectedStatus.value = orderStatus[0];
    getOrderDetails();
    super.onInit();
  }

  getOrderDetails() async {
    OrderDetailsRepository().getOrderDetails(orderID.value).then((response) {
      orderDetails.value = response;
      orderDetailsLoaded.value = true;
    });
  }

  updateOrder() async {
    Ui.customLoaderAddToCart();
    OrderDetailsRepository().updateOrderStatus(orderID.value, selectedStatus['id']).then((resp) {
      if (resp['message'] == 'Order status successfully updated!') {
        Get.back();
        Get.showSnackbar(Ui.SuccessSnackBar(message: 'Order status successfully updated', title: 'Success'));
      }
    });
  }
}
