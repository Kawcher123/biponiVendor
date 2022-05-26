import 'package:biponi_vendor/app/modules/product_edit/controllers/product_edit_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class GeneralEdit extends GetView<ProductEditController> {

  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'General',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading:IconButton(
            onPressed: (){
              Get.back();
            },
            icon: Icon(Icons.arrow_back,color: Colors.black,),
          ),
          centerTitle: true,
        ),
        body: Obx((){
          return Form(
            key: controller.generalEditFormKey,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column (
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Title',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 8,),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  validator: (input) {
                                    return input == null || input.isEmpty? "The Field is Required": null ;
                                  },
                                  initialValue: controller.editProductData.value.product!.title,
                                  onSaved: (input){
                                    controller.editProductData.value.product!.title=input;
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Weight',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 8,),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  validator: (input) {
                                    return input == null || input.isEmpty? "The Field is Required": null ;
                                  },
                                  initialValue: controller.editProductData.value.product!.weight.toString(),
                                  onSaved: (input){
                                    controller.editProductData.value.product!.weight=input;
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Weight Unit',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 8,),
                                DropdownSearch<String>(
                                    // mode: Mode.MENU,
                                    // showFavoriteItems: true,
                                    validator: (input) {
                                      return input == null || input.isEmpty? "The Field is Required": null ;
                                    },
                                    items: [ 'gram','Gram','kg','Kilogram','ml','Millilitre','l','Litre'],
                                    onSaved: (v){
                                      controller.weightUnit.value = v!;
                                    },
                                    selectedItem: controller.editProductData.value.product!.weightUnit,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Short Description',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 8,),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  validator: (input) {
                                    return input == null || input.isEmpty? "The Field is Required": null ;
                                  },
                                  initialValue: controller.editProductData.value.product!.shortDescription,
                                  onSaved: (input){
                                    controller.editProductData.value.product!.shortDescription=input;
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),


                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Description',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 8,),

                                TextFormField(
                                  maxLines: 3,
                                  keyboardType: TextInputType.text,
                                  initialValue: controller.editProductData.value.product!.description,
                                  onSaved: (input){
                                    controller.editProductData.value.product!.description=input;
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Brand',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 8,),
                                DropdownSearch<String>(
                                  // mode: Mode.MENU,
                                  // showFavoriteItems: true,
                                  // showSearchBox: true,
                                  validator: (input) {
                                    return input == null || input.isEmpty? "The Field is Required": null ;
                                  },
                                  items: controller.brand.map((item) => item.title!).toList(),
                                  onSaved: (input){
                                    for(var item in controller.brand) {
                                      if (item.title == input) {
                                        controller.brandId.value = item.id!.toString();
                                        controller.brandName.value = item.title!.toString();
                                        break;
                                      }
                                    }
                                    print(controller.brandId.value);
                                    print(controller.brandName.value);
                                    },
                                  selectedItem: controller.editProductData.value.product!.brandTitle,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Status',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                Transform.scale(
                                  scale: 1.2,
                                  child: Switch.adaptive(
                                    inactiveTrackColor: Colors.grey,
                                    activeColor: Colors.greenAccent,
                                    value: controller.generalStatus.value,
                                    onChanged: (val){
                                      controller.generalStatus.value=val;
                                      controller.statusActive.value=val==true?'1':'0';
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      bottomNavigationBar: GestureDetector(
        onTap: (){
          if( controller.generalEditFormKey.currentState!.validate())
          {
            controller.generalEditFormKey.currentState!.save();
            Get.back();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: _size.width*.15,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20)
            ),
            alignment: Alignment.center,
            child: Text(
              'Confirm',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
