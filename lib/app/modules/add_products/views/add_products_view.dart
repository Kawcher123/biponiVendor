import 'package:biponi_vendor/app/modules/add_products/widget/category.dart';
import 'package:biponi_vendor/app/modules/add_products/widget/digital_product.dart';
import 'package:biponi_vendor/app/modules/add_products/widget/simple_product.dart';
import 'package:biponi_vendor/app/modules/add_products/widget/variable_product.dart';
import 'package:biponi_vendor/common/ui.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_products_controller.dart';

class AddProductsView extends GetView<AddProductsController> {

  final _size=Get.size;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Add Products',
          style: TextStyle(color: Get.theme.textTheme.bodyText1!.color),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 5, bottom: 5),
          child: Ui.getIconButton(
              svgSrc: 'assets/icons/arrow_back.svg',
              height: _size.width * .13,
              width: _size.width * .13,
              color: Colors.blue.withOpacity(0.15),
              svgColor: Get.theme.textTheme.bodyText1!.color,
              radius: 30,
              press: () {
                Get.back();
              }),
        ),
      ),
      body:Obx(()
      {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
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
                                  'Product type',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8,),
                                DropdownSearch<String>(
                                    mode: Mode.MENU,
                                    showFavoriteItems: true,
                                    items: [ 'Simple','Variable','Digital'],
                                    onChanged:(v) {

                                      controller.productType.value=v!;

                                      },
                                  selectedItem: controller.productType.value,
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
              GestureDetector(
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Category()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      height: _size.width*.15,
                      width: _size.width,
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Category',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              controller.productType.value=='Simple'?SimpleProduct()
              :controller.productType.value=='Variable'?VariableProduct():DigitalProduct(),

            ],
          ),
        );
      }),
      bottomNavigationBar: GestureDetector(
        onTap: (){
          controller.addProduct();
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: _size.width*.15,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20)
            ),
            alignment: Alignment.center,
            child: Text(
              'Create Product',
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
