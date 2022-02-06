import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {

  final _size=Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
            'Notifications',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        leading:IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back,color: Colors.black,),
        ) ,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Your Activity',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(10, (index){
                    return Row(
                      children: [
                        Icon(Icons.notifications_none,
                          size: 60,color: Colors.blue,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Notification title',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                    ),
                              ),
                              Container(
                                width: _size.width*.7,
                                child: Text(
                                  'Order no. 233344445 has been success. Please wait for the product',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                'July 20, 2022(8.00PM)',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  }),
                ),
              )
            ],

          ),
        ),
      ),
    );
  }
}
