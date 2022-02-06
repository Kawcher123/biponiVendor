import 'dart:io';

import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  final count = 0.obs;
  var selectedImagePath = File('').obs;
  var selectedImagePath1 = File('').obs;

  var cropImagePath = File('').obs;
  var cropImagePath1 = File('').obs;

  var compressImagePath = File('').obs;
  var compressImagePath1 = File('').obs;
  @override
  void onInit() {
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



  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
