import 'dart:io';
import 'package:biponi_vendor/app/commons/colors.dart';
import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:biponi_vendor/app/commons/text_field_widget.dart';
import 'package:biponi_vendor/app/routes/app_pages.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final _size = Get.size;

  final division = [
    {'id': "68", 'title': 'Dhaka'},
    {'id': "36", 'title': 'Chattogram'},
    {'id': "60", 'title': 'Rajshahi'},
    {'id': "65", 'title': 'Khulna'},
    {'id': "66", 'title': 'Barishal'},
    {'id': "67", 'title': 'Sylhet'},
    {'id': "6175", 'title': 'Mymensingh'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Sign Up',
          style: TextStyle(color: Get.theme.textTheme.bodyText1!.color),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Get.theme.primaryColor),
          onPressed: () => Get.back(),
        ),
      ),
      body:Obx(()
      {
        return  Form(
          key: controller.registrationFormKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Center(
                    child: Text(
                      "Complete Profile",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: primaryColor
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      "Complete your details",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 60),
                  TextFieldWidget(
                    labelText: "Name",
                    hintText: "Enter your full name",
                    keyboardType: TextInputType.name,
                    onChanged: (input) {
                      controller.userData.value.name=input;
                    },
                    validator: (input) {},
                    iconData: Icons.alternate_email,
                  ),
                  SizedBox(height: 15),
                  TextFieldWidget(
                    labelText: "Email",
                    hintText: "example@gmail.com",
                    onChanged: (input) {
                      controller.userData.value.email=input;
                    },
                    validator: (input) {},
                    iconData: Icons.alternate_email,
                  ),
                  SizedBox(height: 15),
                  TextFieldWidget(
                    labelText: "Phone",
                    hintText: "Enter your phone number",
                    keyboardType: TextInputType.phone,
                    onChanged: (input) {
                      controller.userData.value.phone=input;
                    },
                    validator: (input) {},
                    iconData: Icons.alternate_email,
                  ),
                  SizedBox(height: 15),
                  TextFieldWidget(
                    labelText: "Password",
                    hintText: "Enter your password",
                    onChanged: (input) {
                      controller.userData.value.password=input;
                    },
                    validator: (input) {},
                    obscureText: true,
                    iconData: Icons.lock_outline,
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      color: Get.theme.focusColor,
                      icon: Icon(Icons.visibility_outlined),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFieldWidget(
                    labelText: "Confirm Password",
                    hintText: "Retype your password",
                    validator: (input) {},
                    obscureText: true,
                    iconData: Icons.lock_outline,
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      color: Get.theme.focusColor,
                      icon: Icon(Icons.visibility_outlined),
                    ),
                  ),
                  SizedBox(height: 15),

                  DropdownSearch<String>(
                    mode: Mode.MENU,
                    dropdownSearchDecoration: InputDecoration(
                      labelText: 'Division',
                      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    showSelectedItems: true,
                    items: division.map((item) => item['title']!).toList(),
                    onChanged: (input) {
                      for (var item in division) {
                        if (item['title'] == input) {
                          controller.divisionId.value = item['id']!;
                        }
                      }
                      print('division: ${controller.divisionId.value}');
                      controller.getDistrict(controller.divisionId.value);
                    },
                    selectedItem: 'Select Division'.tr,
                    //   dropdownSearchDecoration: Ui.getInputDecoration(),
                  ),
                  SizedBox(height: 15),
                  DropdownSearch<String>(
                    mode: Mode.MENU,
                    dropdownSearchDecoration: InputDecoration(
                      labelText: 'District',
                      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    showSelectedItems: true,
                    items: controller.district.map((item) => item.title!).toList(),
                    onChanged: (input) {
                      for (var item in controller.district) {
                        if (item.title == input) {
                          controller.districtId.value = item.id!.toString();
                        }
                      }

                      controller.getUpazila(controller.districtId.value);
                    },
                    selectedItem: 'Select District'.tr,
                    //   dropdownSearchDecoration: Ui.getInputDecoration(),
                  ),
                  SizedBox(height: 15),
                  DropdownSearch<String>(
                    mode: Mode.MENU,
                    dropdownSearchDecoration: InputDecoration(
                      labelText: 'Upazila',
                      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    showSelectedItems: true,
                    items: controller.upazila.map((item) => item.title!).toList(),
                    onChanged: (input) {
                      for (var item in controller.upazila) {
                        if (item.title == input) {
                          controller.upazilaId.value = item.id!.toString();
                        }
                      }

                      controller.getUnion(controller.upazilaId.value);
                    },
                    selectedItem: 'Select Upazilla'.tr,
                    //   dropdownSearchDecoration: Ui.getInputDecoration(),
                  ),
                  SizedBox(height: 15),
                  DropdownSearch<String>(
                    mode: Mode.MENU,
                    dropdownSearchDecoration: InputDecoration(
                      labelText: 'Union',
                      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    showSelectedItems: true,
                    items: controller.union.map((item) => item.title!).toList(),
                    onChanged: (input) {
                      for (var item in controller.union) {
                        if (item.title == input) {
                          controller.unionId.value = item.id!.toString();
                        }
                      }
                    },
                    selectedItem: 'Select Union'.tr,
                    //   dropdownSearchDecoration: Ui.getInputDecoration(),
                  ),
                  SizedBox(height: 15),
                  TextFieldWidget(
                    labelText: "Full Address".tr,
                    hintText: "Enter your full address".tr,
                    //initialValue: controller.address.value,
                    onChanged: (input) {
                      controller.userData.value.address=input;
                    },
                    validator: (input) {},
                    suffixIcon: Icon(
                      CupertinoIcons.location_solid,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Shop Logo',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: _size.width*.5,
                    width: _size.width,
                    decoration: BoxDecoration(
                      //color: Colors.grey,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Obx(()
                    {
                      return Container(
                        height: _size.width*.5,
                        width: _size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Stack(
                          children: [
                            controller.selectedImagePath2.value.path.isNotEmpty?  ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image(
                                width:Get.size.width,
                                image: FileImage(controller.selectedImagePath2.value),
                                fit: BoxFit.fill,
                              ),
                            ):  ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image(
                                width:Get.size.width,
                                image: AssetImage('assets/images/shopping.png'),
                                fit: BoxFit.fill,
                                color: Colors.grey.shade300,
                              ),),

                            controller.selectedImagePath2.value.path.isEmpty?
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                  backgroundColor: Colors.blue.shade400,
                                  radius: 30,
                                  child: IconButton(
                                    onPressed: (){
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                            height: _size.width*.4,
                                            color: Colors.white,
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children:
                                                [
                                                  // ElevatedButton(
                                                  //   child: const Text('Open Camera'),
                                                  //   onPressed: () {
                                                  //     controller.getImage(ImageSource.camera).then((res)
                                                  //     {
                                                  //       controller.selectedImagePath2.value=res;
                                                  //       Get.back();
                                                  //     });
                                                  //   },
                                                  // ),
                                                  ElevatedButton(
                                                    child: const Text('From Gallery'),
                                                    onPressed: () {
                                                      controller.getImage(ImageSource.gallery).then((res)
                                                      {
                                                        controller.selectedImagePath2.value=res;
                                                        Get.back();
                                                      });

                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    icon: Icon(Icons.camera_alt_outlined,size: 30,color: Colors.white,),
                                  )
                              ),
                            ):Wrap(),
                          ],
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'NID Front',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: _size.width*.5,
                    width: _size.width,
                    decoration: BoxDecoration(
                      //color: Colors.grey,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Obx(()
                    {
                      return Container(
                        height: _size.width*.5,
                        width: _size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Stack(
                          children: [
                            controller.selectedImagePath.value.path.isNotEmpty?  ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image(
                                width:Get.size.width,
                                image: FileImage(controller.selectedImagePath.value),
                                fit: BoxFit.fill,
                              ),
                            ):  ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image(
                                width:Get.size.width,
                                image: AssetImage('assets/images/id.png'),
                                fit: BoxFit.fill,
                                color: Colors.grey.shade300,
                              ),),

                            controller.selectedImagePath.value.path.isEmpty?
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                  backgroundColor: Colors.blue.shade400,
                                  radius: 30,
                                  child: IconButton(
                                    onPressed: (){
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                            height: _size.width*.4,
                                            color: Colors.white,
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children:
                                                [
                                                  ElevatedButton(
                                                    child: const Text('Open Camera'),
                                                    onPressed: () {
                                                      controller.getImage(ImageSource.camera).then((res)
                                                      {
                                                        controller.selectedImagePath.value=res;
                                                        Get.back();
                                                      });
                                                    },
                                                  ),
                                                  ElevatedButton(
                                                    child: const Text('From Gallery'),
                                                    onPressed: () {
                                                      controller.getImage(ImageSource.gallery).then((res)
                                                      {
                                                        controller.selectedImagePath.value=res;
                                                        Get.back();
                                                      });

                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    icon: Icon(Icons.camera_alt_outlined,size: 30,color: Colors.white,),
                                  )
                              ),
                            ):Wrap(),
                          ],
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'NID Back',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: _size.width*.5,
                    width: _size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Obx((){
                      return Container(
                        height: _size.width*.5,
                        width: _size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Stack(
                          children: [
                            controller.selectedImagePath1.value.path.isNotEmpty? ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image(
                                width:Get.size.width,
                                image: FileImage(controller.selectedImagePath1.value),
                                fit: BoxFit.fill,
                              ),
                            ): ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image(
                                width:Get.size.width,
                                image: AssetImage('assets/images/id.png'),
                                fit: BoxFit.fill,
                                color: Colors.grey.shade300,
                              ),
                            ),
                            controller.selectedImagePath1.value.path.isEmpty? Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                  backgroundColor: Colors.blue.shade400,
                                  radius: 30,
                                  child: IconButton(
                                    onPressed: (){
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                            height: _size.width*.4,
                                            color: Colors.white,
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  ElevatedButton(
                                                    child: Text('Open Camera'),
                                                    onPressed: () {
                                                      controller.getImage(ImageSource.camera).then((res){
                                                        controller.selectedImagePath1.value=res;
                                                        Get.back();
                                                      }
                                                      );
                                                    },
                                                  ),
                                                  ElevatedButton(
                                                    child: Text('From Gallery'),
                                                    onPressed: () {
                                                      controller.getImage(ImageSource.gallery).then((res){
                                                        controller.selectedImagePath1.value=res;
                                                        Get.back();
                                                      }
                                                      );
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    icon: Icon(Icons.camera_alt_outlined,size: 30,color: Colors.white,),
                                  )
                              ),
                            ):Wrap(),
                          ],
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 40),
                  CommonWidgets.customButton(
                      text: "Register",
                      press: () {
                        controller.register();
                      },
                      color: secondaryColor),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.login),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 16, color: Get.theme.primaryColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      })
    );
  }
}
