import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProductsController extends GetxController {
  //TODO: Implement AddProductsController

  final count = 0.obs;
  final productType = 'Simple'.obs;
  final specification = 'Motorcycle'.obs;
  var selectedImage = File('').obs;
  var selectedImage1 = File('').obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<File> productGetImage(ImageSource imageSource) async {
    var file1=File('');
    await ImagePicker().pickImage(source: imageSource).then((resp)
    {
      var image =resp;
      if(image != null)
      {
        file1 = File(image.path);
      }else
      {
        Get.snackbar(
            'Error', 'No Picture Selected',
            snackPosition: SnackPosition.BOTTOM
        );
      }
    });
    return file1;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
