import 'package:biponi_vendor/app/models/orderDetails_model.dart';
import 'package:biponi_vendor/app/providers/api_manager.dart';
import 'package:biponi_vendor/app/providers/api_url.dart';
import 'package:biponi_vendor/app/services/auth_service.dart';
import 'package:get/get.dart';

class OrderDetailsRepository {
  Future<OrderDetailsModel> getOrderDetails(String orderId) async {
    String token = Get.find<AuthService>().user.value.token!;

    var headers = {'Authorization': 'Bearer $token'};

    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(ApiClient.orderDetails + orderId, headers);

    print('order details: ${response}');

    return OrderDetailsModel.fromJson(response);
  }

  Future updateOrderStatus(String orderId, String status) async {
    String token = Get.find<AuthService>().user.value.token!;
    print(token);

    var headers = {'Authorization': 'Bearer $token'};
    Map orderData = {'id': orderId, 'status': status};
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(ApiClient.updateorderStatus, orderData, headers);

    print('order response: ${response}');

    return response;
  }
}
