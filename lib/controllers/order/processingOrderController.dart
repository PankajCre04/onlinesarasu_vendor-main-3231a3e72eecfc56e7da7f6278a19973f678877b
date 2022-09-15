import 'package:get/get.dart';

class processingOrderController extends GetxController{
  final orderView = 0.obs;
  final takeAwayVisible = false.obs;
  final DeliveryVisible = false.obs;
  final minCount = 5.obs;

  check(int V) {
    print(V);
      orderView.value = V;
  }

  takeVisible(v){
      takeAwayVisible.value = v;
  }

  deliveryVisible(D){
    DeliveryVisible.value = D;
  }


  increment(){
    print(minCount);
    minCount.value = minCount.value+5;
  }

  decrement(){
    print(minCount);
    if(minCount.value != 0){
      minCount.value = minCount.value-5;
    }
  }


}