import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:biponi_vendor/app/providers/api_url.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ProductsController());
    return Scaffold(
      appBar: CommonWidgets.defaultAppBar(context),
      body: Obx((){
        if(controller.productListLoaded.isTrue){
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: controller.productList.value.product!.length,
              itemBuilder: (context, index){
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: ListTile(
                    leading: Container(
                      width: Get.size.width*.2,
                      height: Get.size.width*.2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: ApiClient.imageHead+controller.productList.value.product![index].defaultImage!,
                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                              Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    title: Text('${controller.productList.value.product![index].title}'),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Text('Product Type: '),
                            Text('${controller.productList.value.product![index].productType}'),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Price: '),
                            Text('${controller.productList.value.product![index].price}'),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Special Price: '),
                            Text('${controller.productList.value.product![index].specialPrice}'),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              shrinkWrap: true,),
          );
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      })
    );
  }

  // Widget _productWidget() {
  //   return Card(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10.0)
  //     ),
  //     child: ListTile(
  //       leading: Image.asset('assets/images/mouse.jpeg'),
  //       title: Text('${controller.productList.value.product!.i}'),
  //       subtitle: Column(
  //         children: [
  //           Row(
  //             children: [
  //               Text('Product Type: '),
  //               Text('Simple'),
  //             ],
  //           ),
  //           Row(
  //             children: [
  //               Text('Price: '),
  //               Text('500 BDT'),
  //             ],
  //           ),
  //           Row(
  //             children: [
  //               Text('Special Price: '),
  //               Text('450 BDT'),
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
