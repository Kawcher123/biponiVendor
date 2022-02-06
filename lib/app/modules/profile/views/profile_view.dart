import 'package:biponi_vendor/app/commons/colors.dart';
import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:biponi_vendor/app/commons/sub_head_widget.dart';
import 'package:biponi_vendor/app/commons/text_field_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.defaultAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SubHeadWidget(title: 'Personal Information'),
              SizedBox(height: CommonWidgets.size.width*0.05,),
              TextFieldWidget(
                labelText: "First Name",
                hintText: 'Muktadir',
                onSaved: (input) {},
                validator: (input) {},
                iconData: Icons.alternate_email,
              ),
              SizedBox(height: CommonWidgets.size.width*0.05,),
              TextFieldWidget(
                labelText: "Last Name",
                hintText: 'Sonyy',
                onSaved: (input) {},
                validator: (input) {},
                iconData: Icons.alternate_email,
              ),
              SizedBox(height: CommonWidgets.size.width*0.1,),
              SubHeadWidget(title: 'Personal Information'),
              SizedBox(height: CommonWidgets.size.width*0.03,),
              TextFieldWidget(
                labelText: "First Name",
                hintText: 'Muktadir',
                onSaved: (input) {},
                validator: (input) {},
                iconData: Icons.alternate_email,
              ),
              SizedBox(height: CommonWidgets.size.width*0.03,),
              TextFieldWidget(
                labelText: "Last Name",
                hintText: 'Sonyy',
                onSaved: (input) {},
                validator: (input) {},
                iconData: Icons.alternate_email,
              ),
              SizedBox(height: CommonWidgets.size.width*0.1,),
              CommonWidgets.customButton(
                color: secondaryColor,
                text: 'Logout'
              )
            ],
          ),
        ),
      )
    );
  }
}
