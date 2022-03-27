import 'package:biponi_vendor/app/commons/colors.dart';
import 'package:biponi_vendor/app/providers/api_url.dart';
import 'package:biponi_vendor/common/helper.dart';
import 'package:biponi_vendor/common/ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/order_details_controller.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Order Details',
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
        body: Obx(() {
          if (controller.orderDetailsLoaded.isTrue) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      child: Container(
                        height: _size.width * 0.25,
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 230,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        DateFormat.MMMd().format(DateTime.parse(controller.orderDetails.value.orders!.createdAt!)),
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                                      ),
                                      Text(
                                        ',',
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                                      ),
                                      //SizedBox(width: 10,),
                                      Text(
                                        DateFormat.y().format(DateTime.parse(controller.orderDetails.value.orders!.createdAt!)),
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        DateFormat.jm().format(DateTime.parse(controller.orderDetails.value.orders!.createdAt!)),
                                        style: TextStyle(fontSize: 16, color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 120,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Order No',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text(
                                        '#${controller.orderDetails.value.orders!.id}',
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      ),

                                      //Text(''),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(controller.orderStatus.length, (index){
                        return GestureDetector(
                         onTap: ()
                          {
                            controller.selectedStatusForProduct.value=controller.orderStatus[index]['id']!;
                            controller.orderDetailsPerStatus.value=controller.orderDetails.value.ordersDetails!.where((element) => element.status==controller.selectedStatusForProduct.value).toList();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: _size.width*.13,
                              width: _size.width*.4,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color:controller.selectedStatusForProduct.value==controller.orderStatus[index]['id']!? primaryColor:Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '${controller.orderStatus[index]['status']}',
                                style: TextStyle(
                                  color:controller.selectedStatusForProduct.value==controller.orderStatus[index]['id']!? backgroundColor:Colors.black,
                                  fontSize: 16
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    primary: false,
                    child: Column(
                      children: List.generate(controller.orderDetailsPerStatus.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            child: Container(
                              height: _size.width * 0.55,
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 90,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        //color: Colors.blue,
                                        alignment: Alignment.centerLeft,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: CachedNetworkImage(
                                            imageUrl: ApiClient.imageHead + controller.orderDetailsPerStatus[index].productDetails!.defaultImage!,
                                            progressIndicatorBuilder: (context, url, downloadProgress) => Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                            //fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 200,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('${controller.orderDetailsPerStatus[index].productDetails!.title}',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            SizedBox(height: 4,),
                                            Text('Quantity: ${controller.orderDetailsPerStatus[index].productQty}',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                )),
                                            SizedBox(height: 4,),
                                            Text('Price: ${controller.orderDetailsPerStatus[index].price}',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                )),
                                            SizedBox(height: 4,),
                                            Text('Shipping Cost: ${controller.orderDetailsPerStatus[index].shippingCost}',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                )),
                                            SizedBox(height: 4,),
                                            Text('Shipping Method: ${controller.orderDetailsPerStatus[index].shippingMethod!.replaceAll('_', ' ')}',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                )),
                                            SizedBox(height: 10,),
                                            Container(
                                              width: 165,
                                              height: 50,
                                              child: DropdownSearch<String>(
                                                mode: Mode.MENU,
                                                showFavoriteItems: true,
                                                items: controller.orderStatus.map((item) => item['status']!).toList(),
                                                onChanged: (input) {
                                                  for (var item in controller.orderStatus) {
                                                    if (item['status'] == input) {
                                                      controller.selectedStatus.value = item;
                                                    }
                                                  }
                                                  controller.updateOrder(controller.orderDetailsPerStatus[index].id!.toString());
                                                  controller.getOrderDetails();
                                                  controller.selectedStatusForProduct.value=controller.selectedStatus['id'];

                                                 print(controller.selectedStatusForProduct.value);
                                                },
                                                selectedItem: Helper.getStatus(controller.orderDetailsPerStatus[index].status.toString()),
                                              ),
                                            ),
                                            //Text(''),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      child: Container(
                        height: _size.width * 0.25,
                        width: _size.width,
                        padding: EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Address',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Expanded(
                                child: Text(
                                  '${controller.orderDetails.value.address!.union!.title}, '
                                  '${controller.orderDetails.value.address!.upazila!.title}, '
                                  '${controller.orderDetails.value.address!.district!.title}, '
                                  '${controller.orderDetails.value.address!.division!.title}',
                                  maxLines: 3,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      child: Container(
                        height: _size.width * 0.2,
                        padding: EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Payment Method',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    '${controller.orderDetails.value.orders!.paymentMethod!.replaceAll('_', ' ')}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      child: Container(
                        //height: _size.width * 0.3,
                        padding: EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Payment',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Subtotal',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    '${controller.orderDetails.value.orders!.paidAmount}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${controller.orderDetails.value.orders!.paidAmount}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }));
  }
}
