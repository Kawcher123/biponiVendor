import 'package:biponi_vendor/app/modules/product_edit/controllers/product_edit_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class PriceEdit extends GetView<ProductEditController> {

  final _size= Get.size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Price',
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
            key: controller.priceEditFormKey,
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
                                  'Price',
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
                                  initialValue: controller.editProductData.value.product!.price,
                                  validator: (input) {
                                    return input == null || input.isEmpty? "The Field is Required": null ;
                                  },
                                  onSaved: (input){
                                    controller.editProductData.value.product!.price=input;
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
                                  'Special Price',
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
                                  initialValue: controller.editProductData.value.product!.specialPrice,
                                  onSaved: (input){
                                    controller.editProductData.value.product!.specialPrice=input;
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
                                  'Special Price Type',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 8,),
                                DropdownSearch<String>(
                                  // mode: Mode.MENU,
                                  // showFavoriteItems: true,
                                  items: [ 'Fixed','Percent'],
                                  selectedItem: controller.editProductData.value.product!.specialPriceType=='1'?'Fixed':'Percent',
                                  onSaved: (v){
                                      controller.specialPriceType.value = v == 'Fixed'?'1':'0';
                                    },
                                ),
                              ],
                            ),
                          ),

                          ///Special Price Start & End
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Special Price Start',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size(_size.width*.45, 50),
                                          primary: Colors.white,
                                        ),
                                        onPressed: (){
                                          controller.chooseDate();
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.calendar_today_sharp,color: Colors.blue,),
                                            SizedBox(width: 10,),
                                            Text(
                                              DateFormat("dd-MM-yyyy").format(controller.selectedStartDate.value).toString(),
                                              style: TextStyle(fontSize: 15,color: Colors.black),)
                                          ],
                                        )
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            fixedSize: Size(_size.width*.35, 50),
                                            primary: Colors.white
                                        ),
                                        onPressed: (){
                                          controller.chooseTime();
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.timer,color: Colors.blue,),
                                            SizedBox(width: 10,),
                                            Text(
                                              "${controller.selectedStartTime.value.hour}:${controller.selectedStartTime.value.minute}",
                                              style: TextStyle(fontSize: 15,color: Colors.black),
                                            ),
                                          ],
                                        )
                                    ),
                                  ],
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
                                  'Special Price End',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size(_size.width*.45, 50),
                                          primary: Colors.white,
                                        ),
                                        onPressed: (){
                                          controller.chooseDate();
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.calendar_today_sharp,color: Colors.blue,),
                                            SizedBox(width: 10,),
                                            Text(
                                              DateFormat("dd-MM-yyyy").format(controller.selectedEndDate.value).toString(),
                                              style: TextStyle(fontSize: 15,color: Colors.black),)
                                          ],
                                        )
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            fixedSize: Size(_size.width*.35, 50),
                                            primary: Colors.white
                                        ),
                                        onPressed: (){
                                          controller.chooseTime();
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.timer,color: Colors.blue,),
                                            SizedBox(width: 10,),
                                            Text(
                                              "${controller.selectedEndTime.value.hour}:${controller.selectedEndTime.value.minute}",
                                              style: TextStyle(fontSize: 15,color: Colors.black),
                                            ),
                                          ],
                                        )
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: CommonWidgets.customButton(
                          //       color: secondaryColor,
                          //       text: 'Confirm',
                          //       press: (){
                          //         if( controller.priceEditFormKey.currentState!.validate())
                          //         {
                          //           controller.priceEditFormKey.currentState!.save();
                          //           Get.back();
                          //         }
                          //       }
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      bottomNavigationBar: GestureDetector(
        onTap: (){
          if( controller.priceEditFormKey.currentState!.validate())
          {
            controller.priceEditFormKey.currentState!.save();
            Get.back();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: _size.width*.15,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20)
            ),
            alignment: Alignment.center,
            child: Text(
              'Confirm',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
