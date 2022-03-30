import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:biponi_vendor/app/modules/add_products/views/add_products_view.dart';
import 'package:biponi_vendor/app/providers/api_url.dart';
import 'package:biponi_vendor/app/routes/app_pages.dart';
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
      body: RefreshIndicator(
        onRefresh: ()async
        {
          controller.refreshProduct();
        },
        child: Obx((){
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
                          controller.productList.value.product![index].specialPrice!=null? Row(
                            children: [
                              Text('Special Price: '),
                              Text('${controller.productList.value.product![index].specialPrice}'),
                            ],
                          ): Wrap(),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                               print('prod id: ${controller.productList.value.product![index].id}');
                               Get.toNamed(Routes.PRODUCT_EDIT,arguments:controller.productList.value.product![index].id );

                            },
                            child: Icon(
                              Icons.edit_rounded,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(height: 7,),
                          // GestureDetector(
                          //   onTap: (){},
                          //   child: Icon(
                          //     Icons.delete,
                          //     color: Colors.red.shade500,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        }),
      )
    );
  }
}
