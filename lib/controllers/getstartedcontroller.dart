import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:sooooperbusiness/api/repository/ownerrepo.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/sessionmanager.dart';
import 'package:sooooperbusiness/commons/utils.dart';
import 'package:sooooperbusiness/controllers/authcontrollers.dart';
import 'package:sooooperbusiness/model/OwnerData.dart';
import 'package:sooooperbusiness/model/business_category.dart';
import 'package:sooooperbusiness/model/business_type.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:sooooperbusiness/model/owner.dart';

enum AppState {
  free,
  picked,
  cropped,
}

class GetStartedController extends GetxController {
  RxInt currentPosition = 0.obs;
  OwnerRepo ownerRepo = OwnerRepo();
  RxInt totalSteps = 4.obs;
  RxList<BusinessType> businessType = [
    BusinessType(name: "Restaurant", index: 0),
    BusinessType(name: "Grocery", index: 1),
    BusinessType(name: "Appointment", index: 2),
    BusinessType(name: "Medical Store", index: 3)
  ].obs;

  final List<BusinessCategory> animals = [
    BusinessCategory(id: 1, name: "Indian"),
    BusinessCategory(id: 2, name: "North Indian"),
    BusinessCategory(id: 3, name: "Italian"),
    BusinessCategory(id: 4, name: "South Indian"),
    BusinessCategory(id: 5, name: "Fast Food"),
    BusinessCategory(id: 6, name: "Chinese"),
  ];
  List<MultiSelectItem> items = [];
  RxList<BusinessCategory> selectedAnimals2 =
      [BusinessCategory(id: 14, name: "Chinese")].obs;
  RxString idType = "Aadhar Card".obs;
  RxBool aadharCardSelected = false.obs;
  RxBool panCardSelected = false.obs;
  // RxBool addressProofSelected = false.obs;
  RxBool fssaiSelected = false.obs;
  RxBool cancelledChequeSelected = false.obs;
  RxBool gstCertificateSelected = false.obs;
  RxBool photoSelected = false.obs;
  RxBool otherSelected = false.obs;
  RxBool uploadInventorySelected = false.obs;
  File? aadharCardImage = null;
  File? panCardImage = null;
  // File? addressProofImage = null;
  File? fssaiImage = null;
  File? cancelledChequeImage = null;
  File? gstImage = null;
  File? inventoryImage = null;
  File? photoImage = null;
  File? otherImage = null;
  ImagePicker picker = ImagePicker();
  AppState? state;
  final ScrollController scrollController = ScrollController();


  Future<void> pickImage() async {
    print("in pick image");
    final selected = await picker.pickImage(source: ImageSource.gallery);
    if (selected == null) return;
    if (idType.value == "AADHAR") {
      aadharCardImage = File(selected.path);
      aadharCardSelected.value = true;
      state = AppState.picked;
      update();
      _cropImage(aadharCardImage!);
    } else if (idType.value == "PAN") {
      panCardImage = File(selected.path);
      panCardSelected.value = true;
      state = AppState.picked;
      update();
      _cropImage(panCardImage!);
    } else if (idType.value == "Address Proof") {
      fssaiImage = File(selected.path);
      fssaiSelected.value = true;
      state = AppState.picked;
      update();
      _cropImage(fssaiImage!);
    } else if (idType.value == "Cancelled Cheque") {
      cancelledChequeImage = File(selected.path);
      cancelledChequeSelected.value = true;
      state = AppState.picked;
      update();
      _cropImage(cancelledChequeImage!);
    } else if (idType.value == "GST") {
      gstImage = File(selected.path);
      gstCertificateSelected.value = true;
      state = AppState.picked;
      update();
      _cropImage(gstImage!);
    } else if (idType.value == "Inventory") {
      inventoryImage = File(selected.path);
      uploadInventorySelected.value = true;
      state = AppState.picked;
      update();
      _cropImage(inventoryImage!);
    } else if (idType.value == "Aadhar Card") {
      aadharCardImage = File(selected.path);
      aadharCardSelected.value = true;
      state = AppState.picked;
      update();
      _cropImage(aadharCardImage!);
    } else if (idType.value == "Photo") {
      photoImage = File(selected.path);
      photoSelected.value = true;
      state = AppState.picked;
      update();
      _cropImage(photoImage!);
    } else if (idType.value == "Other") {
      otherImage = File(selected.path);
      otherSelected.value = true;
      state = AppState.picked;
      update();
      _cropImage(otherImage!);
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
            lockAspectRatio: true
        ),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        )
    )) as File?;
    if (croppedFile != null) {
      if (idType.value == "AADHAR") {
        aadharCardImage = croppedFile;
        UploadKyc("AADHAR", aadharCardImage!);
      } else if (idType.value == "PAN") {
        panCardImage = croppedFile;
        UploadKyc("PAN", panCardImage!);
      } else if (idType.value == "Address Proof") {
        fssaiImage = croppedFile;
        UploadKyc("Address Proof", fssaiImage!);
      } else if (idType.value == "Cancelled Cheque") {
        cancelledChequeImage = croppedFile;
        UploadKyc("Cancelled Cheque", cancelledChequeImage!);
      } else if (idType.value == "GST") {
        gstImage = croppedFile;
        UploadKyc("GST", gstImage!);
      } else if (idType.value == "Inventory") {
        inventoryImage = croppedFile;
        UploadKyc("Inventory", inventoryImage!);
      } else if (idType.value == "Aadhar Card") {
        aadharCardImage = croppedFile;
      } else if (idType.value == "Photo") {
        photoImage = croppedFile;
        UploadKyc("Photo", photoImage!);
      } else if (idType.value == "Other") {
        otherImage = croppedFile;
        UploadKyc("Other", otherImage!);
      }
      state = AppState.cropped;
      update();
    }
  }

  Rx<OwnerData> owner = OwnerData().obs;

  void _clearImage(File? image) {
    image = null;
    state = AppState.free;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    items = animals
        .map((animal) => MultiSelectItem<BusinessCategory>(animal, animal.name))
        .toList();
    selectedAnimals2 = [animals.elementAt(0)].obs;
  }

  Rx<BusinessType> selectedBusiness =
      BusinessType(name: "Retailer", index: 0).obs;
  final detailsKey = GlobalKey<FormState>();
  final businessDetailsKey = GlobalKey<FormState>();
  final businessBankDetailsKey = GlobalKey<FormState>();
  final businessDocumentKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController businessRegisteredNameController =
      TextEditingController();
  TextEditingController businessPanController = TextEditingController();
  TextEditingController businessAddressController = TextEditingController();
  var address = "".obs;
  var lat = 0.0.obs;
  var lng = 0.0.obs;
  TextEditingController bankNameController = TextEditingController();
  TextEditingController bankAccountController = TextEditingController();
  TextEditingController bankIFSCCodeController = TextEditingController();
  TextEditingController bankBranchController = TextEditingController();
  TextEditingController nameOnBankController = TextEditingController();

  void changeSteps(int position) {
    currentPosition.value = position;
    try{
      print("currentPosition"+currentPosition.value.toString());
      scrollController.animateTo(scrollController.position.minScrollExtent,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    }catch(e){
      print(e);
    }
    print("currentPosition"+currentPosition.value.toString());
    update();
  }

  UploadKyc(String type, File document) {
    Utility.showLoadingDialog();
    SessionManager.getAccessToken().then((value) {
      print(value);
      ownerRepo.UploadKyc(
        //accessToken.value,
        type,
        document,
      ).then((valuee) {
        Utility.hideLoadingDialog();
        print("succc");
        print(valuee);
        print("addcaat");
        if (valuee.data != null) {
          print("mess");
          // imageEditData!.value = value.data!.data!;
          // for (var i = 0; i < imageEditData!.length; i++) {
          //   selectedGalleryImage!.add(imageEditData![i].path);
          // }

          // AuthControllers authControllers = Get.put(AuthControllers());
          GetProfile(value);
          update();
          // Utility.showToastSuccess("Success", valuee.data!.message);
          update();

          return true;
        } else {
          Utility.showToastError(valuee.error!.message, " Failed");
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

  GetProfile(String? token) async {
    print("getprofile");
    await ownerRepo.GetProfile(
      token!,
    ).then((value) {
      print("after get profile");
      print(value);
      Utility.hideLoadingDialog();
      owner.value = value.data!.data!;
      print(value);
      print(value.data!.message);
      if (value.data!.success!) {
        print("successsss");
        owner.value = value.data!.data!;


        return true;
      } else {
        Get.offAllNamed('/splash');
        Utility.showToastError(value.error!.message, "Registration Failed");
        return false;
      }
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print(error);
      Get.offAllNamed('/splash');
      printInfo(info: "Error From Controllers");

    });
  }
}
