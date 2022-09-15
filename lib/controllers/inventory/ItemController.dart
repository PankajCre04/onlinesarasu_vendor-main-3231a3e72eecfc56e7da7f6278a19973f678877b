import 'package:get/get.dart';
import 'package:sooooperbusiness/api/repository/POSRepo.dart';
import 'package:sooooperbusiness/commons/utils.dart';
import 'package:sooooperbusiness/controllers/inventory/inventoryController.dart';
import 'package:sooooperbusiness/controllers/maincontroller.dart';
import 'package:sooooperbusiness/model/more/inventory/inventoryModel.dart';
import 'package:sooooperbusiness/model/more/inventory/product.dart';

class ItemController extends GetxController {
  RxList<Product> itemList = [Product()].obs;
  RxList<Product> searchItemList = [Product()].obs;
  RxString accessToken = "".obs;
  RxString currentRestId = "".obs;
  POSRepo posRepo = POSRepo();
  int pageNo = 1;


  @override
  void onInit() {
    // TODO: implement onInit
    // currentRestId.value = mainController.selectedStore.value.id!;
    // itemList.clear();
    searchItemList.clear();
    itemList = Get.find<InventoryController>().itemList;
    super.onInit();
  }

  void runFilter(String enteredKeyword) {
    searchItemList.clear();
    update();
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      searchItemList.value = [];
      update();
    } else {
      searchItemList.value = itemList
          .where((item) =>
              item.name!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      print(searchItemList);
      update();
      // we use the toLowerCase() method to make it case-insensitive
    }
    update();

    // Refresh the UI
  }

  void searchItems(String searchKeyWord) {
    itemList.clear();
    // currentRestId.value =
    //     Get.find<MainController>().selectedStore.value.id!;
    posRepo.searchItems(currentRestId.value, searchKeyWord).then((value) {
      if (value.error == null) {
        if (value.data!.data!.isNotEmpty) {
          // itemList.value = value.data!;
        }
      } else {
        Utility.showSingleTextToast(value.error!.message!);
      }
    });
  }
}
