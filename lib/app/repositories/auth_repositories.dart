import 'package:biponi_vendor/app/models/user_model.dart';
import 'package:biponi_vendor/app/providers/api_manager.dart';
import 'package:biponi_vendor/app/providers/api_url.dart';
import 'package:biponi_vendor/app/services/auth_service.dart';
import 'package:get/get.dart';

class AuthRepository {
  ///User Login api call
  Future<UserModel> userLogin(Vendor vendor) async {
    print('device token: ${vendor.deviceToken}');
    Map user = {'phone': vendor.phone, 'password': vendor.password, 'device_token': vendor.deviceToken};
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(ApiClient.login, user);

    print('user login: ${response}');
    UserModel userData = UserModel.fromJson(response);
    if (userData.status == 1) {
      Get.find<AuthService>().setUser(UserModel.fromJson(response));
    }

    return UserModel.fromJson(response);
  }
}
