import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: Container(
                  height: _size.width * 0.26,
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
                                    '26 oct 2021,09.05 PM',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )),
                                SizedBox(height: 10,),
                                Container(
                                  //alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    color: Get.theme.primaryColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'Accepted',
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                                //Text(''),
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
                            //alignment: Alignment.centerRight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    'Order No',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(
                                    '#235',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
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
                              'Address',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              'House 15, Road 16, Sector 17, Uttara, Dhaka-1230',
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
                              'Cash on Delivery',
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
                                  'Delivery Charge(+15%)',
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
                                  'Coupon Discount(-5%)',
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
                                  '1050',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Text(
                                  '50',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Text(
                                  '10',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Text(
                                  '08',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  '2046',
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
                children: List.generate(5, (index){
                  return     Padding(
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
                                        child: const Image(image: AssetImage(
                                          'assets/images/mouse.jpeg',
                                        ),),
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
                                          'Product Name',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      SizedBox(height: 4,),
                                      Text(
                                          'Quantity: 1 Unit',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                          )),
                                      Text(
                                          'Price: 500',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                          )),
                                      Text(
                                          'Discount: 5%',
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
      )
    );
  }
}
