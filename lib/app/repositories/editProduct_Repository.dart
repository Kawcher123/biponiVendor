import 'package:biponi_vendor/app/models/editProduct_model.dart';
import 'package:biponi_vendor/app/providers/api_manager.dart';
import 'package:biponi_vendor/app/providers/api_url.dart';
import 'package:biponi_vendor/app/services/auth_service.dart';
import 'package:get/get.dart';

class EditProductRepository{

  Future<EditProductModel> getProductData(String productId) async {

    String token=Get.find<AuthService>().user.value.token!;
    print('token:$token');
    var headers = {
      'Authorization': 'Bearer $token'
    };

    APIManager _manager = APIManager();

    final response = await _manager.getWithHeader(ApiClient.editProduct + productId, headers);

    print('Product Data: ${response}');


    return EditProductModel.fromJson(response);
  }

  Future updateProductData(var updatedData,String productId,  var defaultImage,
      var galleryImage,) async {


    String token = Get.find<AuthService>().user.value.token!;

    print(token);

    var headers = {'Authorization': 'Bearer $token'};

    APIManager _manager = APIManager();

    final response = await _manager.multipartPostAddProductAPI(ApiClient.saveeditedProduct+productId, updatedData, defaultImage, galleryImage, headers,);

    print('edit Product:$response');

    return response;
  }


}