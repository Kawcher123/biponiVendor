import 'package:biponi_vendor/app/commons/main_drawer_widget.dart';
import 'package:fancy_bottom_navigation_2/fancy_bottom_navigation.dart';
// import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        drawer: MainDrawerWidget(),
        body: Container(
          child: Center(
            child: controller.currentPage,
          ),
        ),
        // bottomNavigationBar: SalomonBottomBar(
        //   selectedItemColor: Get.theme.primaryColor,
        //   items: [
        //     SalomonBottomBarItem(
        //       icon: Icon(CupertinoIcons.circle_grid_3x3),
        //       title: Text("Dashboard"),
        //     ),
        //
        //     SalomonBottomBarItem(
        //       icon: Icon(CupertinoIcons.square_list),
        //       title: Text("Products"),
        //     ),
        //
        //     SalomonBottomBarItem(
        //       icon: Icon(Icons.chat_outlined),
        //       title: Text("Chat"),
        //     ),
        //
        //     SalomonBottomBarItem(
        //       icon: Icon(CupertinoIcons.person),
        //       title: Text("Profile"),
        //     ),
        //   ],
        //   currentIndex: controller.currentIndex.value,
        //   onTap: (index) {
        //     controller.changePage(index);
        //   },
        // ),

        bottomNavigationBar: FancyBottomNavigation(
          barBackgroundColor: context.theme.scaffoldBackgroundColor,
          textColor: Get.theme.primaryColor,
          circleColor: Get.theme.primaryColor,
          activeIconColor: Colors.white,
          tabs: [
            TabData(iconData: CupertinoIcons.circle_grid_3x3, title: "Dashboard"),
            TabData(iconData: CupertinoIcons.square_list, title: "Products"),
            TabData(iconData: Icons.chat_outlined, title: "Chat"),
            TabData(iconData: CupertinoIcons.person, title: "Profile"),
          ],
          onTabChangedListener: (index) {
            controller.changePage(index);
          },
        ),
      );
    });
  }
}
