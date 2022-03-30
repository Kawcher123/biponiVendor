import 'package:biponi_vendor/app/commons/colors.dart';
import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:biponi_vendor/app/modules/add_products/controllers/add_products_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
class General extends GetView<AddProductsController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'General',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading:IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back,color: Colors.black,),
        ),
        centerTitle: true,
      ),
      body: Obx((){
        return Form(
          key: controller.generalFormKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column (
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Title',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8,),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                validator: (input) {
                                  return input == null || input.isEmpty? "The Field is Required": null ;
                                },
                                initialValue: controller.productData.value.title,
                                onSaved: (input){
                                  controller.productData.value.title=input;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Weight',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8,),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                validator: (input) {
                                  return input == null || input.isEmpty? "The Field is Required": null ;
                                },
                                initialValue: controller.productData.value.weight,
                                onSaved: (input){
                                  controller.productData.value.weight=input;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Weight Unit',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8,),
                              DropdownSearch<String>(
                                  mode: Mode.MENU,
                                  showFavoriteItems: true,
                                  validator: (input) {
                                    return input == null || input.isEmpty? "The Field is Required": null ;
                                  },
                                  items: [ 'Gram','Kilogram','Milliliter','Litre'],
                                  onSaved: (v){
                                    controller.weightUnit.value = v!;
                                  },
                                  selectedItem: controller.weightUnit.value
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Short Description',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8,),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                validator: (input) {
                                  return input == null || input.isEmpty? "The Field is Required": null ;
                                },
                                initialValue: controller.productData.value.shortDescription,
                                onSaved: (input){
                                  controller.productData.value.shortDescription=input;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),


                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Description',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8,),
                              TextFormField(
                                //maxLength: 3,
                                maxLines: 3,
                                keyboardType: TextInputType.text,
                                initialValue: controller.productData.value.description,
                                onSaved: (input){
                                  controller.productData.value.description=input;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Brand',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8,),
                              DropdownSearch<String>(
                                  mode: Mode.MENU,
                                  showFavoriteItems: true,
                                  showSearchBox: true,
                                  items: controller.brand.map((item) => item.title!).toList(),
                                  onSaved: (input){
                                    for(var item in controller.brand) {
                                      if (item.title == input) {
                                        controller.brandId.value = item.id!.toString();
                                        controller.brandName.value = item.title!.toString();
                                        break;
                                      }
                                    }
                                    print(controller.brandId.value);
                                    print(controller.brandName.value);
                                  },
                                  selectedItem: controller.brandName.value),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Status',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              Transform.scale(
                                scale: 1.2,
                                child: Switch.adaptive(
                                  inactiveTrackColor: Colors.grey,
                                  activeColor: Colors.greenAccent,
                                  value: controller.generalStatus.value,
                                  onChanged: (val){
                                    controller.generalStatus.value=val;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CommonWidgets.customButton(
                              color: secondaryColor,
                              text: 'Confirm',
                              press: (){
                               if( controller.generalFormKey.currentState!.validate())
                                    {
                                      controller.generalFormKey.currentState!.save();
                                      Get.back();
                                    }
                              }
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      })
    );
  }
}

