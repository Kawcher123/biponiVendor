import 'package:biponi_vendor/app/models/orderDetails_model.dart';
import 'package:biponi_vendor/app/repositories/orderDetails_repositories.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  //TODO: Implement OrderDetailsController

  final orderDetails=OrderDetailsModel().obs;
  final orderDetailsLoaded=false.obs;
  final orderID=''.obs;

  @override
  void onInit() {
    orderID.value=Get.arguments.toString();
getOrderDetails();
    super.onInit();
  }

  getOrderDetails() async
  {
    OrderDetailsRepository().getOrderDetails(orderID.value).then((response)
        {
          orderDetails.value=response;
          orderDetailsLoaded.value=true;
        }
    );

  }
}
