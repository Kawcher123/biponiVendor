import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:biponi_vendor/app/modules/welcome_screen/components/welcome_component.dart';
import 'package:biponi_vendor/app/modules/welcome_screen/constants/constant_data.dart';
import 'package:biponi_vendor/app/routes/app_pages.dart';
import 'package:biponi_vendor/app/services/auth_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/welcome_screen_controller.dart';

class WelcomeScreenView extends GetView<WelcomeScreenController> {
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
                  itemCount: ConstantData().welcomeData.length,
                  itemBuilder: (context, index) => WelcomeComponent(
                    image: ConstantData().welcomeData[index]["image"],
                    text: ConstantData().welcomeData[index]['text'],
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
                          ConstantData().welcomeData.length,
                              (index) => buildDot(index: index),
                        ),
                      ),
                      Spacer(flex: 1),
                      CommonWidgets.customButton(
                          text: 'Continue',
                          press: () {
                            if (Get.find<AuthService>().isAuth) {
                              Get.offNamed(Routes.root);
                            } else {
                              Get.offNamed(Routes.login);
                            }
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
        color: controller.currentPage.value == index ? Get.theme.primaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
