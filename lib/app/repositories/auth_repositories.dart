import 'package:biponi_vendor/app/models/place_model.dart';
import 'package:biponi_vendor/app/models/user_model.dart';
import 'package:biponi_vendor/app/providers/api_manager.dart';
import 'package:biponi_vendor/app/providers/api_url.dart';
import 'package:biponi_vendor/app/services/auth_service.dart';
import 'package:get/get.dart';

class AuthRepository {
  ///User Registration api call
  Future userRegistration(
      Vendor vendor,
      String division,
      String district,
      String upazila,
      String union,
      ) async{

    print('device token: ${vendor.deviceToken}');

    Map user = {
      'name': '',
      'email': '',
      'phone': '',
      'avatar': '',
      'nid_front_side': '',
      'nid_back_side': '',
      'password': '',
      'shop_name': '',
      'slug': '',
      'shop_phone': '',
      'shop_email': '',
      'shop_logo': '',
      'trade_license': '',
      'division': '',
      'district': '',
      'area': '',
      'address': '',
      'bank_name': '',
      'account_name': '',
      'account_number': '',
      'routing_number': '',
      'bkash': '',
      'rocket': '',
      'nagad': '',
      'upay': ''
    };
    APIManager _manager=APIManager();

    //final response = await _manager.multipartPostAPI(ApiClient.registration, user,);
  }

  ///User Login api call
  Future<UserModel> userLogin(Vendor vendor) async {
    print('device token: ${vendor.deviceToken}');
    Map user = {'phone': vendor.phone,'password': vendor.password, 'device_token': vendor.deviceToken};
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(ApiClient.login, user);

    print('user login: ${response}');
    UserModel userData = UserModel.fromJson(response);
    if (userData.status == 1) {
      Get.find<AuthService>().setUser(UserModel.fromJson(response));
    }

    return UserModel.fromJson(response);
  }

  Future<List<PlaceModel>> getDistrict(String divisionId) async {
    APIManager _manager = APIManager();

    final response = await _manager.get(ApiClient.district + divisionId);

    return List.from(response.map((item) => PlaceModel.fromJson(item)));
  }

  Future<List<PlaceModel>> getUpazila(String districtId) async {
    APIManager _manager = APIManager();

    final response = await _manager.get(ApiClient.upazila + districtId);

    return List.from(response.map((item) => PlaceModel.fromJson(item)));
  }

  Future<List<PlaceModel>> getUnion(String upazilaId) async {
    APIManager _manager = APIManager();

    final response = await _manager.get(ApiClient.union + upazilaId);

    return List.from(response.map((item) => PlaceModel.fromJson(item)));
  }
}
