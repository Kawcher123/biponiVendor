import 'package:biponi_vendor/app/commons/colors.dart';
import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:biponi_vendor/app/modules/product_edit/controllers/product_edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SeoEdit extends GetView<ProductEditController> {

  final _size=Get.size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Seo',
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
          key: controller.seoEditFormKey,
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
                                'Slug',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8,),
                              TextFormField(
                                keyboardType: TextInputType.none,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                initialValue: controller.editProductData.value.product!.slug,
                                onChanged: (input){
                                  controller.editProductData.value.product!.slug=input;
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
                                'Meta Title',
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
                                initialValue: '',
                                onChanged: (input){
                                  //controller.productData.value.metaTitle=input;
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
                                'Meta Keyword',
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
                                //initialValue: controller.productData.value.metaKeyword,
                                onChanged: (input){
                                  //controller.productData.value.metaKeyword=input;
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
                                'Meta Description',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8,),
                              TextFormField(
                                minLines: 4,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                //initialValue: controller.productData.value.metaDescription,
                                onChanged: (input){
                                  //controller.productData.value.metaDescription=input;
                                },
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
                        //         if( controller.seoEditFormKey.currentState!.validate())
                        //         {
                        //           controller.seoEditFormKey.currentState!.save();
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
          if( controller.seoEditFormKey.currentState!.validate())
          {
            controller.seoEditFormKey.currentState!.save();
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
