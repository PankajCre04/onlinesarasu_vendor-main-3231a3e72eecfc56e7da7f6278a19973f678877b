import 'package:get/get.dart';
import 'package:sooooperbusiness/controllers/AddressController.dart';
import 'package:sooooperbusiness/controllers/authcontrollers.dart';
import 'package:sooooperbusiness/controllers/getstartedcontroller.dart';
import 'package:sooooperbusiness/controllers/inventory/addonController.dart';
import 'package:sooooperbusiness/controllers/inventory/inventoryController.dart';
import 'package:sooooperbusiness/controllers/maincontroller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => InventoryController());
    Get.lazyPut(() => AddonController());
    Get.lazyPut(() => AddressController());
    Get.lazyPut(() => GetStartedController());
    Get.lazyPut(() => AuthControllers());
  }
}
