import 'package:get/get.dart';

class ApiClient {
  String api_token = '';
  static String baseUrl = 'https://api.biponi.com/';

  static String imageHead = 'https://api.biponi.com/';

  static String registration = '${baseUrl}api/v1/seller/seller-register';

  static String login = '${baseUrl}api/v1/seller/login';

  static String orderList = '${baseUrl}api/v1/seller/order/list';

  static String orderDetails = '${baseUrl}api/v1/seller/order/details/';

  static String productList = '${baseUrl}api/v1/seller/product/list';

  static String customerList = '${baseUrl}api/v1/seller/customer/list';

  static String notifications = '${baseUrl}api/v1/get/seller/notifications';

  static String updateNotification = '${baseUrl}api/v1/seller/view-notification/';

  static String dashboard = '${baseUrl}api/v1/seller/dashboard';

  static String updateorderStatus = '${baseUrl}api/v1/seller/order/update';

  static String district = '${baseUrl}api/v1/get-district/';

  static String upazila = '${baseUrl}api/v1/get-upazila/';

  static String union = '${baseUrl}api/v1/get-union/';

  static String addProduct = '${baseUrl}api/v1/seller/product/store';

  static String attributes = '${baseUrl}api/v1/seller/product/attribute-set';

  static String brands = '${baseUrl}api/v1/brands';

  static String categories = '${baseUrl}api/v1/categories';

  static String subCategories = '${baseUrl}api/v1/get-sub-category';

  static String editProduct = '${baseUrl}api/v1/seller/product/edit/';

  static String saveeditedProduct = '${baseUrl}api/v1/seller/product/update/';
}
