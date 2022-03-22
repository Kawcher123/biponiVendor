import 'dart:io';
import 'package:biponi_vendor/app/repositories/chat_repository.dart';
import 'package:biponi_vendor/common/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MessagesController extends GetxController {
  //TODO: Implement MessagesController

  late File imageFile;
  final chatTextController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  Future getImage(ImageSource source) async {
    ImagePicker imagePicker = ImagePicker();
    PickedFile pickedFile;

    pickedFile = (await imagePicker.getImage(
      source: source,
      imageQuality: 25,
    ))!;
    imageFile = File(pickedFile.path);

    if (imageFile != null) {
      try {
        return ChatRepository().uploadFile(imageFile);
      } catch (e) {
        print(e);
        throw (e).toString();
//        Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
      }
    } else {
      Get.showSnackbar(Ui.ErrorSnackBar(message: "Please select an image file".tr));
    }
  }
}
