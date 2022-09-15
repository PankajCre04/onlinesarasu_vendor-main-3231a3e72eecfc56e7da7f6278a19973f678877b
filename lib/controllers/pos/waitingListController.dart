import 'package:get/get.dart';

class WaitingListController extends GetxController{
  final Count = 1.obs;


  increment(){
    print(Count);
    Count.value = Count.value+1;
  }

  decrement(){
    print(Count);
    if(Count.value != 1){
      Count.value = Count.value-1;
    }
  }


}