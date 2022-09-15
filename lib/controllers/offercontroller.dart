import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sooooperbusiness/api/repository/promo.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/sessionmanager.dart';
import 'package:sooooperbusiness/commons/utils.dart';
import 'package:sooooperbusiness/controllers/maincontroller.dart';
import 'package:sooooperbusiness/model/more/offers/promodata.dart';
import 'package:dio/dio.dart' as di;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class OfferController extends GetxController {
  RxBool isPromoLoading = false.obs;
  RxString accessToken = "".obs;
  Promo promos = Promo();
  RxList<OfferData> promoDataList = [OfferData()].obs;

  MainController mainController = Get.put(MainController());
  GlobalKey<FormState> addEditOfferFormKey = GlobalKey<FormState>();
  TextEditingController offerCodeController = TextEditingController();
  TextEditingController offerDescriptionController = TextEditingController();
  TextEditingController maxUsePerUserController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController minCartValueController = TextEditingController();
  TextEditingController maxDiscountValueController = TextEditingController();
  TextEditingController totalUsageCountController = TextEditingController();
  RxString discountType = "Select discount type".obs;
  RxString couponType = "Select coupon type".obs;
  Rx<File> selectedCouponImage = File("").obs;
  RxBool isCouponImageSelected = false.obs;
  TextEditingController discountValueController = TextEditingController();
  TextEditingController minOrderValueController = TextEditingController();
  RxBool isPrivate = false.obs;
  RxBool isActive = false.obs;
  RxString idType = "Image".obs;
  RxList<bool> isActiveList = List.filled(10000, false).obs;
  ImagePicker picker = ImagePicker();
  RxList<String>? selectedCoupons = <String>[].obs;

  @override
  Future<void> onInit() async {
    SessionManager.getAccessToken().then((value) {
      print(value);
      accessToken.value = value!;
    });
    super.onInit();
    print("getacccc");
    print('storeID ${Constant.ecomStoreId.toString()}');
    // GetOffer(mainController.adminStore.value.id.toString());
    //GetOffer(accessToken.value,mainController.selectedStore.value.id!);

    //GetItem();
  }

  GetOffer(String storeId) async {
    print("get promo code${Get.find<MainController>().adminStore.value.id.toString()}''");
    isPromoLoading.value = true;
    //Utility.showLoadingDialog();
    await promos.GetPromos(
      accessToken.value,
      // "1"
      storeId,
    ).then((value) {
      Utility.hideLoadingDialog();
      print("CouponLength==================>>>>>>>>>>>>>>");
      print(value.data!.message);
      if (value.data!.message == "Retrieved Successfully") {
        //var result = value.data!.data!.results;
        promoDataList.value = value.data!.data!;

        print("CouponLength==================>>>>>>>>>>>>>>");
        print(value.data!.data!.length);
        print(promoDataList[0].code.toString());
        // parentList!.clear();
        update();

        print("addcaat");
        isPromoLoading.value = false;
        //   Utility.showToastSuccess("Success", value.data!.message);
        return true;
      } else {
        //Utility.showToastError(value.error!.message, "Registration Failed");
        return false;
      }
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  GetEcomOffer() async {
    isPromoLoading.value = true;
    //Utility.showLoadingDialog();
    await promos.GetEcomPromo(
      accessToken.value,
    ).then((value) {
      Utility.hideLoadingDialog();
      print(value.data!.message);
      if (value.data!.message == "Retrieved Successfully") {
        //var result = value.data!.data!.results;
        promoDataList.value = value.data!.data!;
        print(" Get Ecom Offer -->");
        print(value.data!.data!.length);
        print(promoDataList[0].code.toString());
        // parentList!.clear();
        update();
        isPromoLoading.value = false;
        //   Utility.showToastSuccess("Success", value.data!.message);
        return true;
      } else {
        //Utility.showToastError(value.error!.message, "Registration Failed");
        return false;
      }
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print(error);
      printInfo(info: "Error From Controllers");
    });
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

  Future<File> pickImage() async {
    final selected = await picker.getImage(source: ImageSource.gallery);
    if (selected == null) return File("");
    if (idType.value == "Image") {
      selectedCouponImage.value = File(selected.path);
      isCouponImageSelected.value = true;
      // isCategoryImageSelected.value = true;
      // state = AppState.picked;
      update();
      return _cropImage(selectedCouponImage.value);
    } else {
      return File("");
    }
  }

  Future<File> _cropImage(File image) async {
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
      androidUiSettings: AndroidUiSettings(toolbarTitle: 'Cropper', toolbarColor: Constant.secondaryColor, toolbarWidgetColor: Colors.white, initAspectRatio: CropAspectRatioPreset.ratio16x9, lockAspectRatio: true),
      iosUiSettings: IOSUiSettings(
        title: 'Cropper',
      ),
    )) as File?;
    if (croppedFile != null) {
      if (idType.value == "Image") {
        selectedCouponImage.value = croppedFile;
      }
      // state = AppState.cropped;
      update();
    }
    return croppedFile!;
  }

  AddOffer() {
    Utility.showLoadingDialog();
    promos.AddOffer(
      accessToken.value,
      //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGYyNmM2ZjQ0YjBmODAwMjAwZjMwZmIiLCJpYXQiOjE2MjY1MDAyMjAsImV4cCI6MTY4NjUwMDE2MCwidHlwZSI6ImFjY2VzcyJ9.xVIuSiuyhx2FkSwq7xPjsHQCt0gUtoLu6L1ouOqJkHw",
      Constant.isEcom == "0" ? mainController.selectedStore.value.id.toString() : mainController.adminStore.value.id.toString(),
      selectedCouponImage.value,
      offerCodeController.text,
      offerDescriptionController.text,
      maxUsePerUserController.text,
      minCartValueController.text,
      startDateController.text,
      endDateController.text,
      discountType.value,
      (discountType.value == "FREE DELIVERY") ? "0" : discountValueController.text,
      (discountType.value == "FREE DELIVERY") ? "0" : maxDiscountValueController.text,
      (isActive.value) ? "1" : "0",
    ).then((value) {
      Utility.hideLoadingDialog();
      print("succc");
      print(value.data);
      print("addcaat");
      if (value.data != null) {
        print("mess");
        //  Utility.showToastSuccess("Success", value.data!.message);
        Constant.isEcom == "0" ? GetOffer(mainController.selectedStore.value.id!.toString()) : GetEcomOffer();
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

  DeleteOffer(String offerId) {
    //Utility.showLoadingDialog();

    promos.DeleteOffer(
      accessToken.value,
      //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGYyNmM2ZjQ0YjBmODAwMjAwZjMwZmIiLCJpYXQiOjE2MjY1MDAyMjAsImV4cCI6MTY4NjUwMDE2MCwidHlwZSI6ImFjY2VzcyJ9.xVIuSiuyhx2FkSwq7xPjsHQCt0gUtoLu6L1ouOqJkHw",
      // restaurant_idController.value.text,
      offerId,
    ).then((value) {
      // Utility.hideLoadingDialog();
      print("succc");
      print(value);
      print("addcaat");
      if (value.data!.message == "Promo deleted successfully") {
        print("mess");
        Constant.isEcom == "0" ? GetOffer(mainController.selectedStore.value.id!.toString()) : GetEcomOffer();
        //   Utility.showToastSuccess("Success", value.data!.message);

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

  EditOffer(String offerId) {
    Utility.showLoadingDialog();
    promos.EditOffer(
      offerId,
      accessToken.value,
      //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGYyNmM2ZjQ0YjBmODAwMjAwZjMwZmIiLCJpYXQiOjE2MjY1MDAyMjAsImV4cCI6MTY4NjUwMDE2MCwidHlwZSI6ImFjY2VzcyJ9.xVIuSiuyhx2FkSwq7xPjsHQCt0gUtoLu6L1ouOqJkHw",
      Constant.isEcom == "0" ? mainController.selectedStore.value.id.toString() : mainController.adminStore.value.id.toString(),
      selectedCouponImage.value,
      offerCodeController.text,
      offerDescriptionController.text,
      maxUsePerUserController.text,
      minCartValueController.text,
      startDateController.text,
      endDateController.text,
      discountType.value,
      (discountType.value == "FREE DELIVERY") ? "0" : discountValueController.text,
      (discountType.value == "FREE DELIVERY") ? "0" : maxDiscountValueController.text,
      (isActive.value) ? "1" : "0",
    ).then((value) {
      Utility.hideLoadingDialog();
      print("succc");
      print(value);
      print("addcaat");
      if (value.data != null) {
        print("mess");
        //  Utility.showToastSuccess("Success", value.data!.message);
        Constant.isEcom == "0" ? GetOffer(mainController.selectedStore.value.id!.toString()) : GetEcomOffer();
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

  UpdateOfferStatus(String status, String offerId) {
    print(status);
    Utility.showLoadingDialog();
    promos.UpdateOfferStatus(
      offerId,
      accessToken.value,
      status,
    ).then((value) {
      Utility.hideLoadingDialog();
      print("succc");
      print(value);
      print("addcaat");
      if (value.data != null) {
        print("mess");
        // Utility.showToastSuccess("Success", value.data!.message);
        String ownerId = "";
        Constant.isEcom == "0" ? GetOffer(mainController.selectedStore.value.id!.toString()) : GetEcomOffer();
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
}
