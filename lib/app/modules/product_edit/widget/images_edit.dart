import 'package:biponi_vendor/app/modules/product_edit/controllers/product_edit_controller.dart';
import 'package:biponi_vendor/app/providers/api_url.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
class ImagesEdit extends GetView<ProductEditController> {

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
                                      child: CachedNetworkImage(
                                        width: _size.width,
                                        imageUrl: ApiClient.imageHead+controller.editProductData.value.product!.defaultImage!,
                                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                                            Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                                        errorWidget: (context, url, error) => Icon(Icons.error),
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
                                    controller.galleryImageList.add(res);
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
                                    controller.galleryImageList.isEmpty? 'Select File':'Select More',
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
                                child: controller.galleryImageList.isNotEmpty?  SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List.generate(controller.galleryImageList.length, (index)
                                    {
                                      return Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image(
                                            width:Get.size.width*.5,
                                            image: FileImage(controller.galleryImageList[index]),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ):
                                  ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    width: _size.width,
                                    imageUrl: ApiClient.imageHead+controller.editProductData.value.product!.galleryImages!,
                                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                                        Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                    fit: BoxFit.fill,
                                  ),
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
