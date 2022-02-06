import 'package:biponi_vendor/app/models/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetxService {
  final user = UserModel().obs;

  late GetStorage _box;

  AuthService() {
    _box = GetStorage();
  }

  // Future<AuthService> init() async {
  //   user.listen((User _user) {
  //     if (Get.isRegistered<SettingsService>()) {
  //       Get.find<SettingsService>().address.value.userId = _user.id;
  //     }
  //     _box.write('current_user', _user.toJson());
  //   });
  //   await getCurrentUser();
  //   return this;
  // }

  @override
  void onInit() async {
    // TODO: implement onInit
    _box = GetStorage();
    getCurrentUser();
    super.onInit();
  }

  void setUser(UserModel user) async {
    _box.write('current_user', user.toJson());
    getCurrentUser();
  }

  Future getCurrentUser() async {
    if (_box.hasData('current_user')) {
      user.value = UserModel.fromJson(await _box.read('current_user'));
    }
    print('customer data: ${user.value.token}');
  }

  Future removeCurrentUser() async {
    user.value = UserModel();

    await _box.remove('current_user');

    await _box.remove('shipping_info');
  }

  bool get isAuth => user.value.token == null ? false : true;

  String get apiToken => user.value.token!;
}
