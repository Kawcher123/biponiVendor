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
          key: controller.addProductFormKey,
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
                                validator: (input){},
                                onChanged: (input){
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
                                validator: (input){},
                                onChanged: (input){
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
                                'Short Description',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8,),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                validator: (input){},
                                onChanged: (input){
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
                                validator: (input){},
                                onChanged: (input){
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
                                  onChanged: (input){
                                    for (var item in controller.brand) {
                                      if (item.title == input) {
                                        controller.brandId.value = item.id!.toString();
                                        break;
                                      }
                                    }
                                    print(controller.brandId.value);
                                  },
                                  selectedItem: ""),
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Column (
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Text(
                        //         'Seller',
                        //         style: TextStyle(
                        //           fontSize: 15,
                        //           color: Colors.black,
                        //         ),
                        //       ),
                        //       SizedBox(height: 8,),
                        //       DropdownSearch<String>(
                        //           mode: Mode.MENU,
                        //           showFavoriteItems: true,
                        //           showSearchBox: true,
                        //           items: [ 'Agora','Yamaha', 'Apex','Ryans','Startech'],
                        //           popupItemDisabled: (String s) => s.startsWith('I'),
                        //           onChanged: (input){},
                        //           selectedItem: ""),
                        //
                        //     ],
                        //   ),
                        // ),
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
                              FlutterSwitch(
                                width: 90,
                                height: 40,
                                valueFontSize: 25.0,
                                toggleSize: 40.0,
                                value: controller.generalStatus.value,
                                borderRadius: 30.0,
                                padding: 8.0,
                                showOnOff: false,
                                activeColor: Colors.greenAccent,
                                onToggle: (val) {
                                  controller.generalStatus.value=val;
                                },
                              ),
                            ],
                          ),
                        ),
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

