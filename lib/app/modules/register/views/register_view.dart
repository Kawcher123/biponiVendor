import 'dart:io';
import 'package:biponi_vendor/app/commons/colors.dart';
import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:biponi_vendor/app/commons/text_field_widget.dart';
import 'package:biponi_vendor/app/routes/app_pages.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final _size = Get.size;
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
      body: Form(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Text(
                  "Complete Profile",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: primaryColor
                  ),
                ),
                Text(
                  "Complete your details",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 60),
                TextFieldWidget(
                  labelText: "Name",
                  hintText: "Enter your full name",
                  onSaved: (input) {},
                  validator: (input) {},
                  iconData: Icons.alternate_email,
                ),
                SizedBox(height: 15),
                TextFieldWidget(
                  labelText: "Email",
                  hintText: "example@gmail.com",
                  onSaved: (input) {},
                  validator: (input) {},
                  iconData: Icons.alternate_email,
                ),
                SizedBox(height: 15),
                TextFieldWidget(
                  labelText: "Phone",
                  hintText: "Enter your phone number",
                  onSaved: (input) {},
                  validator: (input) {},
                  iconData: Icons.alternate_email,
                ),
                SizedBox(height: 15),
                TextFieldWidget(
                  labelText: "Password",
                  hintText: "Enter your password",
                  onSaved: (input) {},
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
                  onSaved: (input) {},
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
                  label: "Division",
                  mode: Mode.MENU,
                  showFavoriteItems: true,
                  items: [ 'Dhaka','Chittagong','Rajshahi'],
                  onChanged: (v){},
                  selectedItem: "",
                ),
                SizedBox(height: 15),
                DropdownSearch<String>(
                  label: "District",
                  mode: Mode.MENU,
                  showFavoriteItems: true,
                  items: [ 'Dhaka','Chittagong','Rajshahi'],
                  onChanged: (v){},
                  selectedItem: "",
                ),
                SizedBox(height: 15),
                DropdownSearch<String>(
                  label: "Upazila",
                  mode: Mode.MENU,
                  showFavoriteItems: true,
                  items: [ 'Dhaka','Chittagong','Rajshahi'],
                  onChanged: (v){},
                  selectedItem: "",
                ),
                SizedBox(height: 15),
                DropdownSearch<String>(
                  label: 'Union',
                  mode: Mode.BOTTOM_SHEET ,
                  showFavoriteItems: true,
                  items: [ 'Dhaka','Chittagong','Rajshahi'],
                  onChanged: (v){},
                  selectedItem: "",
                ),
                SizedBox(height: 15),
                Text(
                  'Scan the front side of NID card with camera',
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
                        ),
                          ),
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
                                                    });
                                                  },
                                                ),
                                                ElevatedButton(
                                                  child: const Text('From Gallery'),
                                                  onPressed: () {
                                                     controller.getImage(ImageSource.gallery).then((res)
                                                    {
                                                      controller.selectedImagePath.value=res;
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
                  'Scan the back side of NID card with camera',
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
                                                    }
                                                    );
                                                  },
                                                ),
                                                ElevatedButton(
                                                  child: Text('From Gallery'),
                                                  onPressed: () {
                                                    controller.getImage(ImageSource.gallery).then((res){
                                                      controller.selectedImagePath1.value=res;
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
                      Get.offNamed(Routes.root);
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
      ),
    );
  }
}
