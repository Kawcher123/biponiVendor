import 'package:biponi_vendor/app/providers/api_url.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/order_details_controller.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {

  final _size=Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Order Details',
          style: TextStyle(
              color: Colors.blue
          ),
        ),
        leading:IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back,color: Colors.blue,),
        ) ,
        centerTitle: true,
      ),
      body: Obx(() {
        if(controller.orderDetailsLoaded.isTrue){
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      height: _size.width * 0.3,
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 250,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                alignment: Alignment.topRight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
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
                                          style: TextStyle(fontSize: 16,  fontWeight: FontWeight.bold,color: Colors.blue),
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          DateFormat.jm().format(DateTime.parse(controller.orderDetails.value.orders!.createdAt!)),
                                          style: TextStyle(fontSize: 16, color: Colors.blue),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      width: 165,
                                      height: 50,
                                      child: DropdownSearch<String>(
                                        mode: Mode.MENU,
                                        showFavoriteItems: true,
                                        items: [ 'Pending','Processing','On Hold','Failed','Canceled','Completed','Refunded'],
                                        onChanged:(v)
                                        {
                                          controller.product.value=v!;
                                        },
                                        selectedItem: controller.product.value,

                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        'Order No',
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
                Padding(
                  padding: const EdgeInsets.only(left:8.0,right: 8,bottom: 8),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: Container(

                      height: _size.width * 0.3,
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
                                  'Address',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  '${controller.orderDetails.value.address!.union!.title}, '
                                      '${controller.orderDetails.value.address!.upazila!.title}, '
                                      '${controller.orderDetails.value.address!.district!.title}, '
                                      '${controller.orderDetails.value.address!.division!.title}'
                                  ,
                                  maxLines: 2,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
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
                  padding: const EdgeInsets.only(left:8.0,right: 8,bottom: 8),
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
                                  '${controller.orderDetails.value.orders!.paymentMethod}',
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
                  padding: const EdgeInsets.only(left:8.0,right: 8,bottom: 8),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      height: _size.width * 0.5,
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 250,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                alignment: Alignment.centerLeft,
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
                                    Text(
                                      'Subtotal',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                      'Shipping Cost',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                      'Vat(+15%)',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                      'Coupon Discount',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text(
                                      'Total',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 250,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [

                                    SizedBox(height: 28,),
                                    Text(
                                      '${controller.orderDetails.value.orders!.paidAmount}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                      '${controller.orderDetails.value.orders!.shippingCost}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                      '0',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                      '${controller.orderDetails.value.orders!.couponAmount}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 10,),
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
                              ),
                            ),
                          ),
                        ],
                      ),

                    ),
                  ),
                ),

                SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  primary: false,
                  child: Column(
                    children: List.generate(controller.orderDetails.value.ordersDetails!.length, (index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          child: Container(
                            height: _size.width * 0.35,
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(

                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: CachedNetworkImage(
                                              imageUrl: ApiClient.imageHead+controller.orderDetails.value.ordersDetails![index].productDetails!.defaultImage!,
                                              progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                  Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                                              errorWidget: (context, url, error) => Icon(Icons.error),
                                            ),



                                          ),

                                        ],
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
                                          Text(
                                              '${controller.orderDetails.value.ordersDetails![index].productDetails!.title}',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              )),
                                          SizedBox(height: 4,),
                                          Text(
                                              'Quantity: ${controller.orderDetails.value.ordersDetails![index].productQty}',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                              )),
                                          SizedBox(height: 4,),
                                          Text(
                                              'Price: ${controller.orderDetails.value.ordersDetails![index].price}',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                              )),

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
                )
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }));
  }
}
