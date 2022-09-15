import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:place_picker/place_picker.dart';
import 'package:sooooperbusiness/api/repository/ownerrepo.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/sessionmanager.dart';
import 'package:sooooperbusiness/commons/utils.dart';
import 'package:sooooperbusiness/controllers/maincontroller.dart';
import 'package:sooooperbusiness/model/StoreCategoryData.dart';

// import 'package:sooooperbusiness/model/StoreCategoryData.dart';
import 'package:sooooperbusiness/model/StoreTypeData.dart';
import 'package:sooooperbusiness/model/StoreTypeResponse.dart';
import 'package:sooooperbusiness/model/storeCategoryModel.dart';

// import 'package:sooooperbusiness/model/storeCategoryModel.dart';
import 'package:sooooperbusiness/model/storeRealCategoryResponse.dart';
import 'package:sooooperbusiness/model/zone_response.dart';

import '../model/store_category_response.dart';

enum AppState {
  free,
  picked,
  cropped,
}

class OwnerControllers extends GetxController {
  OwnerRepo ownerRepo = OwnerRepo();
  GlobalKey<FormState> addRestaurantKey = GlobalKey<FormState>();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  TextEditingController avgDeliveryTimeEditingController = TextEditingController();

  TextEditingController cost2EditingController = TextEditingController();
  TextEditingController fullAddressEditingController = TextEditingController();
  TextEditingController landMarkEditingController = TextEditingController();
  RxString pinCode = "".obs;
  RxString landMark = "".obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxBool isFeatured = false.obs;
  RxBool isVegOnly = false.obs;
  TextEditingController minOrderPriceEditingController = TextEditingController();
  TextEditingController deliveryRadiusEditingController = TextEditingController();
  TextEditingController deliveryChargeTypeEditingController = TextEditingController();

  // RxList deliveryType = ["Fixed", "Dynamic"].obs;
  RxString selectedDeliveryType = "Fixed".obs;
  RxBool isFixedDeliveryCharged = true.obs;
  TextEditingController fixedDeliveryChargeEditingController = TextEditingController();
  TextEditingController baseDeliveryChargeEditingController = TextEditingController();
  TextEditingController baseDeliveryDistanceEditingController = TextEditingController();
  TextEditingController extraDeliveryChargeEditingController = TextEditingController();
  TextEditingController extraDeliveryDistanceEditingController = TextEditingController();
  TextEditingController openTimeEditingController = TextEditingController();
  TextEditingController closeTimeEditingController = TextEditingController();
  RxBool isDineInEnabled = true.obs;
  RxBool isDeliveryEnabled = true.obs;
  RxBool isTakeAwayEnabled = true.obs;
  RxString openTime = ''.obs;
  RxString closeTime = ''.obs;
  RxList? selectedGalleryImage = [].obs;

  // RxList<StoreCategoryData>? selectedCategoryId = [StoreCategoryData()].obs;
  List<MultiSelectItem> itemsCategory = [];
  List<StoreCategoryData>? selectedStoreCategory = [];
  List<StoreTypeData> storeServiceTypeData = [StoreTypeData()].obs;
  RxBool isCategoryLoaded = false.obs;
  RxBool isTypeLoaded = false.obs;
  RxList<String> coordinates = [""].obs;
  RxList<String> categoryItems = ["Category1", "Category2", "Category3", "Category4", "Category5"].obs;
  Rx<StoreCategoryResponse> categoryData = StoreCategoryResponse().obs;
  RxList<String>? selectedCategoryId = <String>[].obs;
  Rx<StoreRealCategoryResponse> storeCategoryRealData = StoreRealCategoryResponse().obs;

  // zone id for the store location*****************************///
  RxList<String>? selectedZoneId = <String>[].obs;
  RxBool zoneAreaSelected = false.obs;
  List<MultiSelectItem> zoneArea = [];
  RxList<String> zone = ["Zone1", "Zone2", "Zone3", "Zone4", "Zone5"].obs;
  Rx<GetZoneResponse> zoneData = GetZoneResponse().obs;

  Rx<File> selectedImage = File("").obs;
  RxString selectedStoreTypeId = "".obs;
  RxBool isImageSelected = false.obs;
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController altPhoneEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  ImagePicker picker = ImagePicker();

  AppState? state;
  String ownerId = "";
  String accessToken = "";
  String userName = "";
  String userEmail = "";
  MainController mainController = Get.put(MainController());

  @override
  Future<void> onInit() async {
    // TODO: implement onInit

    itemsCategory = categoryItems.map((item) => MultiSelectItem<String>(item, item)).toList();
    update();
    getMerchantCategory();
    getZone();
    getStoreCategory();
    getStoreServiceType();
    SessionManager.getOwnerID().then((value) {
      ownerId = value!;
    });
    SessionManager.getAccessToken().then((value) {
      accessToken = value!;
    });
    SessionManager.getUserName().then((value) {
      userName = value!;
    });
    SessionManager.getUserEmail().then((value) {
      userEmail = value!;
    });
    SessionManager.getLat().then((value) {
      latitude.value = value!;
      update();
    });
    SessionManager.getLng().then((value) {
      longitude.value = value!;
      update();
    });
    super.onInit();
  }

  void showPlacePicker() async {
    // LocationResult result = await Navigator.of(context).push(MaterialPageRoute(
    //     builder: (context) =>
    //         PlacePicker("YOUR API KEY",
    //           displayLocation: customLocation,
    //         )));
    Get.to(PlacePicker(
      Constant.googleMapKey,
      displayLocation: LatLng(latitude.value, longitude.value),
    ))!
        .then((value) {
      print(value);
      LocationResult result = value;
      fullAddressEditingController.text = result.formattedAddress!;
      latitude.value = result.latLng!.latitude;
      longitude.value = result.latLng!.longitude;
      pinCode.value = result.postalCode!;
      update();
    });

    // Handle the result in your way
  }

  void getZone() async {
    isCategoryLoaded.value = false;
    zone.clear();
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low).then((Position position) {
      // print("position is ${position.latitude}");
      // print("position is ${position.longitude}");
      ownerRepo.GetZone(
        accessToken,
        position.latitude.toDouble(),
        position.longitude.toDouble(),
      ).then((value) {
        if (value.data != null) {
          if (value.data!.success!) {
            for (int i = 0; i < value.data!.data!.length; i++) {
              zone.add(value.data!.data![i].title!);
            }
            // print("zone data");
            print(value.data!.data!.toString());
            // zoneArea = zoneData.value.data!.map((item)=> MultiSelectItem<GetZoneResponse>(item,item.title.toString())).toList();
            // zoneArea = zoneData.value.data!.map((item)=> MultiSelectItem<GetZoneResponse>(item,item.title.toString())).toList();
            zoneData.value = value.data!;
            isCategoryLoaded.value = true;
            zoneAreaSelected.value = true;
            update();
          }
        } else {
          isCategoryLoaded.value = true;
          update();
        }
      });
    });
  }

  void getStoreCategory() {
    isCategoryLoaded.value = false;
    categoryItems.clear();
    itemsCategory.clear();
    ownerRepo.getStoreRealCategory().then((value) {
      if (value.data != null) {
        if (value.data!.success!) {
          for (int i = 0; i < value.data!.data!.length; i++) {
            categoryItems.add(value.data!.data![i].name!);
          }
          storeCategoryRealData.value = value.data!;
          itemsCategory = storeCategoryRealData.value.data!.map((item) => MultiSelectItem<StoreCategoryData>(item, item.name.toString())).toList();
          isCategoryLoaded.value = true;
          update(itemsCategory);
          print(isCategoryLoaded.value);
          print("catgory loadeddddd");
          isCategoryLoaded.value = true;
        }
      } else {
        isCategoryLoaded.value = true;
        print("API Error in Merchant Category");
      }
    }).onError((error, stackTrace) {
      isCategoryLoaded.value = true;
    });
  }

  void getMerchantCategory() {
    isCategoryLoaded.value = false;
    // categoryItems.clear();
    // itemsCategory.clear();
    ownerRepo.getStoreCategory().then((value) {
      if (value.data != null) {
        if (value.data!.success!) {
          for (int i = 0; i < value.data!.data!.length; i++) {
            // categoryItems.add(value.data!.data![i].name!);
          }
          categoryData.value = value.data!;
          // itemsCategory = categoryItems
          //     .map((item) => MultiSelectItem<String>(item, item))
          //     .toList();
          isCategoryLoaded.value = true;
          update(itemsCategory);
          print(isCategoryLoaded.value);
          print("catgory loaded");
          isCategoryLoaded.value = true;
        }
      } else {
        isCategoryLoaded.value = true;
        print("API Error in Merchant Category");
      }
    }).onError((error, stackTrace) {
      isCategoryLoaded.value = true;
    });
  }

  void getStoreServiceType() {
    isTypeLoaded.value = false;
    ownerRepo.getStoreServiceType().then((value) {
      if (value.data != null) {
        if (value.data!.success!) {
          storeServiceTypeData = value.data!.data!;
          // for(int i=0;i<value.data!.data!.length;i++){
          //   categoryItems.add(value.data!.data![i].name!);
          // }

          // itemsCategory = categoryItems
          //     .map((item) => MultiSelectItem<String>(item, item))
          //     .toList();
          isTypeLoaded.value = true;
          // update(itemsCategory);
          // print(isCategoryLoaded.value);
          print("catgory loaded");
          isTypeLoaded.value = true;
        }
      } else {
        isTypeLoaded.value = true;
        print("API Error in Store Type");
      }
    }).onError((error, stackTrace) {
      isTypeLoaded.value = true;
    });
  }

  void addStore() {
    print("in add store");
    Utility.showLoadingDialog();
    List<File> gallerySelection = List.empty(growable: true);
    if (selectedGalleryImage!.isNotEmpty) {
      for (int i = 0; i < selectedGalleryImage!.length; i++) {
        if (selectedGalleryImage!.elementAt(i) != null) {
          gallerySelection.add(selectedGalleryImage!.elementAt(i));
        }
      }
    }
    // List<String> selectedCategory = List.empty(growable: true);
    // if (selectedCategoryId!.isNotEmpty) {
    //   for (int i = 0; i < selectedCategoryId!.length; i++) {
    //     selectedCategory.add(selectedCategoryId!.elementAt(i));
    //   }
    // }

    // if (selectedCategoryId!.isNotEmpty) {
    //   for(int i=0;i<storeCategoryRealData.value.data!.data!.length;i++){
    //     print("store category");
    //     if(selectedCategoryId!.contains(storeCategoryRealData.value.data!.data![i].id.toString())){
    //       selectedCategory.add(storeCategoryRealData.value.data!.data![i].id.toString());
    //     }
    //   }
    // }
    ownerRepo
        .addStore(
            // mainController.selectedStore.value.id.toString(),
            accessToken,
            ownerId,
            selectedStoreTypeId.value,
            selectedCategoryId!,
            nameEditingController.text,
            descriptionEditingController.text,
            selectedImage.value,
            latitude.value.toString(),
            longitude.value.toString(),
            fullAddressEditingController.text,
            deliveryRadiusEditingController.text,
            phoneEditingController.text,
            emailEditingController.text,
            selectedZoneId!)
        .then((value) {
      Utility.hideLoadingDialog();
      // MainController mainController = Get.put(MainController());
      mainController.getAllRestaurant();
      Get.back();
      if (value.data!.message == "Store created successfully") {
        Utility.showToastSuccess("Store Added Successful", value.data!.message);
        //Get.back();
      } else if (value.data!.message == "The given data was invalid.") {
        Utility.showToastError(value.error!.message, "Store Failed");
      }
      print(value);
    }).catchError((onError) {
      print(onError);
    });
  }

  void editStore(String storeId) {
    Utility.showLoadingDialog();
    List<String> selectedCategory = List.empty(growable: true);
    // if (selectedCategoryId!.isNotEmpty) {
    //   for (int i = 0; i < selectedCategoryId!.length; i++) {
    //     selectedCategory.add(selectedCategoryId!.elementAt(i));
    //   }
    // }

    // if (selectedCategoryId!.isNotEmpty) {
    //   for(int i=0;i<storeCategoryRealData.value.data!.data!.length;i++){
    //     print("store category");
    //     if(selectedCategoryId!.contains(storeCategoryRealData.value.data!.data![i].name)){
    //       selectedCategory.add(storeCategoryRealData.value.data!.data![i].id.toString());
    //     }
    //   }
    // }
    ownerRepo
        .editStore(
      storeId,
      accessToken,
      ownerId,
      selectedStoreTypeId.value,
      selectedCategoryId!,
      nameEditingController.text,
      descriptionEditingController.text,
      selectedImage.value,
      latitude.value.toString(),
      longitude.value.toString(),
      fullAddressEditingController.text,
      deliveryRadiusEditingController.text,
      phoneEditingController.text,
      emailEditingController.text,
      selectedZoneId!,
    )
        .then((value) {
      Utility.hideLoadingDialog();
      print("succc");
      print(value.data);
      print("addcaat");
      Get.back();
      Get.back();
      // Utility.showToastSuccess("Success", value.data!.message);
      // mainController.getAllRestaurant();
      if (value != null) {
        print("mess");
        // if(itemList.contains(value.data!.data!.id)){
        //   itemList.
        // }
        // allRestaurant[index] = value.data!.data!;
        // GetItem("All", 1);

        // Get.back();

        //Get.to(InventoryPage());
        return true;
      } else {
        // Utility.showToastError(value.error!.message, " Failed");
        return false;
      }
      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print("errorr");
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  // void EditRestaurant() {
  //   Utility.showLoadingDialog();
  //   List<File> gallerySelection = List.empty(growable: true);
  //   if (selectedGalleryImage!.isNotEmpty) {
  //     for (int i = 0; i < selectedGalleryImage!.length; i++) {
  //       if (selectedGalleryImage!.elementAt(i) != null) {
  //         gallerySelection.add(selectedGalleryImage!.elementAt(i));
  //       }
  //     }
  //   }
  //   List<String> selectedCategory = List.empty(growable: true);
  //   if (selectedCategoryId!.isNotEmpty) {
  //     for (int i = 0; i < selectedCategoryId!.length; i++) {
  //       selectedCategory.add(selectedCategoryId!.elementAt(i));
  //     }
  //   }
  //
  //   coordinates.value = [longitude.value.toString(),latitude.value.toString()];
  //   print(coordinates);
  //   print("cordei");
  //
  //   ownerRepo
  //       .EditRestaurants(
  //       mainController.selectedStore.value.id.toString(),
  //       accessToken,
  //       ownerId,
  //       nameEditingController.text,
  //       descriptionEditingController.text,
  //       avgDeliveryTimeEditingController.text,
  //       cost2EditingController.text,
  //       fullAddressEditingController.text,
  //       pinCode.value,
  //       landMarkEditingController.text,
  //       // latitude.value,
  //       // longitude.value,
  //       coordinates,
  //       isFeatured.value,
  //       isVegOnly.value,
  //       minOrderPriceEditingController.text,
  //       deliveryRadiusEditingController.text,
  //       selectedDeliveryType.value,
  //       fixedDeliveryChargeEditingController.text,
  //       baseDeliveryChargeEditingController.text,
  //       baseDeliveryDistanceEditingController.text,
  //       extraDeliveryChargeEditingController.text,
  //       extraDeliveryDistanceEditingController.text,
  //       isDineInEnabled.value,
  //       isTakeAwayEnabled.value,
  //       isDeliveryEnabled.value,
  //       openTime.value,
  //       closeTime.value,
  //       gallerySelection,
  //       selectedCategory,
  //       selectedImage.value,
  //       phoneEditingController.text,
  //       altPhoneEditingController.text)
  //       .then((value) {
  //     Utility.hideLoadingDialog();
  //
  //     print(value);
  //     print(value.data!.message);
  //
  //     Get.back();
  //     Get.back();
  //
  //     if (value.data!.message == "Restaurant updated successfully") {
  //
  //       Utility.showToastSuccess(
  //           "Restaurant updated successfully", value.data!.message);
  //
  //       //Get.back();
  //       print("blablaaa");
  //     } else {
  //       Utility.showToastError(value.error!.message, "Restaurant Failed");
  //     }
  //     print(value);
  //   }).catchError((onError) {
  //     print(onError);
  //   });
  // }

  Future<void> pickImage() async {
    final selected = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (selected == null) {
      state == AppState.free;
      return;
    } else {
      state == AppState.picked;
      selectedImage.value = File(selected.path);
      isImageSelected.value = true;
      state = AppState.picked;
      update();
      _cropImage(selectedImage.value);
    }
  }

  Future<void> pickGalleryImages() async {
    final selected = await picker.pickMultiImage(maxHeight: 1000, maxWidth: 1000);
    if (selected == null) {
      state == AppState.free;
      return;
    } else if (selected.length == 0) {
      state == AppState.free;
      return;
    } else {
      for (int i = 0; i < selected.length; i++) {
        selectedGalleryImage!.add(File(selected.elementAt(i).path));
      }
      state = AppState.free;
      update();
    }
  }

  Future<Null> _cropImage(File image) async {
    File? croppedFile = (await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatioPresets: Platform.isAndroid
            ? [CropAspectRatioPreset.square, CropAspectRatioPreset.ratio3x2, CropAspectRatioPreset.original, CropAspectRatioPreset.ratio4x3, CropAspectRatioPreset.ratio16x9]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(toolbarTitle: 'Cropper', toolbarColor: Constant.secondaryColor, toolbarWidgetColor: Colors.white, initAspectRatio: CropAspectRatioPreset.original, lockAspectRatio: true),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        )));
    if (croppedFile != null) {
      isImageSelected.value = true;
      selectedImage.value = croppedFile;
      state = AppState.cropped;
      update();
    }
  }

  UpdateStoreStatus(bool isOpen) {
    //Utility.showLoadingDialog();

    ownerRepo.UpdateStoreStatus(
      accessToken,
      //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGYyNmM2ZjQ0YjBmODAwMjAwZjMwZmIiLCJpYXQiOjE2MjY1MDAyMjAsImV4cCI6MTY4NjUwMDE2MCwidHlwZSI6ImFjY2VzcyJ9.xVIuSiuyhx2FkSwq7xPjsHQCt0gUtoLu6L1ouOqJkHw",
      (isOpen) ? "1" : "0",
      // restaurant_idController.value.text,
      Constant.isEcom == "0" ? mainController.selectedStore.value.id.toString() : mainController.adminStore.value.id.toString(),
    ).then((value) {
      // Utility.hideLoadingDialog();
      print("succc");
      print(value);
      print("addcaat");
      if (value.data != null) {
        print("mess");
        // Utility.showToastSuccess("Success", value.data!.message);

        //Get.to(InventoryPage());
        return true;
      } else {
        Utility.showToastError(value.error!.message, "Failed");
        return false;
      }

      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }
}
