import 'package:biponi_vendor/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:biponi_vendor/app/modules/messages/bindings/messages_binding.dart';
import 'package:biponi_vendor/app/services/auth_service.dart';
import 'package:biponi_vendor/app/services/firebase_messaging_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

initServices() async {
  Get.log('starting services ...');
  await GetStorage.init();

  await Get.putAsync<AuthService>(() async => await AuthService());

  await Firebase.initializeApp();
  await Get.putAsync(() => FireBaseMessagingService().init());

  MessagesBinding().dependencies();
  DashboardBinding().dependencies();

  Get.log('All services started...');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
    ),
  );
}
