import 'package:biponi_vendor/app/models/orderDetails_model.dart';
import 'package:biponi_vendor/app/repositories/order_details_repositories.dart';
import 'package:biponi_vendor/common/helper.dart';
import 'package:biponi_vendor/common/ui.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  //TODO: Implement OrderDetailsController

  final orderDetails = OrderDetailsModel().obs;

  final orderDetailsPerStatus = <OrdersDetails>[].obs;
  final orderDetailsLoaded = false.obs;
  final orderID = ''.obs;
  final orderDetailsID = ''.obs;
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

  final selectedStatusForProduct = ''.obs;

  @override
  void onInit() {
    orderID.value = Get.arguments.toString();
    selectedStatusForProduct.value=orderStatus[0]['id']!;

    getOrderDetails();
    super.onInit();
  }

  getOrderDetails() async {
   // orderDetailsLoaded.value = false;
    OrderDetailsRepository().getOrderDetails(orderID.value).then((response) {
      orderDetails.value = response;
      orderDetailsPerStatus.value=orderDetails.value.ordersDetails!.where((element) => element.status==selectedStatusForProduct.value).toList();
      //orderDetailsID.value=orderDetails.value.ordersDetails.
      selectedStatus.value = {
        'status': '${Helper.getStatus(orderDetails.value.orders!.status.toString())}', 'id': '${orderDetails.value.orders!.status}'
        
      };
      orderDetailsLoaded.value = true;
    });
  }

  updateOrder(String orderDetailsId) async {
    Ui.customLoaderAddToCart();
    OrderDetailsRepository().updateOrderStatus(orderDetailsId, selectedStatus['id']).then((resp) {
      if (resp['message'] == 'Order status successfully updated!') {
        Get.back();
        Get.showSnackbar(Ui.SuccessSnackBar(message: 'Order status successfully updated', title: 'Success'));
      }
    });
  }
}
