import 'package:biponi_vendor/app/commons/colors.dart';
import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:biponi_vendor/app/modules/add_products/controllers/add_products_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Specification extends GetView<AddProductsController>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Specification',
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
        ) ,
        centerTitle: true,
      ),
      body: Obx(()
      {
        return Form(
          key: controller.specificationFormKey,
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
                                'Attribute Set',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8,),
                              DropdownSearch<String>(
                                mode: Mode.MENU,
                                showFavoriteItems: true,
                                items: controller.attributeList.map((item) => item.title!).toList(),
                                onChanged: (input){
                                  for(var item in controller.attributeList){
                                    if(item.title == input){
                                      controller.attributeId.value = item.id!.toString();
                                      controller.attributeName.value = item.title!.toString();
                                      controller.selectedAttribute.value=item;
                                      break;
                                    }
                                  }
                                  controller.specification.value=[];
                                },
                                selectedItem: controller.attributeName.value,
                              ),
                              SizedBox(height: 8,),
                              controller.selectedAttribute.value.title!=null? buildTextField():Wrap(),

                            ],),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CommonWidgets.customButton(
                              color: secondaryColor,
                              text: 'Confirm',
                              press: (){
                                if( controller.specificationFormKey.currentState!.validate())
                                {
                                  controller.specificationFormKey.currentState!.save();
                                  Get.back();
                                }
                              }
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
  buildTextField() {
    return Column(
      children: List.generate(controller.selectedAttribute.value.attribute!.length, (index) {
        if(controller.selectedAttribute.value.attribute![index].catalogInputType== 'radio')
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${controller.selectedAttribute.value.attribute![index].title}',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8,),
              DropdownSearch<String>(
                  mode: Mode.MENU,
                  showFavoriteItems: true,
                  items: controller.selectedAttribute.value.attribute![index].attributeValues!.map((item) => item.label!).toList(),
                  onSaved: (input){
                    controller.productData.value.specificationMobileColor = input;



                    controller.specification.add(
                      {
                        'key':'${controller.selectedAttribute.value.attribute![index].attributeCode}',
                        'value':'$input',
                      }
                    );
                  },
                  selectedItem: controller.attributeValue.value),
              SizedBox(height: 8,),
            ],
          );
        }
        else if(controller.selectedAttribute.value.attribute![index].catalogInputType=='textfield')
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${controller.selectedAttribute.value.attribute![index].title}',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8,),
              TextFormField(
                keyboardType: TextInputType.text,
                validator: (input){},
                initialValue: controller.selectedAttribute.value.attribute![index].description,

                onChanged: (input)
                {
                  controller.productData.value.specificationMobileDisplay = input;
                  controller.specification.add(
                      {
                        'key':'${controller.selectedAttribute.value.attribute![index].attributeCode}',
                        'value':input,
                      }
                  );
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8,),
            ],
          );
        }
        else
          {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${controller.selectedAttribute.value.attribute![index].title}',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  maxLines: 4,
                  validator: (input){},
                  initialValue: controller.selectedAttribute.value.attribute![index].description,

                  onChanged: (input)
                  {
                    controller.productData.value.specificationMobileNetwork=input;

                    controller.specification.add(
                        {
                          'key':'${controller.selectedAttribute.value.attribute![index].attributeCode}',
                          'value':input,
                        });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8,),
              ],
            );
          }
      })
    );
  }
}
