import 'package:biponi_vendor/app/commons/colors.dart';
import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:biponi_vendor/app/routes/app_pages.dart';
import 'package:biponi_vendor/common/helper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/order_list_controller.dart';

class OrderListView extends GetView<OrderListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Order List',
          style: TextStyle(
            color: Colors.blue
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back,color: Colors.blue,),
        ),
        centerTitle: true,
      ),

      body: Obx((){
        if(controller.orderListLoaded.isTrue){
          return SingleChildScrollView(

            child: Column(
              children: List.generate(controller.orderlist.value.orders!.length, (index){
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                    height: CommonWidgets.size.width * 0.22,
                    padding: EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: ()
                      {
                        Get.toNamed(Routes.ORDER_DETAILS,arguments: controller.orderlist.value.orders![index].id);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 145,
                              child: Card(
                                color: primaryColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        DateFormat.MMMd().format(DateTime.parse(controller.orderlist.value.orders![index].createdAt!)),
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                      ),
                                      Text(
                                        DateFormat.y().format(DateTime.parse(controller.orderlist.value.orders![index].createdAt!)),
                                        style: TextStyle(fontSize: 16, color: Colors.white),
                                      ),
                                      Text(
                                        DateFormat.jm().format(DateTime.parse(controller.orderlist.value.orders![index].createdAt!)),
                                        style: TextStyle(fontSize: 14, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.grey,
                                height: CommonWidgets.size.width * 0.15,
                              )),
                          Expanded(
                              flex: 400,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Total Earning: '),
                                        Text('${controller.orderlist.value.orders![index].paidAmount} BDT'),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Commission: '),
                                        Text('1500 BDT'),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Total: '),
                                        Text('${controller.orderlist.value.orders![index].paidAmount} BDT'),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.grey,
                                height: CommonWidgets.size.width * 0.15,
                              )),
                          Expanded(
                              flex: 130,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Order No'),
                                    Text(
                                      '#${controller.orderlist.value.orders![index].id}',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5,),
                                    Container(
                                        decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(5.0)),
                                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                                        child: Text(
                                          Helper.getStatus(controller.orderlist.value.orders![index].status.toString()),
                                          style: TextStyle(fontSize: 12,color: backgroundColor),
                                        ))
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      })
    );
  }
}
