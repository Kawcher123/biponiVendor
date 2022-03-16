import 'package:biponi_vendor/app/modules/add_products/controllers/add_products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:image_picker/image_picker.dart';
class Images extends GetView<AddProductsController>{
  Images({Key? key}) : super(key: key);
  final _size = Get.size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Images',
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
      body: SingleChildScrollView(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Default Product Image',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.productGetImage(ImageSource.gallery).then((res)
                                  {
                                    controller.defaultImage.value=res;
                                  });

                                },
                                child: Container(
                                  height: _size.width*.1,
                                  width: _size.width*.25,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Text(
                                    'Select File',
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Container(
                            height: _size.width*.5,
                            width: _size.width,
                            decoration: BoxDecoration(
                              //color: Colors.grey,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Obx(()
                            {
                              return Container(
                                height: _size.width*.5,
                                width: _size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Stack(
                                  children: [
                                    controller.defaultImage.value.path.isNotEmpty?  ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image(
                                        width:Get.size.width,
                                        image: FileImage(controller.defaultImage.value),
                                        fit: BoxFit.fill,
                                      ),
                                    ):  ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image(
                                        width:Get.size.width,
                                        image: AssetImage('assets/images/mouse.jpeg'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                          SizedBox(height: 25,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Product Image Gallery',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.productGetImage(ImageSource.gallery).then((res)
                                  {
                                    controller.galleryImage.value=res;
                                  });

                                },
                                child: Container(
                                  height: _size.width*.1,
                                  width: _size.width*.25,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Text(
                                    'Select File',
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Container(
                            height: _size.width*.5,
                            width: _size.width,
                            decoration: BoxDecoration(
                              //color: Colors.grey,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Obx(()
                            {
                              return Container(
                                height: _size.width*.5,
                                width: _size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Stack(
                                  children: [
                                    controller.galleryImage.value.path.isNotEmpty?  ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image(
                                        width:Get.size.width,
                                        image: FileImage(controller.galleryImage.value),
                                        fit: BoxFit.fill,
                                      ),
                                    ):  ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image(
                                        width:Get.size.width,
                                        image: AssetImage('assets/images/mouse.jpeg'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
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
  }
}
