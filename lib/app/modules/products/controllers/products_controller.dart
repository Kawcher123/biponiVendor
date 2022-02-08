import 'package:biponi_vendor/app/models/productList_model.dart';
import 'package:biponi_vendor/app/repositories/productList_repositories.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  //TODO: Implement ProductsController

  final productList = ProductListModel().obs;
  final productListLoaded = false.obs;

  @override
  void onInit() {

    getProductList();
    super.onInit();
  }

  getProductList()async
  {
    ProductListRepository().getProductList().then((resp)
    {
      productList.value=resp;
      productListLoaded.value=true;
    });
  }

}
