import 'package:biponi_vendor/app/modules/add_products/controllers/add_products_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
class AdditionalOptions extends GetView<AddProductsController>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Shipping Options',
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
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Inside of my District',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                            Divider(),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Allow Free Shipping',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    //fontWeight: FontWeight.bold
                                  ),
                                ),
                                FlutterSwitch(
                                  width: 80,
                                  height: 40,
                                  valueFontSize: 20.0,
                                  toggleSize: 45.0,
                                  value: controller.freeShippingStatus1.value,
                                  borderRadius: 20.0,
                                  padding: 8.0,
                                  showOnOff: false,
                                  activeColor: Colors.greenAccent,
                                  onToggle: (val) {
                                    controller.freeShippingStatus1.value=val;
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 15,),
                            Text(
                              'Standard Shipping Cost',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 8,),
                            TextFormField(
                              //controller: _title,
                              keyboardType: TextInputType.text,
                              validator: (input){},
                              onChanged: (input){
                                controller.productData.value.shippingOptionInsideOriginInsideStandardShipping=input;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 15,),
                            Text(
                              'Express Shipping Cost',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 8,),
                            TextFormField(
                              //controller: _title,
                              keyboardType: TextInputType.text,
                              validator: (input){},
                              onChanged: (input){
                                controller.productData.value.shippingOptionInsideOriginInsideExpressShipping=input;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Outside of my District',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                            Divider(),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Allow Free Shipping',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    //fontWeight: FontWeight.bold
                                  ),
                                ),
                                FlutterSwitch(
                                  width: 80,
                                  height: 40,
                                  valueFontSize: 20.0,
                                  toggleSize: 45.0,
                                  value: controller.freeShippingStatus2.value,
                                  borderRadius: 20.0,
                                  padding: 8.0,
                                  showOnOff: false,
                                  activeColor: Colors.greenAccent,
                                  onToggle: (val) {
                                    controller.freeShippingStatus2.value=val;
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 15,),
                            Text(
                              'Standard Shipping Cost',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 8,),
                            TextFormField(
                              //controller: _title,
                              keyboardType: TextInputType.text,
                              validator: (input){},
                              onChanged: (input){
                                controller.productData.value.shippingOptionOutsideOriginOutsideStandardShipping=input;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 15,),
                            Text(
                              'Express Shipping Cost',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 8,),
                            TextFormField(
                              //controller: _title,
                              keyboardType: TextInputType.text,
                              validator: (input){},
                              onChanged: (input){
                                controller.productData.value.shippingOptionOutsideOriginOutsideExpressShipping=input;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Miscellaneous Information',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                            Divider(),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Allow Cash on Delivery',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    //fontWeight: FontWeight.bold
                                  ),
                                ),
                                FlutterSwitch(
                                  width: 80,
                                  height: 40,
                                  valueFontSize: 20.0,
                                  toggleSize: 45.0,
                                  value: controller.codStatus.value,
                                  borderRadius: 20.0,
                                  padding: 8.0,
                                  showOnOff: false,
                                  activeColor: Colors.greenAccent,
                                  onToggle: (val) {
                                    controller.codStatus.value=val;
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 15,),
                            Text(
                              'Warrenty Periods(Days)',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 8,),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              validator: (input){},
                              onChanged: (input){
                                controller.productData.value.miscellaneousInformationWarrentyPeriod=input;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Allow Change of Mind',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    //fontWeight: FontWeight.bold
                                  ),
                                ),
                                FlutterSwitch(
                                  width: 80,
                                  height: 40,
                                  valueFontSize: 20.0,
                                  toggleSize: 45.0,
                                  value: controller.comStatus.value,
                                  borderRadius: 20.0,
                                  padding: 8.0,
                                  showOnOff: false,
                                  activeColor: Colors.greenAccent,
                                  onToggle: (val) {
                                    controller.comStatus.value=val;
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      })
    );
  }
}
