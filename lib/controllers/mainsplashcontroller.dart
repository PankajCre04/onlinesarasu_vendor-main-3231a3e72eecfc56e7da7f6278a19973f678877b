import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sooooperbusiness/api/repository/ownerrepo.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/sessionmanager.dart';
import 'package:sooooperbusiness/commons/utils.dart';
import 'package:sooooperbusiness/controllers/authcontrollers.dart';
import 'package:sooooperbusiness/controllers/getstartedcontroller.dart';
import 'package:sooooperbusiness/controllers/offercontroller.dart';
import 'package:sooooperbusiness/model/settings_reponse.dart';
import 'package:sooooperbusiness/views/maintenance.dart';

class MainSplashController extends GetxController {
  Rx<SettingData> settingData = SettingData().obs;
  SessionManager sessionManager = SessionManager();
  AuthControllers authControllers = Get.put(AuthControllers(), permanent: true);
  GetStartedController getStartedController = Get.put(GetStartedController(), permanent: true);
  RxString appVersion = "".obs;
  late Position _currentPosition;
  String _currentAddress = "";
  var address = "Click to Change";
  var lat = 0.0;
  var lng = 0.0;
  RxBool isLoading = true.obs;
  OwnerRepo ownerRepo = OwnerRepo();

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  _getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> addresses = await placemarkFromCoordinates(latitude, longitude);

      Placemark place = addresses[0];

      _currentAddress = "${place.locality}";
      print(_currentAddress);
      var first = addresses.first;
      address = first.name!;

      lng = longitude;
      lat = latitude;
      print("${first.locality} : ${first.name}");
      SessionManager.saveAddress(address);
      SessionManager.saveLat(lat);
      SessionManager.saveLng(lng);
      Future.delayed(
          Duration(
            milliseconds: 3000,
          ), () async {
        isLoading.value = false;
        // update();
        // if (await SessionManager.getAccessToken() != null &&
        //     await SessionManager.getAccessToken() != '') {
        //   Get.offAllNamed('/homeroot');
        // } else {
        //   Get.offAllNamed('/splash');
        // }
      });
    } catch (e) {
      isLoading.value = false;
      update();
      Utility.showToastError("Error in Fetching Location", "Try to open app again and enable your location manually");
      print(e);
    }
  }

  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best).then((Position position) {
      _getAddressFromLatLng(position.latitude, position.longitude);
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void onInit() {
    isLoading.value = false;
    OfferController offerController = Get.put(OfferController());
    // TODO: implement onInit
    _getCurrentLocation();
    Future.delayed(
        Duration(
          milliseconds: 3000,
        ), () async {
      getSettings();
      await _determinePosition();
      UploadFCMToken();
    });
    // getSettings();
    super.onInit();
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

  void getSettings() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion.value = packageInfo.version;
    ownerRepo.getSettings("accessToken.value").then((value) async {
      if (value.data != null) {
        settingData.value = value.data!.data!;
        if (value.data!.data!.maintenanceMode! == "1") {
          Get.offAll(MaintenancePage());
        } else {
          isLoading.value = false;
          update();
          if (await SessionManager.getAccessToken() != null && await SessionManager.getAccessToken() != '') {
            // String token = SessionManager.getAccessToken();
            await authControllers.getProfile(await SessionManager.getAccessToken());
            //UploadFCMToken();
            // Get.offAllNamed('/homeroot');
          } else {
            print("accesstoken else");
            Get.offAllNamed('/splash');
          }
          // if (value.data!.data!.vendorAndroidVersion! != packageInfo.version) {
          //   Utility().showUpdate(Get.context!, (value.data!.data!.vendorAndroidForceUpdate! == "1") ? true : false);
          // }
        }
      } else {
        // print(value.error!.code);
        isLoading.value = false;
        update();
        if (await SessionManager.getAccessToken() != null && await SessionManager.getAccessToken() != '') {
          print("accesstoken if");
          // String token = SessionManager.getAccessToken();
          await authControllers.getProfile(await SessionManager.getAccessToken());
          // UploadFCMToken();

          // Get.offAllNamed('/homeroot');
        } else {
          print("accesstoken else");
          Get.offAllNamed('/splash');
        }
      }
    });
  }
}
