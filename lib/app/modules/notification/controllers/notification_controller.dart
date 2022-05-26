import 'package:biponi_vendor/app/models/notification_model.dart';
import 'package:biponi_vendor/app/models/viewNotification_model.dart';
import 'package:biponi_vendor/app/repositories/notification_repositories.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  //TODO: Implement NotificationController

  final notifications = NotificationModel().obs;
  final notificationLoaded = false.obs;
  final viewNotification = ViewNotificationModel().obs;

  @override
  Future<void> onInit() async {
    await getNotifications();
    super.onInit();
  }

  refreshNotification() async{
    getNotifications();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future getNotifications() async {
    NotificationRepository().getNotifications().then((resp) {
      notifications.value = resp;
      notificationLoaded.value = true;
    });
  }
}
