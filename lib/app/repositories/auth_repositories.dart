import 'dart:io';

import 'package:biponi_vendor/app/models/place_model.dart';
import 'package:biponi_vendor/app/models/user_model.dart';
import 'package:biponi_vendor/app/providers/api_manager.dart';
import 'package:biponi_vendor/app/providers/api_url.dart';
import 'package:biponi_vendor/app/services/auth_service.dart';
import 'package:get/get.dart';

class AuthRepository {

  ///User Registration api call
  Future userRegistration(
      String name,
      String email,
      String phone,
      String password,
      var profileImage,
      var nidFrontImage,
      var nidBackImage,
      String shopName,
      String shopUrl,
      String shopPhone,
      String shopEmail,
      var shopLogo,
      var shopBanner,
      var tradeLicense,
      String division,
      String district,
      String upazila,
      String union,
      String address,
      String bankName,
      String accountName,
      String accountNumber,
      String routingNumber,
      String bkash,
      String nagad,
      String rocket,
      String upay,
      ) async{

    Map<String,String> user = {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'avatar': '',
      'nid_front_side': '',
      'nid_back_side': '',
      'status': '1',
      'shop_name': shopName,
      'slug': shopUrl,
      'shop_phone': shopPhone,
      'shop_email': shopEmail,
      'shop_logo': '',
      'shop_banner':'',
      'trade_license': '',
      'division': division,
      'district': district,
      'shop_area': upazila,
      'shop_union': union,
      'address': address,
      'bank_name': bankName,
      'account_name': accountName,
      'account_number': accountNumber,
      'routing_number': routingNumber,
      'bkash': bkash,
      'rocket': rocket,
      'nagad': nagad,
      'upay': upay,
    };

    APIManager _manager = APIManager();

    final response = await _manager.multipartPostSignupAPI(ApiClient.registration, user,profileImage,nidFrontImage,nidBackImage,shopLogo,shopBanner,tradeLicense,{});



    print('sign up:$response');
    return response;
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
