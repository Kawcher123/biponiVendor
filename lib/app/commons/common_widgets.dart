import 'package:biponi_vendor/app/commons/colors.dart';
import 'package:biponi_vendor/app/modules/notification/controllers/notification_controller.dart';
import 'package:biponi_vendor/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonWidgets {
  static Size size = Get.size;

  static SizedBox customButton(
      {String? text, VoidCallback? press, Color? color}) {
    return SizedBox(
      width: double.infinity,
      height: size.width * 0.12,
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: backgroundColor,
          backgroundColor: color ?? secondaryColor,
        ),
        onPressed: press,
        child: Text(
          text ?? '',
          style: TextStyle(
            fontSize: 15,
            color: backgroundColor,
          ),
        ),
      ),
    );
  }

  static AppBar defaultAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: backgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      //  iconTheme: Get.theme.iconTheme,
      leading: IconButton(
        icon: Icon(Icons.sort, color: Get.theme.primaryColor),
        onPressed: () => {Scaffold.of(context).openDrawer()},
      ),
      actions: [
        Obx((){
          return GestureDetector(
            onTap: ()
            {
              Get.toNamed(Routes.NOTIFICATION);
            },
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(.15),
                      radius: 20.0,
                      child: Icon(
                        CupertinoIcons.bell,
                        size: 20.0,
                        color: primaryColor,
                      )),
                ),
                Positioned(
                    top: 0,
                    right: 6,
                    child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 9,
                        child: Text(
                          Get.put(NotificationController()).notificationLoaded.isTrue?
                          '${ Get.put(NotificationController()).notifications.value.notification!.length}':'0',
                          style: TextStyle(
                            fontSize: 11,
                            color: backgroundColor,
                          ),
                        ))
                ),
              ],
            ),
          );
        })
      ],
    );
  }
}
