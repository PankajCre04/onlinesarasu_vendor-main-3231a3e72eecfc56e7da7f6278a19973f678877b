import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sooooperbusiness/api/repository/orders.dart';
import 'package:sooooperbusiness/commons/sessionmanager.dart';
import 'package:sooooperbusiness/commons/utils.dart';
import 'package:sooooperbusiness/controllers/inventory/inventoryController.dart';
import 'package:sooooperbusiness/controllers/maincontroller.dart';
import 'package:sooooperbusiness/model/order/get_store_order_response.dart';
import 'package:sooooperbusiness/model/order/getrestaurantorderresponse.dart';
import 'package:sooooperbusiness/model/order/storeOrderData.dart';

import '../../commons/constant.dart';

class OrderController extends GetxController {
  RxBool? isLoading = false.obs;
  RxBool? isPageLoading = false.obs;
  String accessToken = "";
  Orders order = Orders();
  RxInt preperationTime = 5.obs;
  Rx<GetStoreOrderResponse> restaurantOrderData = GetStoreOrderResponse().obs;
  MainController mainController = Get.put(MainController());
  RxList<bool> modifyOrder = RxList.filled(10000, false);
  RxList<bool> more = RxList.filled(10000, false);
  RxString status = "ACCEPTED".obs;
  ScrollController scrollController = new ScrollController();
  ScrollController scrollController2 = new ScrollController();
  int nextPage = 1;
  RxString orderStatus = "".obs;
  final RxList<StoreOrderData> orderList = [StoreOrderData()].obs;
  RefreshController refreshController = RefreshController(initialRefresh: false);

  @override
  Future<void> onInit() async {
    SessionManager.getAccessToken().then((value) {
      print(value);

      // if(value == null){
      //   accessToken.value = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGUyYmI5M2QxNjY1NDAwMjAzYmM5OTYiLCJpYXQiOjE2MjY0MzYwMzIsImV4cCI6MTY4NjQzNTk3MiwidHlwZSI6ImFjY2VzcyJ9.ItdcYc2hABPj9aYSVz0ziQYN7QKGhPLkuKFqxmZpIsQ";
      //   GetRestaurantOrder(accessToken.value);
      // }else{
      //   accessToken.value = value;
      //   //GetCategory(accessToken.value);
      //   GetRestaurantOrder("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGUyYmI5M2QxNjY1NDAwMjAzYmM5OTYiLCJpYXQiOjE2MjY0MzYwMzIsImV4cCI6MTY4NjQzNTk3MiwidHlwZSI6ImFjY2VzcyJ9.ItdcYc2hABPj9aYSVz0ziQYN7QKGhPLkuKFqxmZpIsQ");
      // }
      accessToken = value!;
    });
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        print("Scrolled");
        if (restaurantOrderData.value.data!.currentPage != restaurantOrderData.value.data!.total) {
          nextPage++;
          print("Scrolled");
          GetRestaurantOrder(nextPage, accessToken);
        }
      }
    });
    scrollController2.addListener(() {
      if (scrollController2.position.pixels == scrollController2.position.maxScrollExtent) {
        print("Scrolled");
        if (restaurantOrderData.value.data!.currentPage != restaurantOrderData.value.data!.total) {
          nextPage++;
          print("Scrolled");
          GetRestaurantOrder(nextPage, accessToken);
        }
      }
    });
  }

  void increaseTime() {
    preperationTime = preperationTime + 5;
  }

  void decreaseTime() {
    if (preperationTime.value != 0) {
      preperationTime = preperationTime - 5;
    }
  }

  void onRefresh() async {
    // monitor network fetch
    nextPage = 1;
    GetRestaurantOrder(nextPage, accessToken);
    await Future.delayed(Duration(milliseconds: 2000));
    refreshController.refreshCompleted();
  }

  ModifyStoreOrderStatus(String orderId, String status, String preparationTime) {
    Utility.showLoadingDialog();
    order.ModifyStoreOrderStatus(
            accessToken,
            //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGYwMjgzNTA5MmNiMzUxMDQ4NjRkNjkiLCJpYXQiOjE2MjcxNDQ3MDAsImV4cCI6MTY4NzE0NDY0MCwidHlwZSI6ImFjY2VzcyJ9.CcV-3U_rwF8DeC_6N0ZQVdK6ed-9w1G9OXFP4Ij8RTo",
            orderId,
            status,
            preparationTime)
        .then((value) {
      Utility.hideLoadingDialog();
      print("succc");
      print(value);
      print("addcaat");
      if (value.data!.message == "Updated Successfully") {
        print("mesfsfs");
        GetRestaurantOrder(1, accessToken);
        //GetRestaurantOrder("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGUyYmI5M2QxNjY1NDAwMjAzYmM5OTYiLCJpYXQiOjE2MjY0MzYwMzIsImV4cCI6MTY4NjQzNTk3MiwidHlwZSI6ImFjY2VzcyJ9.ItdcYc2hABPj9aYSVz0ziQYN7QKGhPLkuKFqxmZpIsQ",1);
        // Utility.showToastSuccess("Success", value.data!.message);
        if (status == "ACCEPTED") {
          print("get back call below");
          Get.back();
        }

        //Get.to(InventoryPage());
        return true;
      } else {
        Utility.showToastError(value.data!.message, "Failed");
        return false;
      }

      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  // Stream<dynamic> getrestStream(
  //     Duration refreshTime, int page, String token) async* {
  //   while (true) {
  //     await Future.delayed(refreshTime);
  //     yield await GetRestaurantOrder(page, token);
  //   }
  // }

  GetRestaurantOrder(int page, String accToken) async {
    print("getorder");
    isLoading!.value = true;
    if (page != 1) {
      isPageLoading!.value = true;
    }
    //Utility.showLoadingDialog();
    await order.GetRestaurantOrder(accessToken, Constant.isEcom == "0" ? mainController.selectedStore.value.id.toString() : mainController.adminStore.value.id.toString(), page, orderStatus.value).then((value) {
      Utility.hideLoadingDialog();
      print("order value le ke aaya");
      print(value);
      print(value.data!.message);
      if (value.data!.message == "Retrieved Successfully") {
        var result = value.data!.data!.data!;
        restaurantOrderData.value = value.data!;
        if (page == 1) {
          orderList.clear();
          print(orderList.toJson());
        }
        orderList.addAll(value.data!.data!.data!);
        //var result = Category();
        print(result.length);
        if (page == 1) {
          isLoading!.value = false;
          // Utility.showToastSuccess("Success", value.data!.message);
        } else {
          isPageLoading!.value = false;
        }
        // Get.to(InventoryPage());
        return true;
      } else {
        Utility.showToastError(value.error!.message, "Registration Failed");
        return false;
      }
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  GetRestaurantOrderOnoging(int page, String accToken) async {
    print("getorder");
    isLoading!.value = true;
    if (page != 1) {
      isPageLoading!.value = true;
    }
    //Utility.showLoadingDialog();
    await order.GetRestaurantOrderOngoing(accessToken, Constant.isEcom == "0" ? mainController.selectedStore.value.id.toString() : mainController.adminStore.value.id.toString(), page, orderStatus.value).then((value) {
      Utility.hideLoadingDialog();
      print("order value le ke aaya");
      print(value);
      print(value.data!.message);
      if (value.data!.message == "Retrieved Successfully") {
        var result = value.data!.data!.data!;
        restaurantOrderData.value = value.data!;
        if (page == 1) {
          orderList.clear();
          print(orderList.toJson());
        }
        orderList.addAll(value.data!.data!.data!);
        //var result = Category();
        print(result.length);
        if (page == 1) {
          isLoading!.value = false;
          // Utility.showToastSuccess("Success", value.data!.message);
        } else {
          isPageLoading!.value = false;
        }
        // Get.to(InventoryPage());
        return true;
      } else {
        Utility.showToastError(value.error!.message, "Registration Failed");
        return false;
      }
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  GetRestaurantOrderPending(int page, String accToken) async {
    print("getorder");
    isLoading!.value = true;
    if (page != 1) {
      isPageLoading!.value = true;
    }
    //Utility.showLoadingDialog();
    await order.GetRestaurantOrderPending(accessToken, Constant.isEcom == "0" ? mainController.selectedStore.value.id.toString() : mainController.adminStore.value.id.toString(), page, orderStatus.value).then((value) {
      Utility.hideLoadingDialog();
      print("order value le ke aaya");
      print(value);
      print(value.data!.message);
      if (value.data!.message == "Retrieved Successfully") {
        var result = value.data!.data!.data!;
        restaurantOrderData.value = value.data!;
        if (page == 1) {
          orderList.clear();
          print(orderList.toJson());
        }
        orderList.addAll(value.data!.data!.data!);
        //var result = Category();
        print(result.length);
        if (page == 1) {
          isLoading!.value = false;
          // Utility.showToastSuccess("Success", value.data!.message);
        } else {
          isPageLoading!.value = false;
        }
        // Get.to(InventoryPage());
        return true;
      } else {
        Utility.showToastError(value.error!.message, "Registration Failed");
        return false;
      }
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  GetRestaurantOrderCanceled(int page, String accToken) async {
    print("getorder");
    isLoading!.value = true;
    if (page != 1) {
      isPageLoading!.value = true;
    }
    //Utility.showLoadingDialog();
    await order.GetRestaurantOrderCanceled(accessToken, Constant.isEcom == "0" ? mainController.selectedStore.value.id.toString() : mainController.adminStore.value.id.toString(), page, orderStatus.value).then((value) {
      Utility.hideLoadingDialog();
      print("order value le ke aaya");
      print(value);
      print(value.data!.message);
      if (value.data!.message == "Retrieved Successfully") {
        var result = value.data!.data!.data!;
        restaurantOrderData.value = value.data!;
        if (page == 1) {
          orderList.clear();
          print(orderList.toJson());
        }
        orderList.addAll(value.data!.data!.data!);
        //var result = Category();
        print(result.length);
        if (page == 1) {
          isLoading!.value = false;
          // Utility.showToastSuccess("Success", value.data!.message);
        } else {
          isPageLoading!.value = false;
        }
        // Get.to(InventoryPage());
        return true;
      } else {
        Utility.showToastError(value.error!.message, "Registration Failed");
        return false;
      }
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  GetRestaurantOrderDelivered(int page, String accToken) async {
    print("getorder");
    isLoading!.value = true;
    if (page != 1) {
      isPageLoading!.value = true;
    }
    //Utility.showLoadingDialog();
    await order.GetRestaurantOrderDelivered(accessToken, Constant.isEcom == "0" ? mainController.selectedStore.value.id.toString() : mainController.adminStore.value.id.toString(), page, orderStatus.value).then((value) {
      Utility.hideLoadingDialog();
      print("order value le ke aaya");
      print(value);
      print(value.data!.message);
      if (value.data!.message == "Retrieved Successfully") {
        var result = value.data!.data!.data!;
        restaurantOrderData.value = value.data!;
        if (page == 1) {
          orderList.clear();
          print(orderList.toJson());
        }
        orderList.addAll(value.data!.data!.data!);
        //var result = Category();
        print(result.length);
        if (page == 1) {
          isLoading!.value = false;
          // Utility.showToastSuccess("Success", value.data!.message);
        } else {
          isPageLoading!.value = false;
        }
        // Get.to(InventoryPage());
        return true;
      } else {
        Utility.showToastError(value.error!.message, "Registration Failed");
        return false;
      }
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }
}
