import 'dart:io';

import 'package:biponi_vendor/app/models/addProduct_model.dart';
import 'package:biponi_vendor/app/models/brand_model.dart';
import 'package:biponi_vendor/app/models/category_model.dart';
import 'package:biponi_vendor/app/repositories/addproduct_repository.dart';
import 'package:biponi_vendor/app/repositories/auth_repositories.dart';
import 'package:biponi_vendor/common/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProductsController extends GetxController {
  //TODO: Implement AddProductsController


  final productData = AddProductModel().obs;

  final generalStatus = true.obs;
  final freeShippingStatus1 = true.obs;
  final freeShippingStatus2 = true.obs;
  final codStatus = true.obs;
  final comStatus = true.obs;

  final categoryList = <CategoryModel>[].obs;
  final categoryId=''.obs;
  final categoryListLoaded = false.obs;
  final categoryTitle=''.obs;

  late GlobalKey<FormState> addProductFormKey;

  final productType = ''.obs;
  final specification = ''.obs;
  final specialPriceType = ''.obs;
  final inventoryManagement = ''.obs;
  final stockAvailability = ''.obs;

  final brand = <BrandModel>[].obs;
  final brandId = ''.obs;
  final brandLoaded = true.obs;

  var defaultImage = File('').obs;
  var galleryImage = File('').obs;

  @override
  void onInit() {
    addProductFormKey = GlobalKey<FormState>();
    getBrand();
    getCategoryList();
    super.onInit();
  }

  Future<File> productGetImage(ImageSource imageSource) async {
    var file = File('');
    await ImagePicker().pickImage(source: imageSource).then((resp)
    {
      var image =resp;
      if(image != null)
      {
        file = File(image.path);
      }else
      {
        Get.snackbar(
            'Error', 'No Picture Selected',
            snackPosition: SnackPosition.BOTTOM
        );
      }
    });
    return file;
  }

  getBrand() async {
    AddProductRepository().getBrand().then((res) {
      //print(res.length);
      brand.value = res;
    });
  }

  getCategoryList() async
  {
    AddProductRepository().getCategoryList().then((res)
    {
      categoryList.value = res;
      categoryListLoaded.value = true;
    });
  }

  subCategoryList(String id) async
  {
    categoryListLoaded.value = false;
    AddProductRepository().getSubCategoryList(id).then((res)
    {
      categoryList.value = res;
      categoryListLoaded.value = true;
    });
  }

  void addProduct() async{
    print(productType.value);
    print(productData.value.title);
    print(productData.value.weight);
    print(productData.value.shortDescription);
    print(productData.value.description);
    print(brandId);
    print(generalStatus);

    print(productData.value.price);
    print(productData.value.specialPrice);
    print(productData.value.specialPriceStart);
    print(productData.value.specialPriceEnd);

    print(inventoryManagement.value);
    print(stockAvailability);


    print(defaultImage.value);
    print(galleryImage.value);

    AddProductRepository().addProduct(
      productData.value.title!,
      productData.value.weight!,
      productData.value.shortDescription!,
      productData.value.description!,
      productData.value.price!,
      productData.value.sku!,
      productData.value.specialPrice!,
      productData.value.specialPriceStart!,
      productData.value.specialPriceEnd!,
      productData.value.brandTitle!,
      productData.value.metaTitle!,
      productData.value.metaKeyword!,
      productData.value.metaDescription!,
      productData.value.shippingOptionInsideOriginInsideStandardShipping!,
      productData.value.shippingOptionInsideOriginInsideExpressShipping!,
      productData.value.shippingOptionOutsideOriginOutsideStandardShipping!,
      productData.value.shippingOptionOutsideOriginOutsideExpressShipping!,
      productData.value.miscellaneousInformationWarrentyPeriod!,).then((res){
      print(res);
      if(res['status'].toString()=='1')
      {
        Get.showSnackbar(Ui.SuccessSnackBar(message: 'Product added successful',title: 'Success'));
      }
    });

  }

}
