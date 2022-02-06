import 'package:biponi_vendor/app/commons/colors.dart';
import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:biponi_vendor/app/commons/sub_head_widget.dart';
import 'package:biponi_vendor/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidgets.defaultAppBar(context),
        body: SingleChildScrollView(
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
                  onTap: ()
                  {
                    Get.toNamed(Routes.ORDER_LIST);
                  },
                ),
                _verticalListViewWidget(),
              ],
            ),
          ),
        ));
  }

  Widget _horizontalListViewWidget() {
    return Container(
      height: CommonWidgets.size.width * 0.25,
      child: ListView.builder(
          itemCount: 8,
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
            Text('Orders'),
            Text(
              '48',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            )
          ],
        ),
      ),
    );
  }

  Widget _verticalListViewWidget() {
    return ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        primary: false,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: ()
              {
                Get.toNamed(Routes.ORDER_DETAILS);
              },

              child: _orderWidget());
        });
  }

  Widget _orderWidget() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        height: CommonWidgets.size.width * 0.22,
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 150,
                child: Card(
                  color: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '26 Oct',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: backgroundColor),
                        ),
                        Text(
                          '2021',
                          style: TextStyle(color: backgroundColor),
                        ),
                        Text(
                          '09:05 PM',
                          style: TextStyle(color: backgroundColor),
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
                flex: 350,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Total Earning: '),
                          Text('4500 BDT'),
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
                          Text('5690 BDT'),
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
                flex: 150,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Order No'),
                      Text(
                        '#235',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(5.0)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 2.0),
                          child: Text(
                            'Pending',
                            style: TextStyle(color: backgroundColor),
                          ))
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
