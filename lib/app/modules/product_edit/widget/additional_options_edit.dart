import 'package:biponi_vendor/app/commons/colors.dart';
import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:biponi_vendor/app/modules/product_edit/controllers/product_edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AdditionalOptionsEdit extends GetView<ProductEditController> {

  final _size=Get.size;

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
            key: controller.additionalEditFormKey,
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
                                    fontWeight: FontWeight.bold
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
                                 Obx(()
                                 {
                                   return  Transform.scale(
                                     scale: 1.2,
                                     child: Switch.adaptive(
                                       inactiveTrackColor: Colors.grey,
                                       activeColor: Colors.greenAccent,
                                       value: controller.freeShippingStatus1.value,
                                       onChanged: (val){
                                         controller.freeShippingStatus1.value=val;
                                         controller.insideAllowFreeShipping.value=val==true?'on':'off';
                                         print( controller.insideAllowFreeShipping.value);
                                       },
                                     ),
                                   );
                                 }),
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
                                keyboardType: TextInputType.text,
                                validator: (input) {
                                  return input == null || input.isEmpty? "The Field is Required": null ;
                                },
                                initialValue: controller.editProductData.value.productShipping!.metaValues?.insideOrigin!.insideStandardShipping,
                                onSaved: (input){
                                  controller.editProductData.value.productShipping!.metaValues!.insideOrigin!.insideStandardShipping=input;
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
                                keyboardType: TextInputType.text,
                                validator: (input){},
                                initialValue: controller.editProductData.value.productShipping!.metaValues?.insideOrigin!.insideExpressShipping,
                                onSaved: (input){
                                  controller.editProductData.value.productShipping!.metaValues!.insideOrigin!.insideExpressShipping=input;
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
                                    fontWeight: FontWeight.bold
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
                                  Transform.scale(
                                    scale: 1.2,
                                    child: Switch.adaptive(
                                      inactiveTrackColor: Colors.grey,
                                      activeColor: Colors.greenAccent,
                                      value: controller.freeShippingStatus2.value,
                                      onChanged: (val){
                                        controller.freeShippingStatus2.value=val;
                                        controller.outsideAllowFreeShipping.value=val==true?'on':'off';
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15,),
                              Text(
                                'Standard Shipping Cost',
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
                                initialValue: controller.editProductData.value.productShipping!.metaValues?.outsideOrigin!.outsideStandardShipping,
                                onSaved: (input){
                                  controller.editProductData.value.productShipping!.metaValues!.outsideOrigin!.outsideStandardShipping=input;
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
                                keyboardType: TextInputType.text,
                                validator: (input){},
                                initialValue: controller.editProductData.value.productShipping!.metaValues?.outsideOrigin!.outsideExpressShipping,
                                onSaved: (input){
                                  controller.editProductData.value.productShipping!.metaValues!.outsideOrigin!.outsideExpressShipping=input;
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
                                  Transform.scale(
                                    scale: 1.2,
                                    child: Switch.adaptive(
                                      inactiveTrackColor: Colors.grey,
                                      activeColor: Colors.greenAccent,
                                      value: controller.codStatus.value,
                                      onChanged: (val){
                                        controller.codStatus.value=val;
                                        controller.cashOnDelivery.value=val==true?'on':'off';
                                      },
                                    ),
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
                                initialValue: controller.editProductData.value.productMiscellaneousInfo!.metaValues?.warrentyPeriod,
                                onSaved: (input){
                                  controller.editProductData.value.productMiscellaneousInfo!.metaValues!.warrentyPeriod=input;
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
                                  Transform.scale(
                                    scale: 1.2,
                                    child: Switch.adaptive(
                                      inactiveTrackColor: Colors.grey,
                                      activeColor: Colors.greenAccent,
                                      value: controller.comStatus.value,
                                      onChanged: (val){
                                        controller.comStatus.value=val;
                                        controller.changeOfMind.value=val==true?'on':'off';
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: CommonWidgets.customButton(
                    //       color: secondaryColor,
                    //       text: 'Confirm',
                    //       press: (){
                    //         if( controller.additionalEditFormKey.currentState!.validate())
                    //         {
                    //           controller.additionalEditFormKey.currentState!.save();
                    //           Get.back();
                    //         }
                    //       }
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
        }),
      bottomNavigationBar: GestureDetector(
        onTap: (){
          if( controller.additionalEditFormKey.currentState!.validate())
          {
            controller.additionalEditFormKey.currentState!.save();
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
