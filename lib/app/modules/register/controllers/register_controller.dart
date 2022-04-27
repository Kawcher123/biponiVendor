import 'dart:io';
import 'package:biponi_vendor/app/models/place_model.dart';
import 'package:biponi_vendor/app/models/registration_model.dart';
import 'package:biponi_vendor/app/repositories/auth_repositories.dart';
import 'package:biponi_vendor/common/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  final userData = RegistrationModel().obs;

  late GlobalKey<FormState> registrationFormKey;

  final hidePassword = true.obs;

  final divisionId = ''.obs;

  final district = <PlaceModel>[].obs;
  final districtId = ''.obs;
  final districtLoaded = true.obs;

  final upazila = <PlaceModel>[].obs;
  final upazilaId = ''.obs;
  final upazilaLoaded = true.obs;

  final union = <PlaceModel>[].obs;
  final unionId = ''.obs;
  final unionLoaded = true.obs;

  var profileImage = File('').obs;
  var nidFrontImage = File('').obs;
  var nidBackImage = File('').obs;

  var shopLogo = File('').obs;
  var shopBanner = File('').obs;
  var tradeLicense = File('').obs;

  @override
  void onInit() {
    registrationFormKey = GlobalKey<FormState>();
    super.onInit();
  }

  getDistrict(String id) async {
    Ui.customLoaderAddToCart();
    AuthRepository().getDistrict(id).then((res) {
      print(res.length);
      district.value = res;
      Get.back();
    });
  }

  getUpazila(String id) async {
    Ui.customLoaderAddToCart();
    AuthRepository().getUpazila(id).then((res) {
      upazila.value = res;
      Get.back();
    });
  }

  getUnion(String id) async {
    Ui.customLoaderAddToCart();
    AuthRepository().getUnion(id).then((res) {
      union.value = res;
      Get.back();
    });
  }

  ///Image
  Future<File> getImage(ImageSource imageSource) async {
    var file=File('');
    await ImagePicker().pickImage(source: imageSource).then((resp)
    {
      var image =resp;
      if(image != null)
      {
        file = File(image.path);
        // selectedImagePath.value=File(image.path);
        // final cropImage =await ImageCropper.cropImage(
        //     sourcePath: selectedImagePath.value,
        // );
      }else
      {
        Get.snackbar(
            'Error', 'No Picture Selected',
            snackPosition: SnackPosition.BOTTOM
        );
      }
    });

    return file;
  }

  void register() async{
    print(userData.value.name);
    print(userData.value.email);
    print(userData.value.phone);
    print(userData.value.password);
    print(profileImage);
    print(nidBackImage);
    print(nidFrontImage);
    print(userData.value.shopName);
    print(userData.value.slug);
    print(userData.value.shopPhone);
    print(userData.value.shopEmail);

    print(shopLogo);
    print(shopBanner);
    print(tradeLicense);
    print(divisionId.value);
    print(districtId.value);
    print(upazilaId.value);
    print(unionId.value);
    print(userData.value.address);

    print(userData.value.bankName);
    print(userData.value.accountName);
    print(userData.value.accountNumber);
    print(userData.value.routingNumber);

    print(userData.value.bkash);
    print(userData.value.nagad);
    print(userData.value.rocket);
    print(userData.value.upay);

    AuthRepository().userRegistration(
      userData.value.name!,
      userData.value.email!,
      userData.value.phone!,
      userData.value.password!,
      profileImage.value,
      nidFrontImage.value,
      nidBackImage.value,
      userData.value.shopName!,
      userData.value.slug!,
      userData.value.shopPhone!,
      userData.value.shopEmail!,
      shopLogo.value,
      shopBanner.value,
      tradeLicense.value,
      divisionId.value,
      districtId.value,
      upazilaId.value,
      unionId.value,
      userData.value.address!,
      userData.value.bankName!,
      userData.value.accountName!,
      userData.value.accountNumber!,
      userData.value.routingNumber!,
      userData.value.bkash!,
      userData.value.nagad!,
      userData.value.rocket!,
      userData.value.upay!,).then((res) {
        print(res);
        if(res['status'].toString()=='1')
          {
            Get.showSnackbar(Ui.SuccessSnackBar(message: 'Registration successful',title: 'Success'));
          }
      });
  }

}
