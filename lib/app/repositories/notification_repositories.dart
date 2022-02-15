import 'package:biponi_vendor/app/models/notification_model.dart';
import 'package:biponi_vendor/app/providers/api_manager.dart';
import 'package:biponi_vendor/app/providers/api_url.dart';
import 'package:biponi_vendor/app/services/auth_service.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class NotificationRepository {
  ///Get all notifications
  Future<NotificationModel> getNotifications() async {
    String token = Get.find<AuthService>().user.value.token!;
    APIManager _manager = APIManager();
    var headers = {'Authorization': 'Bearer $token'};
    final response = await _manager.getWithHeader(ApiClient.notifications, headers);
    return NotificationModel.fromJson(response);
  }
}