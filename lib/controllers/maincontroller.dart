import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart' as di;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sooooperbusiness/api/repository/ownerrepo.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/sessionmanager.dart';
import 'package:sooooperbusiness/commons/utils.dart';
import 'package:sooooperbusiness/controllers/offercontroller.dart';
import 'package:sooooperbusiness/controllers/order/ordercontroller.dart';
import 'package:sooooperbusiness/controllers/report/reportController.dart';
import 'package:sooooperbusiness/model/StoreData.dart';
import 'package:sooooperbusiness/model/ecom_store_model.dart';
import 'package:sooooperbusiness/model/owner.dart';
import 'package:sooooperbusiness/model/restaurant.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sooooperbusiness/model/settings_reponse.dart';
import 'package:sooooperbusiness/model/store_stats_response.dart';
import 'package:sooooperbusiness/service/push_notification_services.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/order_list_by_report.dart';
import 'package:sooooperbusiness/views/maintenance.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'inventory/inventoryController.dart';

class MainController extends GetxController {
  RxString appVersion = "".obs;
  RxBool acceptOrders = false.obs;
  Rx<Owner> ownerData = Owner().obs;
  var tabIndex = 0.obs;
  RxList<StoreData>? allRestaurant = [StoreData()].obs;
  Rx<EcomData> adminStore = EcomData().obs;
  RxString adminId = "".obs;
  OwnerRepo ownerRepo = OwnerRepo();
  String ownerId = "";
  RxString accessToken = "".obs;
  RxBool isLoadingRestaurants = true.obs;
  RxBool isLoadingAdminStore = true.obs;
  Rx<StoreData> selectedStore = StoreData().obs;
  WebViewController? webViewController;
  RxBool isCreatingLink = false.obs;
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  Rx<SettingData> settingData = SettingData().obs;
  Rx<StoreStatsData> storeStatsData = StoreStatsData().obs;
  RxBool isStatsLoading = false.obs;
  RxMap<String, double>? pieDataMap = {
    "Pending": 0.0,
    "Delivered": 0.0,
    "Ongoing": 0.0,
    "Cancelled": 0.0,
  }.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  final AudioCache _audioCache = AudioCache(
    prefix: 'assets/audio/',
    fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
  );

  @override
  Future<void> onInit() async {
    // PushNotificationService().initialise();

    String? name = await SessionManager.getOwnerName();
    String? token = await SessionManager.getAccessToken();
    UploadFCMToken();
    update();
    SessionManager.getAccessToken().then((value) {
      accessToken.value = value!;
      if (Constant.isEcom == "1") {
        getEcomStore();
      } else {
        getAllRestaurant();
      }
    });
    // Utility.showToastSuccess("Welcome ${name} !", "Login Successful");

    SessionManager.getOwnerID().then((value) {
      ownerId = value!;
    });
    if (Constant.isEcom == "0") {
      StoreData? rest = await SessionManager.getRestaurant();
      print("before setting order");
      print(rest);
      if (rest != null && rest.id != null && rest.id != -1) {
        selectedStore.value = rest;
        acceptOrders.value = selectedStore.value.active!;
        await getStoreStats(selectedStore.value.id.toString());
        Timer? timer;
        timer = Timer.periodic(Duration(minutes: 2), (Timer t) {
          if (storeStatsData.value.pendingOrders! > 0) {
            if (Get.isDialogOpen!) {
              print("dialog is open");
              // Get.back();
            } else {
              // _audioCache.play('notification.mp3');
              // showOrderDialog(Get.context!);
            }
            // if(Get.isDialogOpen!) Get.back();
            // showOrderDialog(Get.context!);
          }
        });
        print("data set");
        print(acceptOrders.value);
      } else {
        print("No Default Restaurant");
      }
    } else {
      EcomData? ecomRest = await SessionManager.getEcomAdminStore();
      await SessionManager.getEcomStroeId();
      print("================>>>>>data${Constant.isEcom}");
      SessionManager.saveEcomStoreId(ecomRest!.id.toString());
      print(ecomRest.id);
      print(ecomRest.toJson());
      if (ecomRest.id != null && ecomRest.id != -1) {
        print("if mai aaya ecom id");
        adminStore.value = ecomRest;
        acceptOrders.value = adminStore.value.active!;
        print("============>>>>>>>>>>>>>${ecomRest.id.toString()}");
        await getStoreStats(adminStore.value.id.toString());
        Timer? timer;
        timer = Timer.periodic(Duration(minutes: 2), (Timer t) {
          if (storeStatsData.value.pendingOrders! > 0) {
            if (Get.isDialogOpen!) {
              print("dialog is open");
              // Get.back();
            } else {
              // _audioCache.play('notification.mp3');
              // showOrderDialog(Get.context!);
            }
            // if(Get.isDialogOpen!) Get.back();
            // showOrderDialog(Get.context!);
          }
        });
        print("Ecomdata set");
        print(acceptOrders.value);
      } else {
        print("No Default Restaurant");
      }
    }
    if (selectedStore.value.id != null) {
      print("if mai aaya hai bhai ji");
      getStoreStats(selectedStore.value.id.toString());
    } else {
      print("else mai aaya hai bhai ji");
      getStoreStats(adminStore.value.id.toString());
    }

    // getSettings();
    super.onInit();
    // print("getpromo");
    // OfferController promoController = Get.put(OfferController());
    // promoController.GetPromos(token!,selectedStore.value.id!);
  }

  UploadFCMToken() {
    // Utility.showLoadingDialog();
    SessionManager.getAccessToken().then((value) {
      print(value);
      ownerRepo.UploadFcmToken(
        value!,
        Constant.FCM_TOKEN,
      ).then((value) {
        // Utility.hideLoadingDialog();
        print(value);
        if (value.data != null) {
          print("mess");
          update();
          update();
          return true;
        } else {
          if (value.error != null || value.error!.message != null) {
            // Utility.showToastError(value.error!.message, " Failed");
          }
          return false;
        }
      });
      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print("errorr");
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  Future<dynamic> showOrderDialog(BuildContext context) {
    return Get.dialog(
            Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Container(
                // height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "${storeStatsData.value.pendingOrders!} Order Awaiting your confirmation",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Constant.black),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // TextField(
                      //   decoration: InputDecoration(
                      //       border: InputBorder.none,
                      //       hintText: 'A new update Available'),
                      // ),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () async {
                                Get.back();
                                OrderController orderController = Get.put(OrderController());
                                // orderController.orderStatus.value = "PLACED";
                                orderController.nextPage = 1;
                                orderController.GetRestaurantOrderPending(1, "");
                                Get.to(orderListByReport("PLACED"));
                                await _audioCache.fixedPlayer!.stop();
                                // print("laga diye");
                                // LaunchReview.launch(
                                //   androidAppId: "com.gazemartvendor.wedun",);
                                // InAppUpdate.performImmediateUpdate()
                                //     .catchError((e) => showSnack(e.toString()));
                              },
                              child: Text(
                                "Show",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            barrierDismissible: false)
        .then((value) async {
      await _audioCache.fixedPlayer!.stop();
    });
    // return showDialog(
    //     barrierDismissible: false,
    //     context: context,
    //     builder: (BuildContext context) {
    //       return
    //     });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<File> getImage({required String url}) async {
    /// Get Image from server
    final di.Response<List<int>> res = await di.Dio().get<List<int>>(
      url,
      options: di.Options(
        responseType: di.ResponseType.bytes,
      ),
    );

    /// Get App local storage
    final Directory appDir = await getApplicationDocumentsDirectory();

    /// Generate Image Name
    final String imageName = url.split('/').last;

    /// Create Empty File in app dir & fill with new image
    final File file = File(join(appDir.path, imageName));

    file.writeAsBytesSync(res.data as List<int>);

    return file;
  }

  void getSettings() async {
    print("get setting");
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion.value = packageInfo.version;
    print(packageInfo.version);
    ownerRepo.getSettings(accessToken.value).then((value) {
      print("in setting ${value.data!.data!.vendorAndroidVersion!}");
      if (value.data != null) {
        print("Data null nahi aaya ${value.data!.data!.vendorAndroidVersion!}");
        settingData.value = value.data!.data!;
        if (value.data!.data!.maintenanceMode! == "1") {
          Get.offAll(MaintenancePage());
        } else {
          if (value.data!.data!.vendorAndroidVersion! != packageInfo.version) {
            Utility().showUpdate(Get.context!, (value.data!.data!.vendorAndroidForceUpdate! == "1") ? true : false);
          }
        }
      } else {
        // print(value.error!.code);
      }
    });
  }

  Future<void> getStoreStats(String storeId) async {
    isStatsLoading.value = true;
    print("in get store stats");
    print(storeId);
    ownerRepo.getStoreStats((await SessionManager.getAccessToken())!, storeId).then((value) {
      if (value.data != null) {
        storeStatsData.value = value.data!.data!;
        ReportController _ = Get.put(ReportController());
        _.orderPerDay.value = storeStatsData.value.todayOrders.toString();
        _.earningPerDay.value = storeStatsData.value.todayEarnings.toString();
        print("ssssss");
        pieDataMap!.value = {
          "Pending": value.data!.data!.pendingOrders!.toDouble(),
          "Delivered": value.data!.data!.deliveredOrders!.toDouble(),
          "Ongoing": value.data!.data!.ongoingOrders!.toDouble(),
          "Cancelled": value.data!.data!.cancelledOrders!.toDouble(),
        };
        isStatsLoading.value = false;
      } else {
        isStatsLoading.value = false;
        // print(value.error!.code);
      }
    });
  }

  void getEcomStore() {
    print(" getting Ecommerce Store");
    isLoadingRestaurants.value = false;
    ownerRepo.getEcomStore().then((ecom_store_data) async {
      if (ecom_store_data.data != null) {
        print("-------->\n${ecom_store_data.data!.name}");
//        allRestaurant!.value = value.data!.data!.data!;
        adminStore.value = ecom_store_data.data!;
        isLoadingAdminStore.value = false;
        SessionManager.storeEcomAdmin(adminStore.value);
        EcomData? ecomRest = await SessionManager.getEcomAdminStore();
        if (ecomRest != null && ecomRest.id != null) {
          adminStore.value = ecomRest;
          acceptOrders.value = adminStore.value.active!;
          print(acceptOrders.value);
        } else {
          adminStore.value = ecom_store_data.data!;
          isLoadingAdminStore.value = false;
          SessionManager.storeEcomAdmin(adminStore.value);
        }
      } else {
        print(" We didn't got Ecommerce Store");
      }
    });
  }

  void getAllRestaurant() {
    print("get all restaurant");
    isLoadingRestaurants.value = true;
    print(ownerId);
    ownerRepo.getAllRestaurant(accessToken.value, ownerId).then((value) async {
      if (value.data != null) {
        print("after getting restaurant");
        print(value.data!.data!);
        allRestaurant!.value = value.data!.data!.data!;
        isLoadingRestaurants.value = false;
        if (allRestaurant!.length > 0) {
          StoreData? rest = await SessionManager.getRestaurant();
          print("rest ============1>>>>>>>>");
          print(rest);
          if (rest != null && rest.id != null) {
            selectedStore.value = rest;
            acceptOrders.value = selectedStore.value.active!;
            print("data set");
            print(acceptOrders.value);
          } else {
            selectedStore.value = allRestaurant!.elementAt(0);
            print("after selected restaurant");
            acceptOrders.value = allRestaurant!.value.elementAt(0).isOpen!;
            SessionManager.saveRestaurant(selectedStore.value);
            // getSettings();
            // getStoreStats(selectedStore.value.id.toString());
          }
          update();
        } else {
          print("no restaurant");
          selectedStore.value = StoreData(id: null);
          SessionManager.saveRestaurant(selectedStore.value);
          update();
        }
        // update();
        // print("after update");
        // InventoryController controller = Get.put(InventoryController());
        // controller.GetProductCategory(accessToken.value);
        // controller.GetItem("All", 1);
        // // controller.GetAllCategory(accessToken.value);
        // OrderController orderController = Get.put(OrderController());
        // orderController.GetRestaurantOrder(1, accessToken.value);
      } else {
        isLoadingRestaurants.value = false;
        // print(value.error!.code);
      }
    });
  }

  Future<String> createDynamicLinkStore(bool short, String endlink) async {
    isCreatingLink.value = true;

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: Constant.dynamicLink,
      link: Uri.parse(Constant.baseUrl + endlink),
      androidParameters: const AndroidParameters(
        packageName: 'com.maltech.localshoppivendor',
        minimumVersion: 0,
      ),
      iosParameters: const IOSParameters(
        bundleId: 'com.maltech.localshoppivendor',
        minimumVersion: '0',
      ),
    );

    Uri url;
    if (short) {
      final ShortDynamicLink shortLink = await dynamicLinks.buildShortLink(parameters);
      url = shortLink.shortUrl;
    } else {
      url = await dynamicLinks.buildLink(parameters);
    }

    // linkMessage = url.toString();
    isCreatingLink.value = false;

    return url.toString();
  }
}
