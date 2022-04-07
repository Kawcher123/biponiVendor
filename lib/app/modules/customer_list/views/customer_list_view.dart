import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:biponi_vendor/common/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/customer_list_controller.dart';

class CustomerListView extends GetView<CustomerListController> {

  final Size _size = Get.size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Customer List',
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
      body: RefreshIndicator(
        onRefresh: ()async{
          controller.refreshCustomerList();
        },
        child: Obx((){
          if(controller.customerListLoaded.isTrue){
            return SingleChildScrollView(
              child: Column(
                  children:List.generate(controller.customerList.value.vendorCustomer!.length, (index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        child: Container(

                          height: CommonWidgets.size.width * 0.35,
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 300,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${controller.customerList.value.vendorCustomer![index].name}',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        SizedBox(height: 5,),
                                        Text(
                                          'Customer ID #${controller.customerList.value.vendorCustomer![index].id}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color:Colors.black),
                                        ),
                                        Text(
                                          'Email: ${controller.customerList.value.vendorCustomer![index].email}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'Phone: ${controller.customerList.value.vendorCustomer![index].phone}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color:Colors.black),
                                        ),
                                        Text(
                                          'Address: ${controller.customerList.value.vendorCustomer![index].address!.shippingAddress}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              // fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  )),

                              Expanded(
                                  flex: 200,
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      //crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            // decoration: BoxDecoration(
                                            //   borderRadius: BorderRadius.circular(5),
                                            //   color: Get.theme.primaryColor,
                                            //   shape: BoxShape.rectangle,),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Total Orders',
                                                    style: TextStyle(color: Colors.black,fontSize: 15),
                                                  ),
                                                  Text(
                                                    '#${controller.customerList.value.vendorCustomer![index].totalOrders}',
                                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                            )
                                        ),
                                        //SizedBox(height: 5,),
                                        Text(
                                          '${controller.customerList.value.vendorCustomer![index].totalOrderAmount} BDT',
                                          style: TextStyle(
                                              fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
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
            );
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        }),
      )
    );
  }
}
