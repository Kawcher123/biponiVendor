import 'package:biponi_vendor/common/ui.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  final _size = Get.size;

  @override
  Widget build(BuildContext context) {
    Get.find<SplashScreenController>();
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: _size.height,
        width: _size.width,
        child: Stack(
          children: [
            Center(
              child: Image(
                height: 200,
                width: 200,
                image: AssetImage(
                  'assets/images/Logo.png',
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: Ui.customBottomLoader(),
            )
          ],
        ),
      ),
    );
  }
}
