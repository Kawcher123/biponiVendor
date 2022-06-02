import 'package:biponi_vendor/app/models/seller_model.dart';
import 'package:biponi_vendor/app/repositories/profile_repository.dart';
import 'package:biponi_vendor/common/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final userData = SellerModel().obs;
  final userDataLoaded = false.obs;

  late GlobalKey<FormState> updateFormKey;

  late GlobalKey<FormState> updatePassKey;


  final oldPassword = ''.obs;
  final newPassword = ''.obs;

  @override
  void onInit() {
    updateFormKey = GlobalKey<FormState>();
    updatePassKey = GlobalKey<FormState>();
    getSellerInfo();
    super.onInit();
  }

  refreshSeller()async
  {
    getSellerInfo();
  }

  getSellerInfo() async {
    ProfileRepository().getSellerInfo().then((resp) {
      userData.value = resp;
      userDataLoaded.value = true;
    });
  }

  Future updatePass() async {
    Ui.customLoaderAddToCart();
    ProfileRepository().updatePassword(oldPassword.value, newPassword.value).then((resp) {
      Get.back();
      if (resp['status'].toString() == '1') {
        Get.showSnackbar(Ui.SuccessSnackBar(message: 'Password updated successfully.'.tr, title: 'Success'.tr));
      } else {
        Get.showSnackbar(Ui.ErrorSnackBar(message: 'Password update failed., try later'.tr, title: 'Error'.tr));
      }
    });
  }

  Future updateData() async {
    Get.focusScope!.unfocus();
    if (updateFormKey.currentState!.validate()) {
      updateFormKey.currentState!.save();

      Ui.customLoader();

      ProfileRepository().updateUserData(userData.value.user!.name!, userData.value.user!.email!, userData.value.user!.phone!, userData.value.shopInfo!.name!).then((response) {
        if (response) {
          Get.back();
          Get.showSnackbar(Ui.SuccessSnackBar(message: 'Account data updated successfully'.tr, title: 'Success'.tr));
        } else {
          Get.back();
          Get.showSnackbar(Ui.ErrorSnackBar(message: 'User not found'.tr, title: 'Error'.tr));
        }
      });
    }
  }

}
