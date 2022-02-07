import 'package:biponi_vendor/app/routes/app_pages.dart';
import 'package:biponi_vendor/app/services/auth_service.dart';
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
          DrawerLinkWidget(
            icon: Icons.notifications_none_outlined,
            text: "Notifications",
            onTap: (e)
            {
              Get.toNamed(Routes.NOTIFICATION);
            },
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
          DrawerLinkWidget(
            icon: Icons.folder_special_outlined,
            text: "Log Out",
            onTap: (e)
            {
             Get.find<AuthService>().removeCurrentUser();

              Get.offAllNamed(Routes.login);
            },
          ),
        ],
      ),
    );
  }
}
