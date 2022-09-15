
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:date_format/date_format.dart';
import 'package:sooooperbusiness/api/repository/ownerrepo.dart';
import 'package:sooooperbusiness/commons/sessionmanager.dart';
import 'package:sooooperbusiness/commons/utils.dart';

import 'maincontroller.dart';

class ScheduleTimeController extends GetxController {
  RxList<String> days = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"].obs;
  RxList<String> selectedDaysList = ["Monday"].obs;
  RxList<String> selectedOpenTime = [""].obs;
  RxList<String> selectedCloseTime = [""].obs;
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  String ownerId = "";
  RxString accessToken = "".obs;

  OwnerRepo ownerRepo = OwnerRepo();

  @override
  Future<void> onInit() async {

    String? name = await SessionManager.getOwnerName();
    String? token = await SessionManager.getAccessToken();
    print(token);
    // Utility.showToastSuccess("Welcome ${name} !", "Login Successful");
    SessionManager.getOwnerID().then((value) {
      ownerId = value!;
    });


    update();
    SessionManager.getAccessToken().then((value) {
      accessToken.value = value!;
      getAllRestaurant();
    });
    super.onInit();
    // print("getpromo");
    // OfferController promoController = Get.put(OfferController());
    // promoController.GetPromos(token!,selectedStore.value.id!);



  }


  Future<String> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null){
      print(formatDate(DateTime(2019, 08, 1, picked.hour, picked.minute), [hh, ':', nn, " ", am]).toString());
      return formatDate(
          DateTime(2019, 08, 1, picked.hour, picked.minute),
          [hh, ':', nn, " ", am]).toString();
    }else{
      return "";
    }
  }

  void addStoreTimeSchedule(storeId) async {
    Utility.showLoadingDialog();
    String? accessToken = await SessionManager.getAccessToken();
    ownerRepo.addStoreTimeSchedule(
      accessToken!,
      storeId.toString(),
      selectedDaysList,
      selectedOpenTime,
      selectedCloseTime
    ).then((value) {
      Utility.hideLoadingDialog();
      print(value);
      print(value.data!.message);
      Get.back();
      if (value.data!.message == "Saved Successfully") {
        // Utility.showToastSuccess(
        //     "Store Schedule Added Successful", value.data!.message);
        getAllRestaurant();
        Get.back();
        Get.back();
        //Get.back();
        print("blablaaa");
      } else {
        Utility.showToastError(value.error!.message, "Store Failed");
      }
      print(value);
    }).catchError((onError) {
      print(onError);
    });
  }

  void getAllRestaurant() {
    print("get all restaurant");
    MainController mainController = Get.put(MainController());
    ownerRepo.getAllRestaurant(accessToken.value,ownerId).then((value) {
      if (value.data != null) {
        print("after getting restaurant");
        print(value.data!.data!);
        mainController.allRestaurant!.value = value.data!.data!.data!;
      } else {
        // isLoadingRestaurants.value = false;
        // print(value.error!.code);
      }
    });
  }
}
