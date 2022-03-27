import 'package:biponi_vendor/app/models/customerList_model.dart';
import 'package:biponi_vendor/app/repositories/customerList_repositories.dart';
import 'package:get/get.dart';

class CustomerListController extends GetxController {
  //TODO: Implement CustomerListController

  final customerList = CustomerListModel().obs;
  final customerListLoaded = false.obs;

  @override
  void onInit() {
    getCustomerList();
    super.onInit();
  }

  refreshCustomerList()async{
    getCustomerList();
  }

  getCustomerList() async
  {
    CustomerListRepository().getCustomerList().then((resp)
        {
          customerList.value=resp;
          customerListLoaded.value= true;
        }
    );
  }

}
