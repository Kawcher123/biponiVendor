import 'package:get/get.dart';

import 'package:biponi_vendor/app/modules/add_products/bindings/add_products_binding.dart';
import 'package:biponi_vendor/app/modules/add_products/views/add_products_view.dart';
import 'package:biponi_vendor/app/modules/customer_list/bindings/customer_list_binding.dart';
import 'package:biponi_vendor/app/modules/customer_list/views/customer_list_view.dart';
import 'package:biponi_vendor/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:biponi_vendor/app/modules/dashboard/views/dashboard_view.dart';
import 'package:biponi_vendor/app/modules/home/bindings/home_binding.dart';
import 'package:biponi_vendor/app/modules/home/views/home_view.dart';
import 'package:biponi_vendor/app/modules/login/bindings/login_binding.dart';
import 'package:biponi_vendor/app/modules/login/views/login_view.dart';
import 'package:biponi_vendor/app/modules/messages/bindings/messages_binding.dart';
import 'package:biponi_vendor/app/modules/messages/views/chat_home.dart';
import 'package:biponi_vendor/app/modules/notification/bindings/notification_binding.dart';
import 'package:biponi_vendor/app/modules/notification/views/notification_view.dart';
import 'package:biponi_vendor/app/modules/order_details/bindings/order_details_binding.dart';
import 'package:biponi_vendor/app/modules/order_details/views/order_details_view.dart';
import 'package:biponi_vendor/app/modules/order_list/bindings/order_list_binding.dart';
import 'package:biponi_vendor/app/modules/order_list/views/order_list_view.dart';
import 'package:biponi_vendor/app/modules/product_edit/bindings/product_edit_binding.dart';
import 'package:biponi_vendor/app/modules/product_edit/views/product_edit_view.dart';
import 'package:biponi_vendor/app/modules/products/bindings/products_binding.dart';
import 'package:biponi_vendor/app/modules/products/views/products_view.dart';
import 'package:biponi_vendor/app/modules/profile/bindings/profile_binding.dart';
import 'package:biponi_vendor/app/modules/profile/views/profile_view.dart';
import 'package:biponi_vendor/app/modules/register/bindings/register_binding.dart';
import 'package:biponi_vendor/app/modules/register/views/register_view.dart';
import 'package:biponi_vendor/app/modules/root/bindings/root_binding.dart';
import 'package:biponi_vendor/app/modules/root/views/root_view.dart';
import 'package:biponi_vendor/app/modules/splashScreen/bindings/splash_screen_binding.dart';
import 'package:biponi_vendor/app/modules/splashScreen/views/splash_screen_view.dart';
import 'package:biponi_vendor/app/modules/welcome_screen/bindings/welcome_screen_binding.dart';
import 'package:biponi_vendor/app/modules/welcome_screen/views/welcome_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME_SCREEN,
      page: () => WelcomeScreenView(),
      binding: WelcomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.register,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.root,
      page: () => RootView(),
      binding: RootBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTS,
      page: () => ProductsView(),
      binding: ProductsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PRODUCTS,
      page: () => AddProductsView(),
      binding: AddProductsBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER_LIST,
      page: () => CustomerListView(),
      binding: CustomerListBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAILS,
      page: () => OrderDetailsView(),
      binding: OrderDetailsBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_LIST,
      page: () => OrderListView(),
      binding: OrderListBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGES,
      page: () => MessagesView(),
      binding: MessagesBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_EDIT,
      page: () => ProductEditView(),
      binding: ProductEditBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
  ];
}
