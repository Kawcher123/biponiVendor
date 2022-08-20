import 'package:biponi_vendor/app/commons/colors.dart';
import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:biponi_vendor/app/commons/sub_head_widget.dart';
import 'package:biponi_vendor/app/models/user_model.dart';
import 'package:biponi_vendor/app/modules/profile/widgets/change_password.dart';
import 'package:biponi_vendor/app/modules/profile/widgets/profile_edit.dart';
import 'package:biponi_vendor/app/modules/profile/widgets/profile_menu.dart';
import 'package:biponi_vendor/app/modules/root/controllers/root_controller.dart';
import 'package:biponi_vendor/app/providers/api_manager.dart';
import 'package:biponi_vendor/app/providers/api_url.dart';
import 'package:biponi_vendor/app/routes/app_pages.dart';
import 'package:biponi_vendor/app/services/auth_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final _size = Get.size;

  @override
  Widget build(BuildContext context) {
    UserModel currentUser = Get.find<AuthService>().user.value;
    Get.put(ProfileController());
    return Scaffold(
        appBar: CommonWidgets.defaultAppBar(context),
        body: RefreshIndicator(
          onRefresh: () async {
            controller.refreshSeller();
          },
          child: Obx(() {
            if (controller.userDataLoaded.isTrue) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      currentUser.vendor!.avatar != null
                          ? CircleAvatar(
                              radius: 70,
                              backgroundImage: CachedNetworkImageProvider(
                                ApiClient.imageHead + currentUser.vendor!.avatar!,
                              ),
                            )
                          : Image.asset('assets/images/user.png'),

                      SizedBox(height: 10),
                      Obx(() => Text(
                            '${controller.userData.value.user?.name?.toUpperCase()}',
                            style: TextStyle(fontSize: 20),
                          )),
                      SizedBox(height: 2),
                      Text('${controller.userData.value.user?.phone}'),
                      Text('${controller.userData.value.user?.email}'),

                      SizedBox(height: 20),

                      ProfileMenu(
                        text: "My Profile",
                        icon: "assets/icons/User Icon.svg",
                        press: () => {Get.to(() => ProfileEdit())},
                      ),
                      ProfileMenu(
                        text: "Change Password",
                        icon: "assets/icons/Lock.svg",
                        press: () => {Get.to(() => ChangePassword())},
                      ),
                      ProfileMenu(
                        text: "Log Out",
                        icon: "assets/icons/Log out.svg",
                        press: () async {
                          await Get.find<AuthService>().removeCurrentUser();
                          // Get.back();
                          //Get.put(RootController()).changePageOutRoot(0);
                          Get.toNamed(Routes.login);
                        },
                      ),

                      // SizedBox(height: CommonWidgets.size.width*0.1,),
                      // CommonWidgets.customButton(
                      //     color: secondaryColor,
                      //     text: 'Logout',
                      //     press: (){
                      //       Get.find<AuthService>().removeCurrentUser();
                      //
                      //       Get.offAllNamed(Routes.login);
                      //     }
                      // )
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ));
  }
}
