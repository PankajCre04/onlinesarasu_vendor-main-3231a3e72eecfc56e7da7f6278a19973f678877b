import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:sooooperbusiness/api/repository/inventoryrepo.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/sessionmanager.dart';
import 'package:sooooperbusiness/commons/utils.dart';
import 'package:sooooperbusiness/controllers/inventory/inventoryController.dart';
import 'package:sooooperbusiness/controllers/maincontroller.dart';
import 'package:sooooperbusiness/model/more/inventory/addoncategorydata.dart';

import '../getstartedcontroller.dart';

class AddonController extends GetxController {
  RxList<bool> acceptOrders = List.filled(10000, false).obs;
  GlobalKey<FormState> addEditAddonCategoryFormKey = GlobalKey<FormState>();
  // TextEditingController addonCategoryNameController = TextEditingController();
  // TextEditingController addonCategoryDescriptionController =
  //     TextEditingController();
  TextEditingController variantNameController = TextEditingController();
  TextEditingController variantPriceController = TextEditingController();
  TextEditingController variantDiscountPriceController = TextEditingController();
  TextEditingController variantQuantityController = TextEditingController();
  RxString addonCategoryType = "Select Addon Category type".obs;
  TextEditingController addonCategoryMinCount = TextEditingController();
  TextEditingController addonCategoryMaxCount = TextEditingController();
  RxBool isAddonLoading = false.obs;
  MainController mainController = Get.put(MainController());
  RxList<AddonCategoryData> addonData = [AddonCategoryData()].obs;
  InventoryRepo Addon = InventoryRepo();
  RxString accessToken = "".obs;
  List<MultiSelectItem> addOnCategoryMultiSelectItem = [];
  GlobalKey<FormState> addEditAddonCategoryItemFormKey = GlobalKey<FormState>();
  TextEditingController addonCategoryItemNameController =
      TextEditingController();
  TextEditingController addonCategoryItemPriceController =
      TextEditingController();
  Rx<File> selectedVariantImage = File("").obs;
  RxBool isVariantImageSelected = false.obs;
  ImagePicker picker = ImagePicker();
  RxString idType = "Image".obs;
  // AppState? state;
  RxString variantProductId = "".obs;
  InventoryController inventoryController = Get.put(InventoryController());

  @override
  Future<void> onInit() async {
    Addon = InventoryRepo();
    SessionManager.getAccessToken().then((value) {
      print(value);
      accessToken.value = value!;
    });
    // GetAddon();
    super.onInit();
  }

  // GetAddon() async {
  //   isAddonLoading.value = true;
  //   await Addon.GetAddon(
  //     mainController.selectedStore.value.id.toString(),
  //   ).then((value) {
  //     Utility.hideLoadingDialog();
  //     print(value);
  //     print(value.data!.message);
  //     if (value.data!.message ==
  //         "Restaurant add on details fetched successfully") {
  //       addonData.value = value.data!.data!;
  //       isAddonLoading.value = false;
  //       Utility.showToastSuccess("Success", value.data!.message);
  //       addOnCategoryMultiSelectItem = addonData.value
  //           .map((item) => MultiSelectItem<String>(item.id!, item.name!))
  //           .toList();
  //       // Get.to(InventoryPage());
  //       return true;
  //     } else {
  //       //Utility.showToastError(value.error!.message, "Registration Failed");
  //       return false;
  //     }
  //   }).catchError((error) {
  //     Utility.hideLoadingDialog();
  //     print(error);
  //     printInfo(info: "Error From Controllers");
  //   });
  // }

  Future<File> pickImage() async {
    final selected = await picker.getImage(source: ImageSource.gallery);
    if (selected == null) return File("");
    if (idType.value == "Image") {
      selectedVariantImage.value = File(selected.path);
      isVariantImageSelected.value = true;
      isVariantImageSelected.value = true;
      // state = AppState.picked;
      update();
      return _cropImage(selectedVariantImage.value);
    }else{
      return File("");
    }
  }

  Future<File> _cropImage(File image) async {
    File? croppedFile = (await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatioPresets: Platform.isAndroid
        ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
        ]
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
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Constant.secondaryColor,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.ratio16x9,
          lockAspectRatio: true),
      iosUiSettings: IOSUiSettings(
        title: 'Cropper',
      )

    )) as File?;
    if (croppedFile != null) {
      if (idType.value == "Image") {
        selectedVariantImage.value = croppedFile;
      }
      // state = AppState.cropped;
      update();
    }
    return croppedFile!;
  }

  AddVariant(index, variantIndex) {
    print("variant bhau");
    Utility.showLoadingDialog();
    Addon.AddVariant(
      //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGYyNmM2ZjQ0YjBmODAwMjAwZjMwZmIiLCJpYXQiOjE2MjY1MDAyMjAsImV4cCI6MTY4NjUwMDE2MCwidHlwZSI6ImFjY2VzcyJ9.xVIuSiuyhx2FkSwq7xPjsHQCt0gUtoLu6L1ouOqJkHw",
      variantProductId.value,
      variantNameController.text,
      variantPriceController.text,
      variantDiscountPriceController.text,
      variantQuantityController.text,
      selectedVariantImage.value
    ).then((value) {
      Utility.hideLoadingDialog();
      print("below is variant data");
      print(value);
      if (value.data != null) {
        print("messssss");
        // Utility.showToastSuccess("Success", value.data!.message);
        // inventoryController.itemList[index].variants!.add(value.data!.data!);
        inventoryController.GetItem("All",1);
        Get.back();
        Get.back();
        //Get.to(InventoryPage());
        return true;
      } else {
        Utility.showToastError(value.error!.message, "Registration Failed");
        return false;
      }

      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  AddVariantWithoutImage(index, variantIndex) {
    print("variant bhau");
    Utility.showLoadingDialog();
    Addon.AddVariantWithoutImage(
      //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGYyNmM2ZjQ0YjBmODAwMjAwZjMwZmIiLCJpYXQiOjE2MjY1MDAyMjAsImV4cCI6MTY4NjUwMDE2MCwidHlwZSI6ImFjY2VzcyJ9.xVIuSiuyhx2FkSwq7xPjsHQCt0gUtoLu6L1ouOqJkHw",
        variantProductId.value,
        variantNameController.text,
        variantPriceController.text,
        variantDiscountPriceController.text,
        variantQuantityController.text,
        // selectedVariantImage.value
    ).then((value) {
      Utility.hideLoadingDialog();
      print("below is variant data");
      print(value);
      if (value.data != null) {
        print("messssss");
        // Utility.showToastSuccess("Success", value.data!.message);
        // inventoryController.itemList[index].variants!.add(value.data!.data!);
        inventoryController.GetItem("All",1);
        Get.back();
        Get.back();
        //Get.to(InventoryPage());
        return true;
      } else {
        Utility.showToastError(value.error!.message, "Registration Failed");
        return false;
      }

      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  EditVariant(String variantId,int index, int variantIndex) {

    Utility.showLoadingDialog();
    Addon.EditVariant(
        variantId,
        variantProductId.value,
        variantNameController.text,
        variantPriceController.text,
        variantDiscountPriceController.text,
        variantQuantityController.text,
        selectedVariantImage.value
    ).then((value) {
      Utility.hideLoadingDialog();
      if (value.data != null) {
        print("mess");
        // Utility.showToastSuccess("Success", value.data!.message);
        // inventoryController.itemList[index].variants![variantIndex] = value.data!.data!;
        inventoryController.GetItem("All",1);
        Get.back();
        Get.back();

        //Get.to(InventoryPage());
        return true;
      } else {
        Utility.showToastError(value.error!.message, "Registration Failed");
        return false;
      }

      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  EditVariantWithoutImage(String variantId,int index, int variantIndex) {

    Utility.showLoadingDialog();
    Addon.EditVariantWithoutImage(
        variantId,
        variantProductId.value,
        variantNameController.text,
        variantPriceController.text,
        variantDiscountPriceController.text,
        variantQuantityController.text,
        // selectedVariantImage.value
    ).then((value) {
      Utility.hideLoadingDialog();
      if (value.data != null) {
        print("mess");
        // Utility.showToastSuccess("Success", value.data!.message);
        // inventoryController.itemList[index].variants![variantIndex] = value.data!.data!;
        inventoryController.GetItem("All",1);
        Get.back();
        Get.back();

        //Get.to(InventoryPage());
        return true;
      } else {
        Utility.showToastError(value.error!.message, "Registration Failed");
        return false;
      }

      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  EditVariantStatus(String variantId,bool status) {

    Utility.showLoadingDialog();
    Addon.EditVariantStatus(
        variantId,
        (status)?"1":"0"
    ).then((value) {
      Utility.hideLoadingDialog();
      if (value.data != null) {
        print("mess");
        // Utility.showToastSuccess("Success", value.data!.message);

        //Get.to(InventoryPage());
        return true;
      } else {
        Utility.showToastError(value.error!.message, "Registration Failed");
        return false;
      }

      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  // AddAddonCategoryItem(String categoryId) {
  //   Utility.showLoadingDialog();
  //   Addon.AddAddonCategoryItem(
  //     //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGYyNmM2ZjQ0YjBmODAwMjAwZjMwZmIiLCJpYXQiOjE2MjY1MDAyMjAsImV4cCI6MTY4NjUwMDE2MCwidHlwZSI6ImFjY2VzcyJ9.xVIuSiuyhx2FkSwq7xPjsHQCt0gUtoLu6L1ouOqJkHw",
  //     addonCategoryItemNameController.text,
  //     addonCategoryItemPriceController.text,
  //     categoryId,
  //   ).then((value) {
  //     Utility.hideLoadingDialog();
  //     if (value.data != null) {
  //       print("mess");
  //       Utility.showToastSuccess("Success", value.data!.message);
  //       GetAddon();
  //       Get.back();
  //       Get.back();
  //
  //       //Get.to(InventoryPage());
  //       return true;
  //     } else {
  //       Utility.showToastError(value.error!.message, "Registration Failed");
  //       return false;
  //     }
  //
  //     printInfo(info: "Data from Auth Controller");
  //   }).catchError((error) {
  //     Utility.hideLoadingDialog();
  //     print(error);
  //     printInfo(info: "Error From Controllers");
  //   });
  // }

  // EditAddonCategoryItem(String categoryItemId, String id) {
  //   Utility.showLoadingDialog();
  //   Addon.EditAddonCategoryItem(
  //           //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGYyNmM2ZjQ0YjBmODAwMjAwZjMwZmIiLCJpYXQiOjE2MjY1MDAyMjAsImV4cCI6MTY4NjUwMDE2MCwidHlwZSI6ImFjY2VzcyJ9.xVIuSiuyhx2FkSwq7xPjsHQCt0gUtoLu6L1ouOqJkHw",
  //           addonCategoryItemNameController.text,
  //           addonCategoryItemPriceController.text,
  //           categoryItemId,
  //           id)
  //       .then((value) {
  //     Utility.hideLoadingDialog();
  //     if (value.data != null) {
  //       print("mess");
  //       Utility.showToastSuccess("Success", value.data!.message);
  //       GetAddon();
  //       Get.back();
  //       Get.back();
  //
  //       //Get.to(InventoryPage());
  //       return true;
  //     } else {
  //       Utility.showToastError(value.error!.message, "Registration Failed");
  //       return false;
  //     }
  //
  //     printInfo(info: "Data from Auth Controller");
  //   }).catchError((error) {
  //     Utility.hideLoadingDialog();
  //     print(error);
  //     printInfo(info: "Error From Controllers");
  //   });
  // }

  // DeleteAddonCategory(String categoryId) {
  //   //Utility.showLoadingDialog();
  //
  //   Addon.DeleteAddonCategory(
  //     //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGYyNmM2ZjQ0YjBmODAwMjAwZjMwZmIiLCJpYXQiOjE2MjY1MDAyMjAsImV4cCI6MTY4NjUwMDE2MCwidHlwZSI6ImFjY2VzcyJ9.xVIuSiuyhx2FkSwq7xPjsHQCt0gUtoLu6L1ouOqJkHw",
  //     // restaurant_idController.value.text,
  //     categoryId,
  //   ).then((value) {
  //     // Utility.hideLoadingDialog();
  //     print("succc");
  //     print(value);
  //     print("addcaat");
  //     if (value.data!.message == "Add On Category deleted Successfully") {
  //       print("mess");
  //       GetAddon();
  //       Utility.showToastSuccess("Success", value.data!.message);
  //
  //       //Get.to(InventoryPage());
  //       return true;
  //     } else {
  //       Utility.showToastError(value.error!.message, "Registration Failed");
  //       return false;
  //     }
  //
  //     printInfo(info: "Data from Auth Controller");
  //   }).catchError((error) {
  //     Utility.hideLoadingDialog();
  //     print(error);
  //     printInfo(info: "Error From Controllers");
  //   });
  // }

  // DeleteAddonCategoryItem(String categoryItemId) {
  //   //Utility.showLoadingDialog();
  //
  //   Addon.DeleteAddonCategoryItem(
  //     //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGYyNmM2ZjQ0YjBmODAwMjAwZjMwZmIiLCJpYXQiOjE2MjY1MDAyMjAsImV4cCI6MTY4NjUwMDE2MCwidHlwZSI6ImFjY2VzcyJ9.xVIuSiuyhx2FkSwq7xPjsHQCt0gUtoLu6L1ouOqJkHw",
  //     // restaurant_idController.value.text,
  //     categoryItemId,
  //   ).then((value) {
  //     // Utility.hideLoadingDialog();
  //     print("succc");
  //     print(value);
  //     print("addcaat");
  //     if (value.data!.message == "Add On Category deleted Successfully") {
  //       print("mess");
  //       GetAddon();
  //       Utility.showToastSuccess("Success", value.data!.message);
  //
  //       //Get.to(InventoryPage());
  //       return true;
  //     } else {
  //       Utility.showToastError(value.error!.message, "Registration Failed");
  //       return false;
  //     }
  //
  //     printInfo(info: "Data from Auth Controller");
  //   }).catchError((error) {
  //     Utility.hideLoadingDialog();
  //     print(error);
  //     printInfo(info: "Error From Controllers");
  //   });
  // }
}
