import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sooooperbusiness/api/api_client.dart';
import 'package:sooooperbusiness/api/repository/ownerrepo.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/sessionmanager.dart';
import 'package:sooooperbusiness/commons/utils.dart';
import 'package:sooooperbusiness/controllers/getstartedcontroller.dart';
import 'package:sooooperbusiness/controllers/mainsplashcontroller.dart';
import 'package:sooooperbusiness/model/allresponse/ownerloginresponse.dart';
import 'package:sooooperbusiness/model/basemodel.dart';
import 'package:sooooperbusiness/model/profileResponse.dart';
import 'package:sooooperbusiness/views/dashboard/homeroot.dart';

import '../model/OwnerData.dart';
import '../views/pending_document_page.dart';

enum ProductTypeEnum {
  Ecommerce,
  Purchasing,
}

class AuthControllers extends GetxController {
  TextEditingController mobileEditingController = TextEditingController();
  TextEditingController otpEditingController = TextEditingController();

  TextEditingController loginMobileEditingController = TextEditingController();
  TextEditingController loginPasswordEditingController = TextEditingController();
  GetStartedController getStartedController = Get.put(GetStartedController(), permanent: true);

  TextEditingController sendPasswordOtpEmail = TextEditingController();

  TextEditingController forgotOtp = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();
  RxBool isValidEmail = false.obs;
  RxBool isValidPassword = false.obs;
  final formKey = GlobalKey<FormState>();
  final formKeyLogin = GlobalKey<FormState>();
  final formKeySendPassword = GlobalKey<FormState>();
  final formKeyCreateNewPassword = GlobalKey<FormState>();
  OwnerRepo ownerRepo = OwnerRepo();
  RxString accessToken = "".obs;
  ProductTypeEnum? productTypeEnum;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    SessionManager.getAccessToken().then((value) {
      print(value);
      // if(value == null){
      //   accessToken.value = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGUyYmI5M2QxNjY1NDAwMjAzYmM5OTYiLCJpYXQiOjE2MjY0MzYwMzIsImV4cCI6MTY4NjQzNTk3MiwidHlwZSI6ImFjY2VzcyJ9.ItdcYc2hABPj9aYSVz0ziQYN7QKGhPLkuKFqxmZpIsQ";
      //   GetCategory(accessToken.value);
      // }else{
      //   accessToken.value = value;
      //   //GetCategory(accessToken.value);
      //   GetCategory("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGUyYmI5M2QxNjY1NDAwMjAzYmM5OTYiLCJpYXQiOjE2MjY0MzYwMzIsImV4cCI6MTY4NjQzNTk3MiwidHlwZSI6ImFjY2VzcyJ9.ItdcYc2hABPj9aYSVz0ziQYN7QKGhPLkuKFqxmZpIsQ");
      // }
      if (value != null) {
        accessToken.value = value;
      } else {
        accessToken.value = "";
      }
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  String? validateEmail(String? v) {
    if (v!.isEmpty) {
      return "";
    } else if (!GetUtils.isEmail(v)) {
      return "";
    } else {
      return null;
    }
  }

  void loginOwner() {
    Utility.showLoadingDialog();
    ownerRepo.loginOwner(loginMobileEditingController.value.text, loginPasswordEditingController.value.text).then((value) async {
      Utility.hideLoadingDialog();
      print("after value print");
      if (value.data != null) {
        print('-->@');
        await SessionManager.setOwnerName(value.data!.data!.name!);
        await SessionManager.saveAccessToken(value.data!.data!.token!);
        await SessionManager.saveUserData(value.data!.data!.name!, value.data!.data!.email!);
        await SessionManager.setOwnerID(value.data!.data!.id!.toString());
        await getProfile(value.data!.data!.token);
        // Get.offAllNamed('/homeroot');
      } else {
        print("else me aaya");
        print(value.error!.message);
        Utility.showToastError(value.error!.message!, "Login Failed");
      }
      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      Utility.showToastError("Email or Password Incorrect", "Login Failed");
      print("below is error");
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  void sendForgetPasswordEmail() {
    Utility.showLoadingDialog();
    ownerRepo
        .sendEmail(
      sendPasswordOtpEmail.value.text,
    )
        .then((value) async {
      Utility.hideLoadingDialog();
      print("after value print");
      if (value.data != null) {
        // await SessionManager.setOwnerName(value.data!.data!.name!);
        // await SessionManager.saveAccessToken(
        //     value.data!.data!.token!);
        // await SessionManager.saveUserData(
        //     value.data!.data!.name!,value.data!.data!.email!
        // );
        //
        // await SessionManager.setOwnerID(value.data!.data!.id!.toString());
        // GetProfile(value.data!.data!.token);
        Utility.showToastSuccess(value.data!.message, "Success");
        Get.toNamed('/createNewPassword');
      } else {
        print("else me aaya");
        print(value.error);
        Utility.showToastError(value.error!.message, "Failed");
      }

      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  void setNewPassword() {
    Utility.showLoadingDialog();
    ownerRepo.setNewPassword(otpEditingController.text, newPassword.text, confirmNewPassword.text).then((value) async {
      Utility.hideLoadingDialog();
      print("after value print");
      if (value.data != null) {
        Get.back();
        Get.back();
        Utility.showToastSuccess(value.data!.message, "Success");
        // await SessionManager.setOwnerName(value.data!.data!.name!);
        // await SessionManager.saveAccessToken(
        //     value.data!.data!.token!);
        // await SessionManager.saveUserData(
        //     value.data!.data!.name!,value.data!.data!.email!
        // );
        //
        // await SessionManager.setOwnerID(value.data!.data!.id!.toString());
        // GetProfile(value.data!.data!.token);
        // Get.offAllNamed('/homeroot');
      } else {
        print("else me aaya");
        print(value.error);
        Utility.showToastError(value.error!.message, "Failed");
      }

      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  // void signupOwner() {
  //   Utility.showLoadingDialog();
  //   ownerRepo
  //       .registerOwner(
  //     getStartedController.nameController.text,
  //     getStartedController.phoneController.text,
  //     getStartedController.emailController.text,
  //     getStartedController.passwordController.text,
  //     getStartedController.businessType.toString(),
  //     getStartedController.lat.toString(),
  //     getStartedController.lng.toString(),
  //     "0",
  //     "0",
  //     "0",
  //     getStartedController.bankNameController.text,
  //     getStartedController.bankAccountController.text,
  //     getStartedController.bankIFSCCodeController.text,
  //     getStartedController.businessAddressController.text,
  //     getStartedController.businessPanController.text,
  //     getStartedController.addressProofImage!,
  //     getStartedController.panCardImage!,
  //     getStartedController.addressProofImage!,
  //     getStartedController.cancelledChequeImage!,
  //     getStartedController.gstImage!,
  //     getStartedController.inventoryImage!,
  //   )
  //       .then((value) {
  //     Utility.hideLoadingDialog();
  //     print(value);
  //     if (value.data != null) {
  //       Utility.showToastSuccess("Registration Success", value.data!.message);
  //       getStartedController.owner.value = value.data!.owner!;
  //       getStartedController.update();
  //       getStartedController
  //           .changeSteps(getStartedController.currentPosition.value + 1);
  //     } else {
  //       Utility.showToastError(value.error!.message, "Registration Failed");
  //     }
  //
  //     printInfo(info: "Data from Auth Controller");
  //   }).catchError((error) {
  //     printInfo(info: "Catch Error from Auth Controller");
  //     print(error);
  //     //Utility.showToastError(error!.message, "Registration Failed");
  //     Utility.hideLoadingDialog();
  //   });
  // }

  @override
  // TODO: implement onDelete
  get onDelete => super.onDelete;

  //dunzo code implementation started from here

  Future<void> signup(int valueType, int sub_id) async {
    print("theSub id id ${sub_id}");
    Utility.showLoadingDialog();
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low).then((Position position) {
      ownerRepo
          .register(
        getStartedController.nameController.text,
        "+91" + getStartedController.phoneController.text,
        getStartedController.emailController.text,
        getStartedController.passwordController.text,
        Constant.FCM_TOKEN,
        position.latitude.toDouble(),
        position.longitude.toDouble(),
        valueType,
        sub_id,
        // here we have to give subscription detail .
      )
          .then((value) async {
        Utility.hideLoadingDialog();
        print(value);
        if (value.data != null) {
          Utility.showToastSuccess("Registration Success", value.data!.message);
          getStartedController.owner.value = value.data!.data!;
          SessionManager.saveAccessToken(getStartedController.owner.value.token!);
          await SessionManager.setOwnerName(value.data!.data!.name!);
          await SessionManager.saveUserData(value.data!.data!.name!, value.data!.data!.email!);

          await SessionManager.setOwnerID(value.data!.data!.id!.toString());
          // GetProfile(value.data!.data!.token);
          getStartedController.update();
          getStartedController.changeSteps(getStartedController.currentPosition.value + 1);
        } else {
          Utility.showToastError(value.error!.message, "Registration Failed");
        }

        printInfo(info: "Data from Auth Controller");
      }).catchError((error) {
        // print(error!.message);
        printInfo(info: "Catch Error from Auth Controller");
        // print(error!.message);
        Utility.showToastError("Phone or Email Already Exist", "Registration Failed");
        Utility.hideLoadingDialog();
      });
    });
  }

  // GetProfile(String? token) async {
  //   print("getprofile");
  //   await ownerRepo.GetProfile(
  //     token!,
  //   ).then((value) {
  //     print("after get profile");
  //     print(value);
  //     Utility.hideLoadingDialog();
  //
  //     getStartedController.owner.value = value.data!.data!;
  //     MainSplashController mainSplashController =
  //         Get.put(MainSplashController());
  //     // mainSplashController.UploadFCMToken();
  //     print(value);
  //     print(value.data!.message);
  //     if (value.data!.success!) {
  //       print("successsss");
  //       getStartedController.owner.value = value.data!.data!;
  //       update();
  //       print(getStartedController.owner.value);
  //       if (getStartedController.owner.value.active == 1 &&
  //           getStartedController.owner.value.verified == 1) {
  //         Get.offAllNamed('/homeroot');
  //       } else {
  //         if (getStartedController.owner.value.accountNo == null ||
  //             getStartedController.owner.value.accountName == null ||
  //             getStartedController.owner.value.ifscCode == null ||
  //             getStartedController.owner.value.bankName == null) {
  //           getStartedController.currentPosition.value = 1;
  //           getStartedController
  //               .changeSteps(getStartedController.currentPosition.value);
  //           Get.offAllNamed('/getstarted');
  //         } else if (getStartedController.owner.value.kyc == null &&
  //                 getStartedController.owner.value.kyc!.isEmpty ||
  //             getStartedController.owner.value.kyc!.length < 3 ||
  //             getStartedController.owner.value.kyc == null) {
  //           getStartedController.currentPosition.value = 2;
  //           getStartedController
  //               .changeSteps(getStartedController.currentPosition.value);
  //           Get.offAllNamed('/getstarted');
  //         } else if (getStartedController.owner.value.verified == 0) {
  //           getStartedController.currentPosition.value = 2;
  //           getStartedController
  //               .changeSteps(getStartedController.currentPosition.value);
  //           Get.offAllNamed('/getstarted');
  //         } else if (getStartedController.owner.value.active == 0 &&
  //             getStartedController.owner.value.verified == 1) {
  //           getStartedController.currentPosition.value = 3;
  //           getStartedController
  //               .changeSteps(getStartedController.currentPosition.value);
  //           Get.offAllNamed('/getstarted');
  //         } else {
  //           Get.offAllNamed('/homeroot');
  //         }
  //       }
  //
  //       return true;
  //     } else {
  //       Get.offAllNamed('/splash');
  //       Utility.showToastError(value.error!.message, "Registration Failed");
  //       return false;
  //     }
  //   }).catchError((error) {
  //     Utility.hideLoadingDialog();
  //     print(error);
  //     Get.offAllNamed('/splash');
  //     printInfo(info: "Error From Controllers");
  //   });
  // }

  Rx<OwnerData> storedProfileData = OwnerData().obs;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String?> saveString(String flag) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("flag", flag);
    print("#########${flag}");
  }

  Future<String?> getString() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("flag");
  }

  Future<bool> getProfile(String? token) async {
    print("getprofile");
    final BaseModel<ProfileResponse> value = await ownerRepo.GetProfile(
      token!,
    );

    print("after get profile");
    print(value);
    Utility.hideLoadingDialog();
    if (value.data != null && value.error == null) {
      getStartedController.owner.value = value.data!.data!;
      storedProfileData.value = value.data!.data!;
      print("**********Flag*********${storedProfileData.value.isEcom}");
      // bool aadhar = false;
      // bool pan = false;
      // bool gst = false;
      // bool addressProf = false;
      // bool photo = false;
      // for (int i = 0; i < value.data!.data!.kyc!.length; i++) {
      //   String doctype = value.data!.data!.kyc!.elementAt(i).docType!;
      //   String status = value.data!.data!.kyc!.elementAt(i).status!;
      //   if (doctype == "AADHAR") {
      //     if (status == "APPROVED") {
      //       aadhar = true;
      //     } else {
      //       aadhar = false;
      //     }
      //   } else if (doctype == "PAN") {
      //     if (status == "APPROVED") {
      //       pan = true;
      //     } else {
      //       pan = false;
      //     }
      //   } else if (doctype =="GST") {
      //     if(status == "APPROVED"){
      //       gst=true;
      //     }else{
      //       gst=false;
      //     }
      //   }else if(doctype=="Address Proof"){
      //     if(status == "APPROVED"){
      //       addressProf=true;
      //     }else{
      //       addressProf=false;
      //     }
      //   }else if(doctype=="Photo"){
      //     if(status == "APPROVED"){
      //       photo=true;
      //     }else{
      //       photo=false;
      //     }
      //   }
      // }
      // mainSplashController.UploadFCMToken();
      print(value);
      print(value.data!.message);
      if (value.data!.success!) {
        getStartedController.owner.value = value.data!.data!;
        storedProfileData.value = value.data!.data!;
        Constant.isEcom = value.data!.data!.isEcom.toString();
        saveString(value.data!.data!.isEcom.toString());
        update();
        print(getStartedController.owner.value);
        if (getStartedController.owner.value.active == 1 && getStartedController.owner.value.verified == 1) {
          // if(aadhar==true||addressProf==true||pan==true||photo==true||gst==true){
          //   Get.offAll(VerifyingPage());
          //   print("yaha aayah hai");
          // }
          Get.offAllNamed('/homeroot');
        } else {
          if (getStartedController.owner.value.accountNo == null || getStartedController.owner.value.accountName == null || getStartedController.owner.value.ifscCode == null || getStartedController.owner.value.bankName == null) {
            getStartedController.currentPosition.value = 1;
            getStartedController.changeSteps(getStartedController.currentPosition.value);
            print("verfit page pr nahi aahaay");
            Get.offAllNamed('/getstarted');
          } else if (getStartedController.owner.value.kyc == null && getStartedController.owner.value.kyc!.isEmpty || getStartedController.owner.value.kyc!.length < 3 || getStartedController.owner.value.kyc == null) {
            getStartedController.currentPosition.value = 2;
            getStartedController.changeSteps(getStartedController.currentPosition.value);
            Get.offAllNamed('/getstarted');
          } else if (getStartedController.owner.value.verified == 0) {
            getStartedController.currentPosition.value = 2;
            getStartedController.changeSteps(getStartedController.currentPosition.value);
            Get.offAllNamed('/getstarted');
          } else if (getStartedController.owner.value.active == 0 && getStartedController.owner.value.verified == 1) {
            getStartedController.currentPosition.value = 3;
            getStartedController.changeSteps(getStartedController.currentPosition.value);
            Get.offAllNamed('/getstarted');
          } else {
            Get.offAllNamed('/homeroot');
          }
        }
        return true;
      } else {
        Get.offAllNamed('/splash');
        Utility.showToastError(value.error!.message, "Registration Failed");
        return false;
      }
    } else {
      Get.offAllNamed('/splash');
      Utility.showToastError(value.error!.message, "Profile Failed");
      return false;
    }
  }

  void uploadBankDetails() {
    Utility.showLoadingDialog();
    SessionManager.getAccessToken().then((value) {
      print(value);
      accessToken.value = value!;
      ownerRepo.UploadBankDetails(accessToken.value, getStartedController.bankNameController.text, getStartedController.bankAccountController.text, getStartedController.nameOnBankController.text, getStartedController.bankIFSCCodeController.text,
              getStartedController.bankBranchController.text)
          .then((value) {
        Utility.hideLoadingDialog();
        print(value);
        if (value.data != null) {
          // Utility.showToastSuccess("Success", value.data!.message);
          getStartedController.owner.value = value.data!.data!;
          // SessionManager.saveAccessToken(getStartedController.owner.value.token!);
          getStartedController.update();
          getStartedController.changeSteps(getStartedController.currentPosition.value + 1);
        } else {
          Utility.showToastError(value.error!.message, "Uploading Failed");
        }
      });
      print("upload bank");
      print(accessToken.value);

      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      printInfo(info: "Catch Error from Auth Controller");
      print(error);
      //Utility.showToastError(error!.message, "Registration Failed");
      Utility.hideLoadingDialog();
    });
  }
}
