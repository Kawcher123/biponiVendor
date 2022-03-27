import 'dart:convert';

import 'package:biponi_vendor/app/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';

import '../../common/ui.dart';
import 'auth_service.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

class FireBaseMessagingService extends GetxService {
  Future<FireBaseMessagingService> init() async {
    firebaseCloudMessagingListeners();
    return this;
  }

  void firebaseCloudMessagingListeners() {
    ///gives you the message on which user taps
    ///and it opened the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) async {
      if (message != null) {
        RemoteNotification notification = message.notification!;
        print(notification);

        Map nbody = jsonDecode(notification.body!);
        print(nbody);

//      Get.to(BookingsView());
        Get.showSnackbar(Ui.notificationSnackBar(
          title: notification.title!,
         // message: notification.body!,
          message: nbody['message']
        ));
      }
    });

    FirebaseMessaging.instance.requestPermission(sound: true, badge: true, alert: true);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification!;
      print(notification);

      Get.showSnackbar(Ui.notificationSnackBar(
        title: notification.title!,
        message: notification.body!,
      ));
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      RemoteNotification notification = message.notification!;
      print(notification);

//      Get.to(BookingsView());
      Get.showSnackbar(Ui.notificationSnackBar(
        title: notification.title!,
        message: notification.body!,
      ));
    });
  }

  Future<void> setDeviceToken() async {
    Get.find<LoginController>().vendorData.value.deviceToken = await FirebaseMessaging.instance.getToken();
  }
}
