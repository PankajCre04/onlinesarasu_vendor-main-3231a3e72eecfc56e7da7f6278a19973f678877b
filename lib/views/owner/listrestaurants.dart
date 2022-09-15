import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_container/easy_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/loading_dialog.dart';
import 'package:sooooperbusiness/commons/sessionmanager.dart';
import 'package:sooooperbusiness/commons/utils.dart';
import 'package:sooooperbusiness/controllers/maincontroller.dart';
import 'package:sooooperbusiness/controllers/ownercontrollers.dart';
import 'package:sooooperbusiness/controllers/schedule_time_controller.dart';
import 'package:sooooperbusiness/model/StoreData.dart';
import 'package:sooooperbusiness/views/components/my_list_tile.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/Home/scheduleStoreTiming.dart';
import 'package:sooooperbusiness/views/owner/addrestaurant.dart';

class AllRestaurants extends StatelessWidget {
  MainController mainController = Get.find();
  OwnerControllers ownercontroller = Get.put(OwnerControllers());
  ScheduleTimeController scheduleTimeController = Get.put(ScheduleTimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "Add Restaurant",
        onPressed: () {
          removeStoreData();
          Get.back();
          Get.to(AddEditRestaurant("Add", ""));
          clearData();
        },
        tooltip: "Add Restaurant",
        backgroundColor: Constant.secondaryColor,
        child: Icon(
          Icons.add,
          color: Constant.white,
        ),
      ),
      body: ListView.builder(
        shrinkWrap: false,
        itemCount: mainController.allRestaurant!.length,
        itemBuilder: (context, index) {
          return EasyContainer(
            allowOverflow: true,
            color: Constant.white,
            padding: 0,
            elevation: 0,
            borderWidth: 2,
            showBorder: true,
            borderColor: Constant.borderColor,
            child: ListTile(
              onTap: () {
                mainController.selectedStore.value =
                    mainController.allRestaurant!.value.elementAt(index);
                mainController.acceptOrders.value = mainController
                    .allRestaurant!.value
                    .elementAt(index)
                    .isOpen!;
                Utility.showSingleSuccessToast(
                    mainController.allRestaurant!.value.elementAt(index).name! + " Selected");
                SessionManager.saveRestaurant(mainController.selectedStore.value);
                mainController.getStoreStats(mainController.selectedStore.value.id.toString());
                Get.back();
              },
              title: Text(mainController.allRestaurant!.value.elementAt(index).name!),
              subtitle: Text(mainController.allRestaurant!.value.elementAt(index).address!),
              leading: EasyContainer(
                allowOverflow: true,
                color: Constant.white,
                padding: 0,
                elevation: 0,
                width: 80,
                height: 80,
                borderWidth: 1,
                borderColor: Constant.accentColor,
                showBorder: true,
                child: CachedNetworkImage(
                  width: 79,
                  height: 79,
                  imageUrl: mainController.allRestaurant!.value
                      .elementAt(index)
                      .image!,
                  // imageUrl: Constant.imageUrl +
                  //     "/" +
                  //     mainController.allRestaurant!.value
                  //         .elementAt(index)
                  //         .image!,
                  placeholder: (context, url) {
                    return LoadingDialog();
                  },
                  errorWidget: (context, url, error) {
                    return Icon(
                      Icons.error_outline,
                      color: Constant.black,
                    );
                  },
                ),
                // child:mainController.allRestaurant!.elementAt(index).image,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PopupMenuButton(
                    icon: Icon(
                      Icons.more_vert_outlined,
                      color: Constant.greyDark,
                    ),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          value: 'edit',
                          child: Text('Edit'),
                        ),
                        PopupMenuItem(
                          value: 'default',
                          child: Text('Set as Default'),
                        ),
                        PopupMenuItem(
                          value: 'scheduleTime',
                          child: Text('Schedule Timing'),
                        ),
                      ];
                    },
                    onSelected: (String value) async {
                      if (value == "edit") {
                        insertStoreData(index);
                        Get.to(() => AddEditRestaurant(
                            "Edit",
                            mainController.allRestaurant!
                                .elementAt(index)
                                .id
                                .toString()));
                        // Get.to(AddEditRestaurant("Edit",mainController.allRestaurant!.elementAt(index).id.toString()));
                        // addData(index);
                      } else if (value == "scheduleTime") {
                        await insertScheduleTime(index);
                        Get.to(() => ScheduleStoreTiming(
                            mainController.allRestaurant!.elementAt(index).id));
                        // Get.to(ScheduleStoreTiming(mainController.allRestaurant!.elementAt(index).id));
                      } else if (value == "default") {
                        mainController.selectedStore.value = mainController
                            .allRestaurant!.value
                            .elementAt(index);
                        mainController.acceptOrders.value = mainController
                            .allRestaurant!.value
                            .elementAt(index)
                            .isOpen!;
                        Utility.showSingleSuccessToast(mainController
                                .allRestaurant!.value
                                .elementAt(index)
                                .name! +
                            " Selected");
                        SessionManager.saveRestaurant(
                            mainController.selectedStore.value);
                        mainController.getStoreStats(
                            mainController.selectedStore.value.id.toString());
                        Get.back();
                      } else {
                        print(value);
                      }
                    },
                  ),
                  InkWell(
                    onTap: () async {
                      mainController.selectedStore.value =
                          mainController.allRestaurant!.value.elementAt(index);
                      mainController.acceptOrders.value = mainController
                          .allRestaurant!.value
                          .elementAt(index)
                          .isOpen!;
                      Utility.showSingleSuccessToast(mainController
                              .allRestaurant!.value
                              .elementAt(index)
                              .name! +
                          " Selected");
                      SessionManager.saveRestaurant(
                          mainController.selectedStore.value);
                      mainController.getStoreStats(
                          mainController.selectedStore.value.id.toString());
                      Get.back();
                      StoreData? rest = await SessionManager.getRestaurant();
                    },
                    child: Container(
                      child: mainController.selectedStore.value.id ==
                              mainController.allRestaurant!.elementAt(index).id
                          ? Icon(
                              Icons.check_circle,
                              color: Constant.secondaryColor,
                            )
                          : Icon(
                              Icons.check_circle,
                              color: Constant.lightGrey,
                            ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  insertScheduleTime(int index) {
    if (mainController.allRestaurant!.elementAt(index).storeTimings!.length !=
        0) {
      scheduleTimeController.selectedDaysList.clear();
      scheduleTimeController.selectedOpenTime.clear();
      scheduleTimeController.selectedCloseTime.clear();
      for (int i = 0;
          i <
              mainController.allRestaurant!
                  .elementAt(index)
                  .storeTimings!
                  .length;
          i++) {
        scheduleTimeController.selectedDaysList.add(mainController
            .allRestaurant!
            .elementAt(index)
            .storeTimings![i]
            .day!);
        scheduleTimeController.selectedOpenTime.add(mainController
            .allRestaurant!
            .elementAt(index)
            .storeTimings![i]
            .open!);
        scheduleTimeController.selectedCloseTime.add(mainController.allRestaurant!.elementAt(index).storeTimings![i].close!);
      }
    }
  }

  removeStoreData() {
    ownercontroller.nameEditingController.text = "";
    ownercontroller.descriptionEditingController.text = "";
    ownercontroller.phoneEditingController.text = "";
    ownercontroller.emailEditingController.text = "";
    ownercontroller.fullAddressEditingController.text = "";
    ownercontroller.deliveryRadiusEditingController.text = "";
    ownercontroller.selectedCategoryId!.clear();
    ownercontroller.selectedZoneId!.clear();
    ownercontroller.selectedStoreTypeId.value = "";
    ownercontroller.selectedImage.value = File("");
    ownercontroller.isImageSelected.value = false;
  }
  insertStoreData(index) async {
    ownercontroller.selectedCategoryId!.clear();
    ownercontroller.selectedZoneId!.clear();
    ownercontroller.nameEditingController.text =
        mainController.allRestaurant!.elementAt(index).name!;
    ownercontroller.descriptionEditingController.text =
        mainController.allRestaurant!.elementAt(index).description!;
    ownercontroller.phoneEditingController.text =
        mainController.allRestaurant!.elementAt(index).mobile!;
    ownercontroller.emailEditingController.text =
        mainController.allRestaurant!.elementAt(index).email!;
    ownercontroller.fullAddressEditingController.text =
        mainController.allRestaurant!.elementAt(index).address!;
    ownercontroller.deliveryRadiusEditingController.text =
        mainController.allRestaurant!.elementAt(index).deliveryRange.toString();
    for (int i = 0;
        i <
            mainController.allRestaurant!
                .elementAt(index)
                .storeCategories!
                .length;
        i++) {
      print("for me aaya");
      print(mainController.allRestaurant!
          .elementAt(index)
          .storeCategories![i]
          .storeCategoryId);
      ownercontroller.selectedCategoryId!.add(mainController.allRestaurant!.elementAt(index).storeCategories![i].id.toString());
      print(ownercontroller.selectedCategoryId!);
    }

    ownercontroller.selectedStoreTypeId.value = mainController.allRestaurant!
        .elementAt(index)
        .serviceCategoryId
        .toString();
    // for(int i =0;i< ownercontroller.categoryData.value.data!.length;i++){
    //   if(ownercontroller.categoryData.value.data![i].id.toString() == ownercontroller.selectedStoreTypeId.value){
    //     ownercontroller.selectedStoreCategory!.add(ownercontroller.categoryData.value.data![i]);
    //     print(ownercontroller.selectedStoreCategory.toString());
    //   }
    // }
    ownercontroller.isImageSelected.value =
        (mainController.allRestaurant!.elementAt(index).image != null)
            ? true
            : false;
    ownercontroller.selectedImage.value = await mainController.getImage(
        url: mainController.allRestaurant!.elementAt(index).image!);
  }

  // addData(int index){
  //   print(mainController.allRestaurant!.value.elementAt(index).description);
  //   print("dekho");
  //   ownercontroller.nameEditingController.text = mainController.allRestaurant!.value.elementAt(index).name ?? "";
  //   ownercontroller.descriptionEditingController.text = mainController.allRestaurant!.value.elementAt(index).description ?? "";
  //   ownercontroller.phoneEditingController.text = mainController.allRestaurant!.elementAt(index).mobile ?? "";
  //   // ownercontroller.altPhoneEditingController.text = mainController.allRestaurant!.elementAt(index).restaurantPhoneSecondary ?? "";
  //   ownercontroller.fullAddressEditingController.text = mainController.allRestaurant!.elementAt(index).address! ?? "";
  //   ownercontroller.latitude.value = double.parse(mainController.allRestaurant!.elementAt(index).latitude!) ?? 12.23213;
  //   ownercontroller.longitude.value = double.parse(mainController.allRestaurant!.elementAt(index).longitude!) ?? 76.99883;
  //   // ownercontroller.pinCode.value = mainController.allRestaurant!.elementAt(index). ?? "";
  //   // ownercontroller.landMarkEditingController.text = mainController.allRestaurant!.elementAt(index).landmark ?? "";
  //   // ownercontroller.isFeatured.value = mainController.allRestaurant!.elementAt(index).isFeatured ?? false;
  //   // ownercontroller.isVegOnly.value = mainController.allRestaurant!.elementAt(index).vegOnly ?? false;
  //   ownercontroller.isDeliveryEnabled.value = mainController.allRestaurant!.elementAt(index).deliveryEnabled ?? false;
  //   ownercontroller.deliveryRadiusEditingController.text = (mainController.allRestaurant!.elementAt(index).deliveryRadius == null)?
  //   mainController.allRestaurant!.elementAt(index).deliveryRadius.toString() : "";
  //   ownercontroller.isFixedDeliveryCharged.value = (mainController.allRestaurant!.elementAt(index).deliveryChargeType == "Dynamic")?false:true;
  //   ownercontroller.baseDeliveryChargeEditingController.text = (mainController.allRestaurant!.elementAt(index).fixedDeliveryCharge == null)?
  //   mainController.allRestaurant!.elementAt(index).fixedDeliveryCharge.toString() : "";
  //   ownercontroller.avgDeliveryTimeEditingController.text = mainController.allRestaurant!.elementAt(index).avgDeliveryTime ?? "";
  //   ownercontroller.minOrderPriceEditingController.text = (mainController.allRestaurant!.elementAt(index).minOrderPrice == null)?
  //   mainController.allRestaurant!.elementAt(index).minOrderPrice.toString() : "";
  //   ownercontroller.cost2EditingController.text = mainController.allRestaurant!.elementAt(index).aprxPriceForTwo ?? "";
  //   ownercontroller.isTakeAwayEnabled.value = mainController.allRestaurant!.elementAt(index).takeAwayEnabled ?? false;
  //   ownercontroller.isDineInEnabled.value = mainController.allRestaurant!.elementAt(index).dineInEnabled ?? false;
  //   ownercontroller.openTimeEditingController.text = (mainController.allRestaurant!.elementAt(index).openTime == null)?
  //   mainController.allRestaurant!.elementAt(index).openTime:"";
  //   ownercontroller.closeTimeEditingController.text = (mainController.allRestaurant!.elementAt(index).closingTime == null)?
  //   mainController.allRestaurant!.elementAt(index).closingTime:"";
  //   ownercontroller.isCategoryLoaded.value = mainController.allRestaurant!.elementAt(index).category ?? "";
  //   ownercontroller.isImageSelected.value = (mainController.allRestaurant!.elementAt(index).image == null)?
  //       false:true;
  //   ownercontroller.selectedImage = mainController.allRestaurant!.elementAt(index).image ?? File("").obs;
  //   ownercontroller.selectedGalleryImage = mainController.allRestaurant!.elementAt(index).galleryImage  ?? [].obs;
  //   ownercontroller.deliveryRadiusEditingController.text = (mainController.allRestaurant!.elementAt(index).deliveryRadius != null)?mainController.allRestaurant!.elementAt(index).deliveryRadius.toString():"";
  // }
  clearData() {
    print("dekho");
    ownercontroller.nameEditingController.text = "";
    ownercontroller.descriptionEditingController.text = "";
    ownercontroller.phoneEditingController.text = "";
    ownercontroller.altPhoneEditingController.text = "";
    ownercontroller.fullAddressEditingController.text = "";
    ownercontroller.landMarkEditingController.text = "";
    ownercontroller.isFeatured.value = false;
    ownercontroller.isVegOnly.value = false;
    ownercontroller.isDeliveryEnabled.value = false;
    ownercontroller.deliveryRadiusEditingController.text = "";
    ownercontroller.isFixedDeliveryCharged.value = true;
    ownercontroller.baseDeliveryChargeEditingController.text = "";
    ownercontroller.avgDeliveryTimeEditingController.text = "";
    ownercontroller.minOrderPriceEditingController.text = "";
    ownercontroller.cost2EditingController.text = "";
    ownercontroller.isTakeAwayEnabled.value = false;
    ownercontroller.isDineInEnabled.value = false;
    ownercontroller.openTimeEditingController.text = "";
    ownercontroller.closeTimeEditingController.text = "";
    // ownercontroller.isCategoryLoaded.value = false;
    ownercontroller.isImageSelected.value = false;
    ownercontroller.selectedImage = File("").obs; //"" as Rx<File>;
    ownercontroller.selectedGalleryImage = [].obs; //"" as RxList<File>?;
  }
}
