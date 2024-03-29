import 'dart:convert';

import 'package:biponi_vendor/app/commons/no_data_widget.dart';
import 'package:biponi_vendor/app/routes/app_pages.dart';
import 'package:biponi_vendor/common/ui.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  final Size _size = Get.size;

  @override
  Widget build(BuildContext context) {
    controller.getNotifications();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Notifications',
            style: TextStyle(color: Get.theme.textTheme.bodyText1!.color),
          ),
          centerTitle: true,
          automaticallyImplyLeading: true,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 5, bottom: 5),
            child: Ui.getIconButton(
                svgSrc: 'assets/icons/arrow_back.svg',
                height: _size.width * .13,
                width: _size.width * .13,
                color: Colors.blue.withOpacity(0.15),
                svgColor: Get.theme.textTheme.bodyText1!.color,
                radius: 30,
                press: () {
                  Get.back();
                }),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async{
            controller.refreshNotification();
          },
          child: Obx(() {
            if (controller.notificationLoaded.isTrue) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Your Activity',
                        style: TextStyle(fontSize: 18, color: Get.theme.textTheme.bodyText1!.color),
                      ),
                    ),
                    controller.notifications.value.notification!.isNotEmpty?
                    Column(
                      children: List.generate(controller.notifications.value.notification!.length, (index) {
                        return GestureDetector(
                          onTap: () async {

                            await controller.updateNotifications(controller.notifications.value.notification![index].id.toString());

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                                width: _size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Ui.getIconButton(
                                              svgSrc: "assets/icons/Bell.svg",
                                              height: _size.width * .15,
                                              width: _size.width * .15,
                                              color: Color(0xFF979797).withOpacity(0.1),
                                              svgColor: Get.theme.primaryColor,
                                              radius: 30,
                                              press: () {}),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10.0, right: 10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.notifications.value.notification![index].title!,
                                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Get.theme.textTheme.bodyText2!.color),
                                                ),
                                                Text(
                                                  controller.notifications.value.notification![index].description!.message!,
                                                  maxLines: 3,
                                                  style: TextStyle(fontSize: 14),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: _size.width * .16 + 10,
                                      ),
                                      child: Text(
                                        '${DateFormat.yMMMMd().format(DateTime.parse(controller.notifications.value.notification![index].createdAt!))}, ${DateFormat.jms().format(DateTime.parse(controller.notifications.value.notification![index].createdAt!))}',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        );
                      }),
                    )
                        : NoDataFound(
                      text: "You don't have any notification.",
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
        ));
  }
}
