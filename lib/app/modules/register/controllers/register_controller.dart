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

  var selectedImagePath = File('').obs;
  var selectedImagePath1 = File('').obs;
  var selectedImagePath2 = File('').obs;

  var cropImagePath = File('').obs;
  var cropImagePath1 = File('').obs;

  var compressImagePath = File('').obs;
  var compressImagePath1 = File('').obs;

  @override
  void onInit() {
    registrationFormKey = GlobalKey<FormState>();
    super.onInit();
  }

  //  getImage(ImageSource imageSource) async {
  //   final image = await ImagePicker().pickImage(source: imageSource);
  //   if(image != null)
  //   {
  //     selectedImagePath.value=File(image.path);
  //     );
  //   }else
  //     {
  //       Get.snackbar(
  //         'Error', 'No Picture Selected',
  //         snackPosition: SnackPosition.BOTTOM
  //       );
  //     }
  // }

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
    print(divisionId.value);
    print(districtId.value);
    print(upazilaId.value);
    print(unionId.value);
    print(userData.value.address);
    //AuthRepository().userRegistration(vendor, division, district, upazila, union);
  }

}
