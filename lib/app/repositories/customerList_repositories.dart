import 'package:biponi_vendor/app/models/customerList_model.dart';
import 'package:biponi_vendor/app/providers/api_manager.dart';
import 'package:biponi_vendor/app/providers/api_url.dart';
import 'package:biponi_vendor/app/services/auth_service.dart';
import 'package:get/get.dart';

class CustomerListRepository{
  Future<CustomerListModel> getCustomerList() async{
    String token=Get.find<AuthService>().user.value.token!;

    var headers = {
      'Authorization': 'Bearer $token'
    };

    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(ApiClient.customerList, headers);

    print('customer list: ${response}');


    return CustomerListModel.fromJson(response);

  }
}