import 'package:biponi_vendor/app/commons/colors.dart';
import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:biponi_vendor/app/commons/sub_head_widget.dart';
import 'package:biponi_vendor/app/models/user_model.dart';
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

  final _size=Get.size;

  @override
  Widget build(BuildContext context) {

    UserModel currentUser=Get.find<AuthService>().user.value;

    return Scaffold(
      appBar: CommonWidgets.defaultAppBar(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              currentUser.vendor!.avatar!=null?
              CircleAvatar(
                radius: 70,
                backgroundImage: CachedNetworkImageProvider(
                   ApiClient.imageHead+currentUser.vendor!.avatar!,

                ),)
                  : Image.asset('assets/images/user.png'),

              // SizedBox(height: CommonWidgets.size.width*0.05,),
              // Card(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Column(
              //       children: [
              //         SubHeadWidget(title: 'Personal Information'),
              //         SizedBox(height: CommonWidgets.size.width*0.05,),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               'Seller Name',
              //               style: TextStyle(
              //                   color: Colors.black,
              //                   fontSize: 16
              //               ),
              //             ),
              //             Text(
              //               '${currentUser.vendor!.name}',
              //               style: TextStyle(
              //                   color: Colors.black,
              //                   fontSize: 16
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(height: CommonWidgets.size.width*0.04,),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               'Phone',
              //               style: TextStyle(
              //                   color: Colors.black,
              //                   fontSize: 16
              //               ),
              //             ),
              //             Text(
              //               '${currentUser.vendor!.phone}',
              //               style: TextStyle(
              //                   color: Colors.black,
              //                   fontSize: 16
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(height: CommonWidgets.size.width*0.04,),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               'Email',
              //               style: TextStyle(
              //                   color: Colors.black,
              //                   fontSize: 16
              //               ),
              //             ),
              //             Text(
              //               '${currentUser.vendor!.email}',
              //               style: TextStyle(
              //                   color: Colors.black,
              //                   fontSize: 16
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(height: CommonWidgets.size.width*0.01,),
              //       ],
              //     ),
              //   ),
              // ),


              SizedBox(height: 10),
              Text(
                '${currentUser.vendor!.name?.toUpperCase()}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 2),
              Text('${currentUser.vendor!.phone}'),
              Text('${currentUser.vendor!.email}'),

              SizedBox(height: 20),
              
              ProfileMenu(
                text: "My Profile",
                icon: "assets/icons/User Icon.svg",
                //press: () => {Get.toNamed(Routes.PROFILE)},
              ),
              ProfileMenu(
                text: "Change Password",
                icon: "assets/icons/Lock.svg",
                //press: () => {Get.toNamed(Routes.PROFILE)},
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
      )
    );
  }
}
