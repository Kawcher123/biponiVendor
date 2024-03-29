import 'package:biponi_vendor/app/commons/colors.dart';
import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:biponi_vendor/app/modules/add_products/controllers/add_products_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Inventory extends GetView<AddProductsController>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Inventory',
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
      body: Obx((){
        return Form(
          key: controller.inventoryFormKey,
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
                                'SKU',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8,),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                initialValue: controller.productData.value.sku,
                                validator: (input) {
                                  return input == null || input.isEmpty? "The Field is Required": null ;
                                },
                                onSaved: (input){
                                  controller.productData.value.sku=input;
                                },
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
                                'Inventory Management',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8,),
                              DropdownSearch<String>(
                                  // mode: Mode.MENU,
                                  // showFavoriteItems: true,
                                  items: [ 'Track Inventory',"Don't Track Inventory"],
                                  onChanged: (input){
                                    controller.inventoryManagement.value=input!;
                                  },
                                  selectedItem: 'Track Inventory'
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
                                'Quantity',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8,),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                validator: (input) {
                                  return input == null || input.isEmpty? "The Field is Required": null ;
                                },
                                initialValue: controller.productData.value.qty,
                                onSaved: (input){
                                  controller.productData.value.qty=input;
                                },
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
                                'Stock Availability',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8,),
                              DropdownSearch<String>(
                                  // mode: Mode.MENU,
                                  // showFavoriteItems: true,
                                  items: [ 'In Stock','Out of Stock',],
                                  onSaved: (input){
                                    controller.stockAvailability.value=input!;
                                  },
                                  selectedItem: controller.stockAvailability.value
                              ),
                            ],
                          ),
                        ),

                        //controller.inventoryManagement.value=='Track Inventory'? buildWidget() : Wrap(),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Maximum Cart Qty',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8,),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                initialValue: controller.productData.value.maxCartQty,
                                onSaved: (input){
                                  controller.productData.value.maxCartQty=input;
                                },
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
                                if( controller.inventoryFormKey.currentState!.validate())
                                {
                                  controller.inventoryFormKey.currentState!.save();
                                  Get.back();
                                }
                              }
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
  // buildWidget(){
  //   return Column(
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               'Quantity',
  //               style: TextStyle(
  //                 fontSize: 15,
  //                 color: Colors.black,
  //               ),
  //             ),
  //             SizedBox(height: 8,),
  //             TextFormField(
  //               keyboardType: TextInputType.text,
  //               decoration: InputDecoration(
  //                 border: OutlineInputBorder(),
  //               ),
  //               validator: (input) {
  //                 return input == null || input.isEmpty? "The Field is Required": null ;
  //               },
  //               initialValue: controller.productData.value.qty,
  //               onSaved: (input){
  //                 controller.productData.value.qty=input;
  //               },
  //             ),
  //           ],
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               'Stock Availability',
  //               style: TextStyle(
  //                 fontSize: 15,
  //                 color: Colors.black,
  //               ),
  //             ),
  //             SizedBox(height: 8,),
  //             DropdownSearch<String>(
  //                 mode: Mode.MENU,
  //                 showFavoriteItems: true,
  //                 items: [ 'In Stock','Out of Stock',],
  //                 onSaved: (input){
  //                   controller.stockAvailability.value=input!;
  //                 },
  //                 selectedItem: controller.stockAvailability.value
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
