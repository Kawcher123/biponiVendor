import 'package:get/get.dart';

class ApiClient {
  String api_token = '';
  static String baseUrl = 'http://192.168.86.100:8000/';

  static String imageHead = 'http://192.168.86.100:8000/';

  static String registration = '${baseUrl}api/v1/user-register';

  static String login = '${baseUrl}api/v1/seller/login';

  static String orderList = '${baseUrl}api/v1/seller/order/list';

  static String orderDetails = '${baseUrl}api/v1/seller/order/details/';

  static String productList = '${baseUrl}api/v1/seller/product/list';
  
}
