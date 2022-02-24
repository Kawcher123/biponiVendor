import 'package:biponi_vendor/app/modules/add_products/controllers/add_products_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class Specification extends GetView<AddProductsController>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Specification',
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
        ) ,
        centerTitle: true,
      ),
      body: Obx(()
      {
        return SingleChildScrollView(
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
                              'Attribute Set',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8,),
                            DropdownSearch<String>(
                              mode: Mode.MENU,
                              showFavoriteItems: true,
                              items: [ 'Motorcycle','Computer'],
                              onChanged: (v)
                              {
                                controller.specification.value=v!;
                              },
                              selectedItem: controller.specification.value,
                            ),
                          ],),
                        ),
                      controller.specification.value=='Motorcycle'? Motorcycle():Computer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
  Motorcycle(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Container(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Engine Capacity',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8,),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (input){},
                  ),

                ],
              ),
              SizedBox(height: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fuel Tank Capacity',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8,),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (input){},
                  ),

                ],
              ),
              SizedBox(height: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mileage',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8,),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (input){},
                  ),

                ],
              ),
              SizedBox(height: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Seat Height',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8,),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (input){},
                  ),

                ],
              ),
              SizedBox(height: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Transmission',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8,),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (input){},
                  ),

                ],
              ),

            ],
          ),

        ),

      ),
    );
  }

  Computer(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Container(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Additional Description',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8,),
                  TextField(
                    maxLines: 4,
                    minLines: null,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (input){},
                  ),

                ],
              ),
              SizedBox(height: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ram',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8,),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (input){},
                  ),

                ],
              ),

            ],
          ),

        ),

      ),
    );
  }
}
