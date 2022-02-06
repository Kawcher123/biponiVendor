import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/customer_list_controller.dart';

class CustomerListView extends GetView<CustomerListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Customer List',
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
        child: Column(
          children:List.generate(10, (index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: Container(

                  height: CommonWidgets.size.width * 0.28,
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 270,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'John Doe',
                                    style: TextStyle(
                                      fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    'Customer ID #555',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color:Colors.black),
                                  ),
                                  Text(
                                    'john.doe@gmail.com',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    '480 555 666',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color:Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          )),

                      Expanded(
                          flex: 250,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 27,),
                                Text('Male '),
                                Text('55, Address Here,'),
                                Text('Singapore 2222'),
                              ],
                            ),
                          )),

                      Expanded(
                          flex: 150,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        color: Get.theme.primaryColor,
                                        shape: BoxShape.circle,),

                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '1',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                ),
                                Text(
                                  '4,500',
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),

                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            );
          })
        ),
      )
    );
  }
}
