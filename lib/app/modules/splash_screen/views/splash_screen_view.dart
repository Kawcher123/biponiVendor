import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:biponi_vendor/app/modules/splash_screen/components/splash_component.dart';
import 'package:biponi_vendor/app/modules/splash_screen/constants/constant_data.dart';
import 'package:biponi_vendor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: PageView.builder(
                  onPageChanged: (value) {
                    controller.currentPage.value = value;
                  },
                  itemCount: ConstantData().splashData.length,
                  itemBuilder: (context, index) => SplashComponent(
                    image: ConstantData().splashData[index]["image"],
                    text: ConstantData().splashData[index]['text'],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          ConstantData().splashData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                      Spacer(flex: 1),
                      CommonWidgets.customButton(
                          text: 'Continue',
                          press: () {
                            Get.offNamed(Routes.login);
                          })
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        );
      }),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: controller.currentPage.value == index ? 20 : 6,
      decoration: BoxDecoration(
        color: controller.currentPage.value == index
            ? Get.theme.primaryColor
            : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
