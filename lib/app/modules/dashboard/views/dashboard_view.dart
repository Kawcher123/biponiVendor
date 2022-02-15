import 'package:biponi_vendor/app/commons/colors.dart';
import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:biponi_vendor/app/commons/sub_head_widget.dart';
import 'package:biponi_vendor/app/routes/app_pages.dart';
import 'package:biponi_vendor/common/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidgets.defaultAppBar(context),
        body: Obx(() {
          if (controller.orderListLoaded.isTrue) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      height: CommonWidgets.size.width * 0.25,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              child: Container(
                                width: CommonWidgets.size.width * 0.42,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Total Revenue'),
                                    Text(
                                      controller.totalRevenue.value,
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              child: Container(
                                width: CommonWidgets.size.width * 0.42,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Total Orders'),
                                    Text(
                                      controller.totalOrders.value,
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              child: Container(
                                width: CommonWidgets.size.width * 0.42,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Total Products'),
                                    Text(
                                      controller.totalProducts.value,
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              child: Container(
                                width: CommonWidgets.size.width * 0.42,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Total Customer'),
                                    Text(
                                      controller.totalCustomers.value,
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: CommonWidgets.size.width * 0.03,
                    ),
                    SubHeadWidget(
                      title: 'Orders',
                      subTitle: 'See all',
                      onTap: () {
                        Get.toNamed(Routes.ORDER_LIST);
                      },
                    ),
                    Column(
                      children: List.generate(controller.orderlist.value.orders!.length, (index) {
                        return Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          child: Container(
                            height: CommonWidgets.size.width * 0.25,
                            padding: EdgeInsets.all(4.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.ORDER_DETAILS, arguments: controller.orderlist.value.orders![index].id);
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
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                                decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(5.0)),
                                                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                                                child: Text(
                                                  Helper.getStatus(controller.orderlist.value.orders![index].status.toString()),
                                                  style: TextStyle(fontSize: 12, color: backgroundColor),
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
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }));
  }
}
