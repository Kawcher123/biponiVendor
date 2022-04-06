import 'package:biponi_vendor/app/modules/product_edit/controllers/product_edit_controller.dart';
import 'package:biponi_vendor/app/providers/api_url.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CategoryEdit extends GetView<ProductEditController> {

  final _size = Get.size;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Category',
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
          if(controller.categoryListLoaded.isTrue)
          {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Card(
                      child: Container(
                        height: _size.width*.25,
                        width: _size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: _size.width*.18,
                                width: _size.width*.18,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    imageUrl: ApiClient.imageHead+controller.editProductData.value.product!.categoryImage!,
                                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                                        Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${controller.editProductData.value.product!.categoryTitle}',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),),
                                  SizedBox(height: 15,),
                                  Row(
                                    children: [
                                      Container(
                                        height: _size.width*.1,
                                        width: _size.width*.32,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          //color: controller.categoryId.value==controller.categoryList[index].id!.toString()? Colors.blue.shade600:Colors.grey,
                                            borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          //controller.categoryId.value==controller.categoryList[index].id!.toString()?
                                          'Selected',
                                          // : 'Select',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(controller.categoryList.length, (index){
                        return Card(
                          child: Container(
                            height: _size.width*.25,
                            width: _size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: _size.width*.18,
                                    width: _size.width*.18,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: CachedNetworkImage(
                                        imageUrl: ApiClient.imageHead+controller.categoryList[index].image!,
                                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                                            Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                                        errorWidget: (context, url, error) => Icon(Icons.error),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.categoryList[index].title}',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),),
                                      SizedBox(height: 15,),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              controller.categoryId.value=controller.categoryList[index].id!.toString();
                                              controller.categoryTitle.value=controller.categoryList[index].title!;
                                            },
                                            child: Container(
                                              height: _size.width*.1,
                                              width: _size.width*.32,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: controller.categoryId.value==controller.categoryList[index].id!.toString()? Colors.blue.shade600:Colors.grey,
                                                  borderRadius: BorderRadius.circular(5)
                                              ),
                                              child: Text(
                                                controller.categoryId.value==controller.categoryList[index].id!.toString()? 'Selected': 'Select',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          GestureDetector(
                                            onTap: (){
                                              controller.subCategoryList(controller.categoryList[index].id!.toString());
                                            },
                                            child: Container(
                                              height: _size.width*.1,
                                              width: _size.width*.32,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade300,
                                                  borderRadius: BorderRadius.circular(5)
                                              ),
                                              child: Text(
                                                'Sub Category',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          }
          else
          {
            return Center(child: CircularProgressIndicator());
          }
        })
    );
  }
}
