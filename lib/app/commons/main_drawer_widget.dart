import 'package:biponi_vendor/app/modules/root/controllers/root_controller.dart';
import 'package:biponi_vendor/app/routes/app_pages.dart';
import 'package:biponi_vendor/app/services/auth_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'drawer_link_widget.dart';

class MainDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          //SizedBox(height: 100),
          DrawerHeader(
              child: Image(
            image: AssetImage(
              'assets/images/Logo.png',
            ),
          )),
          //Divider(thickness: 1),
          DrawerLinkWidget(
            icon: Icons.home_outlined,
            text: "Home",
            onTap: (e) {
              Get.back();
              Get.offAllNamed(Routes.root);
              Get.find<RootController>().changePage(0);
            },
          ),

          // DrawerLinkWidget(
          //   icon: Icons.people_outline,
          //   text: "Customer List",
          //   onTap: (e) {
          //     Get.toNamed(Routes.CUSTOMER_LIST);
          //   },
          // ),

          DrawerLinkWidget(
            icon: Icons.add_circle_outline,
            text: "Add Product",
            onTap: (e) {
              Get.toNamed(Routes.ADD_PRODUCTS);
            },
          ),
          // DrawerLinkWidget(
          //   icon: Icons.reviews_outlined,
          //   text: "Product Reviews",
          //   onTap: (e) {
          //     //Get.toNamed(Routes.ADD_PRODUCTS);
          //   },
          // ),
          // DrawerLinkWidget(
          //   icon: Icons.assignment_return_outlined,
          //   text: "Product Return Request",
          //   onTap: (e) {
          //     //Get.toNamed(Routes.ADD_PRODUCTS);
          //   },
          // ),
          DrawerLinkWidget(
            icon: Icons.notifications_none_outlined,
            text: "Notifications",
            onTap: (e) {
              Get.toNamed(Routes.NOTIFICATION);
            },
          ),
          // ListTile(
          //   dense: true,
          //   title: Text(
          //     "Application preferences".tr,
          //     style: Get.textTheme.caption,
          //   ),
          //   trailing: Icon(
          //     Icons.remove,
          //     color: Get.theme.focusColor.withOpacity(0.3),
          //   ),
          // ),
          // DrawerLinkWidget(
          //   icon: Icons.settings_outlined,
          //   text: "Settings",
          // ),
          ListTile(
            dense: true,
            title: Text(
              "Help & Privacy".tr,
              style: Get.textTheme.caption,
            ),
            trailing: Icon(
              Icons.remove,
              color: Get.theme.focusColor.withOpacity(0.3),
            ),
          ),
          DrawerLinkWidget(
            icon: Icons.policy_outlined,
            text: "Privacy Policy",
            onTap: (e) {
              Get.toNamed(Routes.COMMON_WEBVIEW, arguments: {'title': 'Privacy Policy'.tr, 'url': 'https://biponi.com/pages/privacy_policy'});
            },
          ),
          DrawerLinkWidget(
              icon: Icons.logout_outlined,
              text: "Logout",
              onTap: (e) {
                Get.find<AuthService>().removeCurrentUser();
                Get.offAllNamed(Routes.login);
              }),
          ListTile(
            dense: true,
            title: Text(
              "Design & Developed by VMSL".tr,
              style: Get.textTheme.caption,
            ),
          ),

          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: ListTile(
          //     title: Padding(
          //       padding: const EdgeInsets.only(right: 8.0),
          //       child: RichText(
          //         text: TextSpan(children: [
          //           TextSpan(
          //             text: 'Design & Developed by ',
          //             style: TextStyle(
          //               color: Colors.black,
          //               fontSize: 14.0,
          //               fontWeight: FontWeight.w400,
          //             ),
          //           ),
          //           TextSpan(
          //             text: 'VMSL',
          //             style: TextStyle(
          //               color: Colors.blue,
          //               fontSize: 15.0,
          //               fontWeight: FontWeight.bold,
          //             ),
          //             // recognizer: TapGestureRecognizer()
          //             //   ..onTap = () {
          //             //     launc('https://vmsl.com.bd/');
          //             //   },
          //           ),
          //         ]),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
