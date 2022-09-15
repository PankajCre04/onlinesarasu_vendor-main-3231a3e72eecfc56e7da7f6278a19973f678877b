import 'package:get/get.dart';

class categoryController extends GetxController{
  RxList<bool> acceptOrders=List.filled(10000, false).obs;

}