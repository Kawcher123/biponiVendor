 import 'package:biponi_vendor/app/modules/dashboard/views/dashboard_view.dart';
import 'package:biponi_vendor/app/modules/messages/views/messages_view.dart';
import 'package:biponi_vendor/app/modules/products/views/products_view.dart';
import 'package:biponi_vendor/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  //TODO: Implement RootController
  final currentIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  List<Widget> pages = [
    DashboardView(),
    ProductsView(),
    MessagesView(),
    ProfileView()
  ];

  Widget get currentPage => pages[currentIndex.value];

  void changePage(int page) {
    currentIndex.value = page;
  }
}
