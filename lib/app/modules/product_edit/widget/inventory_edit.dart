import 'package:biponi_vendor/app/commons/colors.dart';
import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:biponi_vendor/app/modules/product_edit/controllers/product_edit_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class InventoryEdit extends GetView<ProductEditController> {

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
            key: controller.inventoryEditFormKey,
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
                                  initialValue: controller.editProductData.value.product!.sku,
                                  validator: (input) {
                                    return input == null || input.isEmpty? "The Field is Required": null ;
                                  },
                                  onSaved: (input){
                                    controller.editProductData.value.product!.sku=input;
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
                                    mode: Mode.MENU,
                                    showFavoriteItems: true,
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
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (input) {
                                    return input == null || input.isEmpty? "The Field is Required": null ;
                                  },
                                  initialValue: controller.editProductData.value.product!.qty.toString(),
                                  onSaved: (input){
                                    controller.editProductData.value.product!.qty=input;
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
                                    mode: Mode.MENU,
                                    showFavoriteItems: true,
                                    items: [ 'In Stock','Out of Stock',],
                                    onSaved: (input){
                                      controller.stockAvailability.value=input=='In Stock'?'1':'0';
                                    },
                                    selectedItem: controller.editProductData.value.product!.inStock.toString()
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
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  initialValue: controller.editProductData.value.product!.maxCartQty.toString(),
                                  onSaved: (input){
                                    controller.editProductData.value.product!.maxCartQty=input;
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
                                  if( controller.inventoryEditFormKey.currentState!.validate())
                                  {
                                    controller.inventoryEditFormKey.currentState!.save();
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
  //               initialValue: controller.editProductData.value.product!.qty.toString(),
  //               onSaved: (input){
  //                 //controller.productData.value.qty=input;
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
  //       )
  //     ],
  //   );
  // }
}
