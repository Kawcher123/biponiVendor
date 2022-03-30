import 'dart:io';

import 'package:biponi_vendor/app/models/attributeSet_model.dart';
import 'package:biponi_vendor/app/models/brand_model.dart';
import 'package:biponi_vendor/app/models/category_model.dart';
import 'package:biponi_vendor/app/models/editProduct_model.dart';
import 'package:biponi_vendor/app/repositories/addproduct_repository.dart';
import 'package:biponi_vendor/app/repositories/editProduct_Repository.dart';
import 'package:biponi_vendor/common/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProductEditController extends GetxController {
  //TODO: Implement ProductEditController

  final editProductData = EditProductModel().obs;
  final editProductLoaded = false.obs;
  final productId = ''.obs;

  late GlobalKey<FormState> productEditFormKey;
  late GlobalKey<FormState> generalEditFormKey;
  late GlobalKey<FormState> specificationEditFormKey;
  late GlobalKey<FormState> priceEditFormKey;
  late GlobalKey<FormState> inventoryEditFormKey;
  late GlobalKey<FormState> seoEditFormKey;
  late GlobalKey<FormState> additionalEditFormKey;

  ///date & time picker
  final selectedStartDate = DateTime.now().obs;
  final selectedEndDate = DateTime.now().obs;
  final selectedStartTime = TimeOfDay.now().obs;
  final selectedEndTime = TimeOfDay.now().obs;

  ///switch
  final generalStatus = false.obs;
  // final statusActive = ''.obs;
  final freeShippingStatus1 = false.obs;
  final insideAllowFreeShipping=''.obs;
  final freeShippingStatus2 = false.obs;
  final outsideAllowFreeShipping = ''.obs;
  final codStatus = false.obs;
  final cashOnDelivery = ''.obs;
  final comStatus = false.obs;
  final changeOfMind = ''.obs;

  ///attributeSet
  final attributeList = <AttributeSetModel>[].obs;
  final selectedAttribute=AttributeSetModel().obs;
  final attributeValue=''.obs;
  final attributeId = ''.obs;
  final attributeName = ''.obs;
  final attributeLoaded = true.obs;

  ///categories
  final categoryList = <CategoryModel>[].obs;
  final categoryId=''.obs;
  final categoryListLoaded = false.obs;
  final categoryTitle=''.obs;
  final categorySelect = ''.obs;

  ///dropdown
  final weightUnit = ''.obs;
  final productType = ''.obs;
  final specification = ''.obs;
  final specialPriceType = ''.obs;
  final inventoryManagement = ''.obs;
  final stockAvailability = ''.obs;
  final saleOption = ''.obs;
  final specificationMobileColor = ''.obs;

  ///brand
  final brand = <BrandModel>[].obs;
  final brandId = ''.obs;
  final brandName = ''.obs;
  final brandLoaded = true.obs;

  ///images
  var defaultImage = File('').obs;
  var galleryImage = File('').obs;
  List galleryImageList = [].obs;

  @override
  Future<void> onInit() async {

    productId.value = Get.arguments.toString();
    print('product id: ${productId.value}');
    await getProductData();

    productEditFormKey = GlobalKey<FormState>();
    generalEditFormKey = GlobalKey<FormState>();
    specificationEditFormKey = GlobalKey<FormState>();
    priceEditFormKey = GlobalKey<FormState>();
    inventoryEditFormKey = GlobalKey<FormState>();
    seoEditFormKey = GlobalKey<FormState>();
    additionalEditFormKey = GlobalKey<FormState>();

    getBrand();
    getAttribute();
    getCategoryList();

    super.onInit();
  }

  ///Image
  Future<File> productGetImage(ImageSource imageSource) async {
    var file = File('');
    await ImagePicker().pickImage(source: imageSource).then((resp)
    {
      var image =resp;
      if(image != null)
      {
        file = File(image.path);
        // galleryImageList.add(file);
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

  ///Date
  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedStartDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
      helpText: 'Select Date',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldHintText: 'Month/Date/Year',
    );
    if (pickedDate != null && pickedDate != selectedStartDate.value) {
      selectedStartDate.value = pickedDate;
    }
  }

  ///Time
  chooseTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: Get.context!,
      initialTime: selectedStartTime.value,
      builder: (context, child)
      {
        return Theme(data: ThemeData.dark(), child: child!);
      },
      initialEntryMode: TimePickerEntryMode.dial,
      helpText: 'Select Time',
      errorInvalidText: 'Provide valid time',
      hourLabelText: 'Select Hour',
      minuteLabelText: 'Select Minute',
    );
    if (pickedTime != null && pickedTime != selectedStartTime.value) {
      selectedStartTime.value = pickedTime;
    }
  }

  ///Product Data
  getProductData() async {
    print('get product calling');
    EditProductRepository().getProductData(productId.value).then((resp)
    {
      editProductData.value=resp;
      editProductLoaded.value= true;
      productType.value=editProductData.value.product!.productType.toString();
      weightUnit.value=editProductData.value.product!.weightUnit!.toLowerCase();
      specialPriceType.value=editProductData.value.product!.specialPriceType.toString();
      stockAvailability.value=editProductData.value.product!.inStock.toString();
      brandId.value=editProductData.value.product!.weightUnit.toString();
      generalStatus.value=editProductData.value.product!.isActive!;
      categoryId.value=editProductData.value.product!.categoryId.toString();
      attributeId.value=editProductData.value.product!.attributeSetId.toString();
      freeShippingStatus1.value=editProductData.value.productShipping!.metaValues!.insideOrigin!.insideAllowFreeShipping=='on'?true:false;
      freeShippingStatus2.value=editProductData.value.productShipping!.metaValues!.insideOrigin!.insideAllowFreeShipping=='on'?true:false;
      codStatus.value=editProductData.value.productMiscellaneousInfo!.metaValues!.allowCashOnDelivery=='on'?true:false;
      comStatus.value=editProductData.value.productMiscellaneousInfo!.metaValues!.allowChangeOfMind=='on'?true:false;


    }
    );
  }

  ///Attributes
  getAttribute() async{
    AddProductRepository().getAttribute().then((res){
      attributeList.value = res;
    });

  }

  ///Brands
  getBrand() async {
    AddProductRepository().getBrand().then((res) {
      brand.value = res;
    });
  }

  ///Categories
  getCategoryList() async
  {
    AddProductRepository().getCategoryList().then((res)
    {
      categoryList.value = res;
      categoryListLoaded.value = true;
    });
  }

  ///SubCategories
  subCategoryList(String id) async
  {
    categoryListLoaded.value = false;
    AddProductRepository().getSubCategoryList(id).then((res)
    {
      categoryList.value = res;
      categoryListLoaded.value = true;

    });
  }

  void updateProduct() async{
    var updatedData1 = {
      'title': editProductData.value.product!.title.toString(),
      'weight': editProductData.value.product!.weight,
      'weight_unit': weightUnit.value.toLowerCase(),
      'short_description': editProductData.value.product!.shortDescription.toString(),
      'description': editProductData.value.product!.description.toString(),
      'brand_id': brandId.value,
      'category_id[]': categoryId.value,
      'price': editProductData.value.product!.price.toString(),
      'in_stock': '',
      'sku': editProductData.value.product!.sku.toString(),
     // 'slug': editProductData.value.product!.slug.toString(),
      'is_approximate': '0',
      'attribute_set_id': attributeId.value,
      'special_price': editProductData.value.product!.specialPrice.toString(),
      'special_price_type': specialPriceType.value,
      'special_price_start': '',
      'special_price_end': '',
      'manage_stock': '',
      'qty': editProductData.value.product!.qty.toString(),
      'viewed': '',
      'is_active': '1',
      'max_cart_qty': editProductData.value.product!.maxCartQty.toString(),
      'meta_title': '',
      'meta_keyword': '',
      'meta_description': '',
      'shipping_option[inside_origin][inside_allow_free_shipping]': '',
      'shipping_option[inside_origin][inside_standard_shipping]': '200',
      'shipping_option[inside_origin][inside_express_shipping]': '',
      'shipping_option[outside_origin][outside_allow_free_shipping]': '',
      'shipping_option[outside_origin][outside_standard_shipping]': '250',
      'shipping_option[outside_origin][outside_express_shipping]': '',
      'miscellaneous_information[allow_cash_on_delivery]': '',
      'miscellaneous_information[warrenty_period]': '',
      'miscellaneous_information[allow_change_of_mind]': '',
      'product_type': productType.value.toLowerCase(),
      'specification[mobile_color]': '',
      'specification[mobile_display]': '',
      'specification[mobile_network]': ''
    };
    print(stockAvailability.value);
    var updatedData={
      'title': editProductData.value.product!.title.toString(),
      'weight': '${editProductData.value.product!.weight}',
      'weight_unit': '${weightUnit.value.toLowerCase()}',
      'short_description': '${editProductData.value.product!.shortDescription}',
      'description': '${editProductData.value.product!.description}',
      'brand_id': '${brandId.value}',
      'category_id[]': '${categoryId.value}',
      'price': '${editProductData.value.product!.price}',
      'in_stock': '${stockAvailability.value}',
      'sku': '${editProductData.value.product!.sku}',
      'slug': '${editProductData.value.product!.slug}',
      'is_approximate': '0',
      'attribute_set_id': '${attributeId.value}',
      'special_price': '${editProductData.value.product!.specialPrice}',
      'special_price_type': '${specialPriceType.value}',
      'special_price_start': '',
      'special_price_end': '',
      'manage_stock': '',
      'qty': '${editProductData.value.product!.qty}',
      'viewed': '',
      'is_active': '${generalStatus.value}',
      'max_cart_qty': '${editProductData.value.product!.maxCartQty}',
      //'meta_title': '${editProductData.value.meta}',
      // 'meta_keyword': '',
      // 'meta_description': '',
      'shipping_option[inside_origin][inside_allow_free_shipping]': '${insideAllowFreeShipping.value}',
      'shipping_option[inside_origin][inside_standard_shipping]': '${editProductData.value.productShipping!.metaValues!.insideOrigin!.insideStandardShipping}',
      'shipping_option[inside_origin][inside_express_shipping]': '${editProductData.value.productShipping!.metaValues!.insideOrigin!.insideExpressShipping}',
      'shipping_option[outside_origin][outside_allow_free_shipping]': '${outsideAllowFreeShipping.value}',
      'shipping_option[outside_origin][outside_standard_shipping]': '${editProductData.value.productShipping!.metaValues!.outsideOrigin!.outsideStandardShipping}',
      'shipping_option[outside_origin][outside_express_shipping]': '${editProductData.value.productShipping!.metaValues!.outsideOrigin!.outsideExpressShipping}',
      'miscellaneous_information[allow_cash_on_delivery]': '${cashOnDelivery.value}',
      'miscellaneous_information[warrenty_period]': '${editProductData.value.productMiscellaneousInfo!.metaValues!.warrentyPeriod}',
      'miscellaneous_information[allow_change_of_mind]': '${changeOfMind.value}',
      'product_type': '${productType.value}',
      'specification[mobile_color]': '',
      'specification[mobile_display]': '',
      'specification[mobile_network]': ''
    };
    print('product type: ${productType.value.toLowerCase()}');
    EditProductRepository().updateProductData(updatedData, productId.value, defaultImage.value, galleryImageList).then((resp)
    {
      print('updated response: ${resp}');
      if(resp['status'].toString()=='0')
      {
        Get.showSnackbar(Ui.SuccessSnackBar(message: 'Product Update successful',title: 'Updated'));
      }
    });
  }

}
