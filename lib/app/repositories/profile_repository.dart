
import 'package:biponi_vendor/app/models/seller_model.dart';
import 'package:biponi_vendor/app/models/user_model.dart';
import 'package:biponi_vendor/app/providers/api_manager.dart';
import 'package:biponi_vendor/app/providers/api_url.dart';
import 'package:biponi_vendor/app/services/auth_service.dart';
import 'package:get/get.dart';

class ProfileRepository {

  ///Seller Profile
  Future<SellerModel> getSellerInfo()async{
    String token=Get.find<AuthService>().user.value.token!;

    var headers = {
      'Authorization': 'Bearer $token'
    };

    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(ApiClient.sellerInfo, headers);

    print('user login: ${response}');


    return SellerModel.fromJson(response);

  }

  ///Update Password
  Future updatePassword(String previousPass, String newPass) async {
    String apiToken = Get.find<AuthService>().user.value.token!;

    print('token:$apiToken');

    Map user = {'previous_password': previousPass, 'new_password': newPass};

    Map<String, String> headers = {'Authorization': 'Bearer $apiToken'};

    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(ApiClient.updatePassword, user, headers);

    return response;
  }

  ///update user data
  Future<bool> updateUserData(String name, String email, String phone, String shopName) async {
    String apiToken = Get.find<AuthService>().user.value.token!;

    print('token:$apiToken');

    Map user = {'name': name, 'email': email, 'phone': phone, 'shop_name': shopName};

    Map<String, String> headers = {'Authorization': 'Bearer $apiToken'};

    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(ApiClient.updateSeller, user, headers);

    bool updated = false;

    if (response != "User not found.") {
      UserModel user = Get.find<AuthService>().user.value;

      user.vendor = Vendor.fromJson(response['user']);

      Get.find<AuthService>().setUser(user);
      updated = true;
    }

    return updated;
  }

}