import 'package:get/get.dart';
import 'package:sooooperbusiness/api/repository/ownerrepo.dart';
import 'package:sooooperbusiness/commons/sessionmanager.dart';
import 'package:sooooperbusiness/controllers/maincontroller.dart';
import 'package:sooooperbusiness/model/restaurant.dart';

class HomeController extends GetxController {
  var fabIndex = 0.obs;
  var currentOrderType = "Take away".obs;
  MainController mainController = Get.put(MainController());

  void changeTabIndex(int index) {
    fabIndex.value = index;
  }
}
