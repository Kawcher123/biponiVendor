import 'package:get/get.dart';

class ApiClient {
  String api_token = '';
  static String baseUrl = 'http://192.168.86.100:8000/';

  static String registration = '${baseUrl}api/v1/user-register';

  static String login = '${baseUrl}api/v1/seller/login';
}
