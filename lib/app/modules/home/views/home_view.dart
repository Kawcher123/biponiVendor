import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        //  iconTheme: Get.theme.iconTheme,
        leading: IconButton(
          icon: Icon(Icons.sort, color: Get.theme.primaryColor),
          onPressed: () => {Scaffold.of(context).openDrawer()},
        ),
        actions: [

        ],
      ),
      body: Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
