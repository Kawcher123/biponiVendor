import 'package:biponi_vendor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'drawer_link_widget.dart';

class MainDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(height: 100),
          Divider(
            thickness: 1,
          ),
          DrawerLinkWidget(
            icon: Icons.home_outlined,
            text: "Home",
            // onTap: (e)
            // {
            //   Get.toNamed(Routes.DASHBOARD);
            // },
          ),
          DrawerLinkWidget(
            icon: Icons.folder_special_outlined,
            text: "Customer List",
            onTap: (e)
            {
              Get.toNamed(Routes.CUSTOMER_LIST);
            },
          ),
          DrawerLinkWidget(
            icon: Icons.folder_special_outlined,
            text: "Add Product",
            onTap: (e)
            {
              Get.toNamed(Routes.ADD_PRODUCTS);
            },
          ),
          // DrawerLinkWidget(
          //   icon: Icons.assignment_outlined,
          //   text: "Order Details",
          //   onTap: (e)
          //   {
          //     Get.toNamed(Routes.ORDER_DETAILS);
          //   },
          // ),
          DrawerLinkWidget(
            icon: Icons.notifications_none_outlined,
            text: "Notifications",
            onTap: (e)
            {
              Get.toNamed(Routes.NOTIFICATION);
            },
          ),

          // DrawerLinkWidget(
          //   icon: Icons.favorite_outline,
          //   text: "Saved",
          //   onTap: (e) {
          //     Get.back();
          //     Get.find<RootController>().changePage(1);
          //   },
          // ),
          DrawerLinkWidget(
            icon: Icons.chat_outlined,
            text: "Messages",
          ),
          ListTile(
            dense: true,
            title: Text(
              "Application preferences".tr,
              style: Get.textTheme.caption,
            ),
            trailing: Icon(
              Icons.remove,
              color: Get.theme.focusColor.withOpacity(0.3),
            ),
          ),
          // DrawerLinkWidget(
          //   icon: Icons.person_outline,
          //   text: "Account",
          // ),
          DrawerLinkWidget(
            icon: Icons.settings_outlined,
            text: "Settings",
          ),
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
            icon: Icons.help_outline,
            text: "Help & FAQ",
          ),
        ],
      ),
    );
  }
}
