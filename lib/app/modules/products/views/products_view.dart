import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.defaultAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemBuilder: (context, index){
            return _productWidget();
          },
        itemCount: 10,
        shrinkWrap: true,),
      )
    );
  }

  Widget _productWidget() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: ListTile(
        leading: Image.asset('assets/images/mouse.jpeg'),
        title: Text('Product Name'),
        subtitle: Column(
          children: [
            Row(
              children: [
                Text('Product Type: '),
                Text('Simple'),
              ],
            ),
            Row(
              children: [
                Text('Price: '),
                Text('500 BDT'),
              ],
            ),
            Row(
              children: [
                Text('Special Price: '),
                Text('450 BDT'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
