import 'package:biponi_vendor/app/models/brand_model.dart';
import 'package:biponi_vendor/app/models/category_model.dart';
import 'package:biponi_vendor/app/providers/api_manager.dart';
import 'package:biponi_vendor/app/providers/api_url.dart';
import 'package:biponi_vendor/app/services/auth_service.dart';
import 'package:get/get.dart';

class AddProductRepository {
  Future addProduct(
  String title,
  String weight,
  String weightUnit,
  String shortDescription,
  String description,
  String brandId,
  String categoryId,
  String price,
  String inStock,
  String sku,
  String slug,
  //String isApproximate,
  //String brandTitle,
  String productType,
  //String attributeSetId,
  //String categoryTitle,
  String specialPrice,
  String specialPriceType,
  String specialPriceStart,
  String specialPriceEnd,
  //String manageStock,
  String qty,
  var defaultImage,
  var galleryImage,
  //String viewed,
  //String isActive,
  String maxCartQty,
  String metaTitle,
  String metaKeyword,
  String metaDescription,
  //String insideAllowFreeShipping,
  String insideStandardShipping,
  String insideExpressShipping,
  //String outsideAllowFreeShipping,
  String outsideStandardShipping,
  String outsideExpressShipping,
  //String miscellaneousInformationAllowCashOnDelivery,
  String warrentyPeriod,
  //String miscellaneousInformationAllowChangeOfMind,
      )async {

    Map<String,String> product = {
    'title': title,
    'weight': weight,
    'weight_unit': weightUnit,
    'short_description': shortDescription,
    'description': description,
    'brand_id': brandId,
    'category_id': categoryId,
    'price': price,
    'in_stock': inStock,
    'sku': sku,
    'slug': slug,
    'is_approximate':'',
    'brand_title': '',
    'product_type': productType,
    'attribute_set_id':'',
    'category_title': '',
    'special_price': specialPrice,
    'special_price_type': specialPriceType,
    'special_price_start': specialPriceStart,
    'special_price_end': specialPriceEnd,
    'default_image': defaultImage,
    'gallery_images': galleryImage,
    'manage_stock':'',
    'qty': qty,
    'viewed':'',
    'is_active':'',
    'max_cart_qty': maxCartQty,
    'meta_title': metaTitle,
    'meta_keyword': metaKeyword,
    'meta_description': metaDescription,
    'shipping_option[inside_origin][inside_allow_free_shipping]':'',
    'shipping_option[inside_origin][inside_standard_shipping]': insideStandardShipping,
    'shipping_option[inside_origin][inside_express_shipping]': insideExpressShipping,
    'shipping_option[outside_origin][outside_allow_free_shipping]': '',
    'shipping_option[outside_origin][outside_standard_shipping]': outsideStandardShipping,
    'shipping_option[outside_origin][outside_express_shipping]': outsideExpressShipping,
    'miscellaneous_information[allow_cash_on_delivery]': '',
    'miscellaneous_information[warrenty_period]': warrentyPeriod,
    'miscellaneous_information[allow_change_of_mind]': '',
    };

    String token = Get.find<AuthService>().user.value.token!;
    print(token);

    var headers = {'Authorization': 'Bearer $token'};
    APIManager _manager = APIManager();

    final response = await _manager.multipartPostAddProductAPI(ApiClient.addProduct, product, defaultImage, galleryImage, headers);

    print('addProduct:$response');

    return response;

  }

  Future<List<BrandModel>> getBrand() async {
    APIManager _manager = APIManager();

    final response = await _manager.get(ApiClient.brands);

    return List.from(response.map((item) => BrandModel.fromJson(item)));
  }

  Future<List<CategoryModel>> getCategoryList() async {
    APIManager _manager = APIManager();

    final response = await _manager.get(ApiClient.categories);
    print(response);
    return List.from(response.map((item) => CategoryModel.fromJson(item)));
  }

  Future<List<CategoryModel>> getSubCategoryList(String id) async {

    APIManager _manager = APIManager();

    Map data = {'id': id};

    final response = await _manager.postAPICall(ApiClient.subCategories,data);

    print(response);

    return List.from(response.map((item) => CategoryModel.fromJson(item)));
  }




}