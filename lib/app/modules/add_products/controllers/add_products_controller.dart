import 'dart:io';
import 'package:biponi_vendor/app/models/addProduct_model.dart';
import 'package:biponi_vendor/app/models/attributeSet_model.dart';
import 'package:biponi_vendor/app/models/brand_model.dart';
import 'package:biponi_vendor/app/models/category_model.dart';
import 'package:biponi_vendor/app/repositories/addproduct_repository.dart';
import 'package:biponi_vendor/common/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProductsController extends GetxController {
  //TODO: Implement AddProductsController

  final productData = AddProductModel().obs;

  late GlobalKey<FormState> addProductFormKey;
  late GlobalKey<FormState> generalFormKey;
  late GlobalKey<FormState> specificationFormKey;
  late GlobalKey<FormState> priceFormKey;
  late GlobalKey<FormState> inventoryFormKey;
  late GlobalKey<FormState> seoFormKey;
  late GlobalKey<FormState> additionalFormKey;

  ///date & time picker
  final selectedStartDate = DateTime.now().obs;
  final selectedEndDate = DateTime.now().obs;
  final selectedStartTime = TimeOfDay.now().obs;
  final selectedEndTime = TimeOfDay.now().obs;

  ///switch
  final generalStatus = false.obs;
  final statusActive = ''.obs;
  final freeShippingStatus1 = false.obs;
  final insideAllowFreeShipping=''.obs;
  final freeShippingStatus2 = false.obs;
  final outsideAllowFreeShipping = ''.obs;
  final codStatus = false.obs;
  final cashOnDelivery = ''.obs;
  final comStatus = true.obs;
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
  //final specification = ''.obs;
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
  void onInit() {
    addProductFormKey = GlobalKey<FormState>();
    generalFormKey = GlobalKey<FormState>();
    specificationFormKey = GlobalKey<FormState>();
    priceFormKey = GlobalKey<FormState>();
    inventoryFormKey = GlobalKey<FormState>();
    seoFormKey = GlobalKey<FormState>();
    additionalFormKey = GlobalKey<FormState>();
    getBrand();
    getAttribute();
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

  getAttribute() async {
    AddProductRepository().getAttribute().then((res){
      attributeList.value = res;
    });

  }

  getBrand() async {
    AddProductRepository().getBrand().then((res) {
      brand.value = res;
    });
  }

  getCategoryList() async {
    AddProductRepository().getCategoryList().then((res)
    {
      categoryList.value = res;
      categoryListLoaded.value = true;
    });
  }

  subCategoryList(String id) async {
    categoryListLoaded.value = false;
    AddProductRepository().getSubCategoryList(id).then((res)
    {
      categoryList.value = res;
      categoryListLoaded.value = true;
    });
  }

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

  void addProduct() async{
    print(productType.value);
    print(categoryTitle.value);
    print(productData.value.title);
    print(productData.value.weight);
    print(weightUnit.value);
    print(productData.value.shortDescription);
    print(productData.value.description);
    print(brandName);
    print('General Status: $generalStatus');

    print(attributeName.value);

    print(productData.value.price);
    print(productData.value.specialPrice);
    print(specialPriceType.value);
    print(selectedStartDate.value);
    print(selectedStartTime.value);

    print(productData.value.sku);
    print(inventoryManagement.value);
    print(productData.value.qty);
    print(stockAvailability.value);
    print(productData.value.maxCartQty);

    print(defaultImage.value);
    print(galleryImage.value);

    print(productData.value.metaTitle);
    print(productData.value.metaKeyword);
    print(productData.value.metaDescription);

    print(freeShippingStatus1.value);
    print(productData.value.shippingOptionInsideOriginInsideStandardShipping);
    print(productData.value.shippingOptionInsideOriginInsideExpressShipping);
    print(freeShippingStatus2.value);
    print(productData.value.shippingOptionOutsideOriginOutsideStandardShipping);
    print(productData.value.shippingOptionOutsideOriginOutsideExpressShipping);
    print(codStatus.value);
    print(productData.value.miscellaneousInformationWarrentyPeriod);
    print(comStatus.value);

    AddProductRepository().addProduct(
      productData.value.title!,
      productData.value.weight!,
      weightUnit.value,
      productData.value.shortDescription!,
      productData.value.description??'',
      brandId.value,
      categoryId.value,
      productData.value.price!,
      stockAvailability.value,
      productData.value.sku??'',
      productData.value.slug??'',
      attributeId.value,
      productData.value.specialPrice??'',
      specialPriceType.value,
      productData.value.specialPriceStart??'',
      productData.value.specialPriceEnd??'',
      defaultImage.value,
      galleryImageList,
      productData.value.qty??'',
      statusActive.value,
      productData.value.maxCartQty??'',
      productData.value.metaTitle??'',
      productData.value.metaKeyword??'',
      productData.value.metaDescription??'',
      insideAllowFreeShipping.value,
      productData.value.shippingOptionInsideOriginInsideStandardShipping!,
      productData.value.shippingOptionInsideOriginInsideExpressShipping??'',
      outsideAllowFreeShipping.value,
      productData.value.shippingOptionOutsideOriginOutsideStandardShipping!,
      productData.value.shippingOptionOutsideOriginOutsideExpressShipping??'',
      cashOnDelivery.value,
      productData.value.miscellaneousInformationWarrentyPeriod??'',
      changeOfMind.value,
      productType.value,
      specificationMobileColor.value,
      productData.value.specificationMobileDisplay??'',
      productData.value.specificationMobileNetwork??'',
    ).then((res){

      print(res);
      if(res['status'].toString()=='1')
      {
        Get.showSnackbar(Ui.SuccessSnackBar(message: 'Product added successful',title: 'Success'));
      }
    });

  }

}
