

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/sessionmanager.dart';

enum AppState {
  free,
  picked,
  cropped,
}

class addCategoryController extends GetxController {
  TextEditingController nameController = TextEditingController();
  //File image = "" as File;
  File? Image = null;
  RxBool is_hidden = true.obs;
  RxString parentt = "select".obs;
  TextEditingController parentController = TextEditingController();
  TextEditingController restaurant_idController = TextEditingController();
  final addcategoryformKey = GlobalKey<FormState>();
  ImagePicker picker = ImagePicker();
  RxString idType = "Image".obs;
  RxBool ImageSelected = false.obs;
  AppState? state;
  String accessToken = "";

  @override
  Future<void> onInit() async {

    SessionManager.getAccessToken().then((value) {
      if(value == null){
        accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGUyYmI5M2QxNjY1NDAwMjAzYmM5OTYiLCJpYXQiOjE2MjY0MzYwMzIsImV4cCI6MTY4NjQzNTk3MiwidHlwZSI6ImFjY2VzcyJ9.ItdcYc2hABPj9aYSVz0ziQYN7QKGhPLkuKFqxmZpIsQ";
      }else{
        accessToken = value;
      }

    });
    super.onInit();
  }




  Future<void> pickImage() async {
    final selected = await picker.pickImage(source: ImageSource.gallery);
    if (selected == null) return;
    if (idType.value == "Image") {
      Image = File(selected.path);
      ImageSelected.value = true;
      state = AppState.picked;
      update();
      _cropImage(Image!);
    }
  }

  Future<Null> _cropImage(File image) async {
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
    ));
    if (croppedFile != null) {
      if (idType.value == "Image") {
        Image = croppedFile;
      }
      state = AppState.cropped;
      update();
    }
  }


  // AddCategoryC(String isHidden,String parent) {
  //
  //   Utility.showLoadingDialog();
  //   restaurant_idController.text = "60e412ffe0dc6605eff79764";
  //   if(parent == null){
  //     parentController.text = "";
  //   }else{
  //     parentController.text = parent;
  //   }
  //   print(parentController.text);
  //   print('space');
  //   AddCategory.addC(accessToken,nameController.value.text,
  //       Image!,
  //       isHidden,
  //       restaurant_idController.value.text,
  //      // parent,
  //        parentController.value.text
  //   )
  //       .then((value) {
  //
  //     Utility.hideLoadingDialog();
  //     print("succc");
  //     print(value);
  //     print("addcaat");
  //     if(value.data!=null){
  //       print("mess");
  //       Utility.showToastSuccess("Success", value.data!.message);
  //       Get.back();
  //       Get.back();
  //
  //       //Get.to(InventoryPage());
  //       return true;
  //     }
  //     else{
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

