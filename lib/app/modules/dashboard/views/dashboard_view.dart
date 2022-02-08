import 'package:biponi_vendor/app/commons/colors.dart';
import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:biponi_vendor/app/commons/sub_head_widget.dart';
import 'package:biponi_vendor/app/routes/app_pages.dart';
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
                    _horizontalListViewWidget(),
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
                                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                                              ),
                                              Text(
                                                DateFormat.y().format(DateTime.parse(controller.orderlist.value.orders![index].createdAt!)),
                                                style: TextStyle(fontSize: 16, color: Colors.white),
                                              ),
                                              Text(
                                                DateFormat.jm().format(DateTime.parse(controller.orderlist.value.orders![index].createdAt!)),
                                                style: TextStyle(fontSize: 16, color: Colors.white),
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
                                            Container(
                                                decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(5.0)),
                                                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                                                child: Text(
                                                  '${controller.orderlist.value.orders![index].status}',
                                                  style: TextStyle(color: backgroundColor),
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

  Widget _horizontalListViewWidget() {
    return Container(
      height: CommonWidgets.size.width * 0.25,
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _horizontalListWidget();
          }),
    );
  }

  Widget _horizontalListWidget() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        width: CommonWidgets.size.width * 0.22,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(''),
            Text(
              '48',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
