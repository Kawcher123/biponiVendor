import 'package:biponi_vendor/app/commons/colors.dart';
import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:biponi_vendor/app/commons/sub_head_widget.dart';
import 'package:biponi_vendor/app/models/user_model.dart';
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
    print('image:${currentUser.vendor!.avatar!}');
    return Scaffold(
      appBar: CommonWidgets.defaultAppBar(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Stack(
              //   children: [
              //     currentUser.vendor!.avatar!=null?
              //     CircleAvatar(
              //       radius: 70,
              //       backgroundImage: CachedNetworkImageProvider(
              //         ApiClient.imageHead+currentUser.vendor!.avatar!,
              //
              //       ),
              //     ):Image.asset('assets/images/user.png'),
              //     Positioned(
              //       bottom: 0,
              //       right: 0,
              //       child: CircleAvatar(
              //           backgroundColor: Colors.blue.shade400,
              //           radius: 20,
              //           child: IconButton(
              //             onPressed: (){
              //               showModalBottomSheet(
              //                 context: context,
              //                 builder: (BuildContext context) {
              //                   return Container(
              //                     height: _size.width*.5,
              //                     width: _size.width*.5,
              //                     color: Colors.white,
              //                     child: Center(
              //                       child: Column(
              //                         mainAxisAlignment: MainAxisAlignment.center,
              //                         mainAxisSize: MainAxisSize.min,
              //                         children:
              //                         [
              //                           ElevatedButton(
              //                             child: const Text('Open Camera'),
              //                             onPressed: () {
              //                               // controller.getImage(ImageSource.camera).then((res)
              //                               // {
              //                               //   controller.profileImage.value=res;
              //                               //   Get.back();
              //                               // });
              //                             },
              //                           ),
              //                           ElevatedButton(
              //                             child: const Text('From Gallery'),
              //                             onPressed: () {
              //                               // controller.getImage(ImageSource.gallery).then((res)
              //                               // {
              //                               //   controller.profileImage.value=res;
              //                               //   Get.back();
              //                               // });
              //
              //                             },
              //                           )
              //                         ],
              //                       ),
              //                     ),
              //                   );
              //                 },
              //               );
              //             },
              //             icon: Icon(Icons.camera_alt_outlined,size: 20,color: Colors.white,),
              //           )
              //       ),
              //     ),
              //
              //   ],
              // ),

              currentUser.vendor!.avatar!=null?
              CircleAvatar(
                radius: 70,
                backgroundImage: CachedNetworkImageProvider(
                   ApiClient.imageHead+currentUser.vendor!.avatar!,

                ),
              ):Image.asset('assets/images/user.png'),
              SizedBox(height: CommonWidgets.size.width*0.05,),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SubHeadWidget(title: 'Personal Information'),
                      SizedBox(height: CommonWidgets.size.width*0.05,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Seller Name',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16
                            ),
                          ),
                          Text(
                            '${currentUser.vendor!.name}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: CommonWidgets.size.width*0.04,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Phone',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16
                            ),
                          ),
                          Text(
                            '${currentUser.vendor!.phone}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: CommonWidgets.size.width*0.04,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16
                            ),
                          ),
                          Text(
                            '${currentUser.vendor!.email}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: CommonWidgets.size.width*0.01,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: CommonWidgets.size.width*0.1,),
              CommonWidgets.customButton(
                  color: secondaryColor,
                  text: 'Logout',
                  press: (){
                    Get.find<AuthService>().removeCurrentUser();

                    Get.offAllNamed(Routes.login);
                  }
              )
            ],
          ),
        ),
      )
    );
  }
}
