// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sooooperbusiness/api/repository/ownerrepo.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/sessionmanager.dart';
import 'package:sooooperbusiness/commons/utils.dart';
import 'package:sooooperbusiness/controllers/inventory/inventoryController.dart';
import 'package:sooooperbusiness/controllers/maincontroller.dart';
import 'package:sooooperbusiness/controllers/mainsplashcontroller.dart';
import 'package:sooooperbusiness/controllers/offercontroller.dart';
import 'package:sooooperbusiness/controllers/ownercontrollers.dart';
import 'package:sooooperbusiness/model/StoreData.dart';
import 'package:sooooperbusiness/model/pos/profileModel.dart';
import 'package:sooooperbusiness/views/authentication/loginscreen.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/More/Offers/offers.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/More/privacy_policy.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Inventory/Inventory.dart';

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  OwnerControllers ownercontroller = Get.put(OwnerControllers());
  MainController mainController = Get.put(MainController());
  OfferController offerController = Get.put(OfferController());
  InventoryController inventoryController = Get.put(InventoryController());

  String appVersion = "";

  Future<void> version() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("===========@@@@@@@@@@@@${mainController.adminStore.value.id.toString()}");
    version();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(color: Constant.blueShadowBackground),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              ownercontroller.userName,
                              style: TextStyle(color: Constant.black, fontSize: 20, fontFamily: 'Poppins-bold', fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            ownercontroller.userEmail,
                            style: TextStyle(color: Constant.black, fontSize: 12, fontFamily: 'Poppins-bold', fontWeight: FontWeight.bold),
                          ),
                          // GestureDetector(
                          //   onTap: () {},
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //       color: Constant.white,
                          //       borderRadius: BorderRadius.circular(29),
                          //       border: Border.all(
                          //         color: Constant.greyDark,
                          //       ),
                          //     ),
                          //     child: Padding(
                          //       padding:
                          //           const EdgeInsets.only(left: 8.0, right: 8),
                          //       child: Text(
                          //         "Edit Profile",
                          //         style: TextStyle(
                          //           color: Constant.greyDark,
                          //           fontSize: 10,
                          //           fontFamily: 'Poppins',
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Constant.secondaryColor,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: Constant.secondaryColor,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                ownercontroller.userName.toUpperCase()[0],
                                style: TextStyle(color: Constant.white, fontSize: 30, fontFamily: 'Poppins-bold', fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: ProfileModel.setting.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () async {
                      if (ProfileModel.setting[index] == "Inventory") {
                        print("inventory");
                        Utility.showLoadingDialog();
                        inventoryController.itemList.clear();
                        inventoryController.tempItemList.clear();
                        await inventoryController.GetItem("All", 1);
                        Utility.hideLoadingDialog();
                        offerController.GetEcomOffer();
                        Get.to(InventoryPage());
                      } else if (ProfileModel.setting[index] == "Log Out") {
                        OwnerRepo ownerRepo = OwnerRepo();
                        String? accessToken = await SessionManager.getAccessToken();
                        ownerRepo.UploadFcmToken(
                          accessToken!,
                          "",
                        ).then((value) async {
                          // Add your onPressed code here!
                          SessionManager.saveAccessToken("");
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.remove("Selected_Restaurant");
                          prefs.remove("Owner_ID");
                          prefs.remove("Owner_Name");
                          prefs.remove("userName");
                          prefs.remove("userEmail");
                          prefs.remove("address");
                          prefs.remove("lat");
                          prefs.remove("lag");
                          print("after remove");
                          // Get.offAllNamed('/splash');
                          Get.offAllNamed('/splash');
                          // Get.offAllNamed("/");
                        });
                        // SessionManager.saveAccessToken("");
                        // // SessionManager.saveRestaurant("" as StoreData);
                        // SharedPreferences prefs = await SharedPreferences.getInstance();
                        // prefs.remove("Selected_Restaurant");
                        // prefs.remove("Owner_ID");
                        // prefs.remove("Owner_Name");
                        // prefs.remove("userName");
                        // prefs.remove("userEmail");
                        // prefs.remove("address");
                        // prefs.remove("lat");
                        // prefs.remove("lag");
                        // print("after remove");
                        //
                        // // Get.offAllNamed("/");
                        // Get.offAllNamed('/splash');
                        // // Navigator.pushAndRemoveUntil(
                        // //   context,
                        // //   MaterialPageRoute(
                        // //       builder: (context) => LoginScreen()),
                        // //       (Route<dynamic> route) => false,
                        // // );
                      } else if (ProfileModel.setting[index] == "Discounts") {
                        print("goingOffer");
                        Get.to(Offers());
                        Constant.isEcom == "0"
                            ? (mainController.selectedStore.value.id == null)
                                ? ""
                                : offerController.GetOffer(mainController.selectedStore.value.id.toString())
                            : offerController.GetEcomOffer();
                      } else if (ProfileModel.setting[index] == "Help Center") {
                        launch('mailto:support@Localshoppi.ssdemo.xyz?subject=Help&body=Write your query to us.');
                      }
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(color: (index % 2 == 1) ? Constant.blueShadowBackground : Constant.white),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              ProfileModel.setting[index],
                              style: TextStyle(
                                color: Constant.black,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(PrivacyPolicy("Privacy Policy", mainController.settingData.value.privacyPolicy!));
                        },
                        child: Text(
                          "Privacy Policy",
                          style: TextStyle(color: Constant.black, fontSize: 10, fontFamily: 'Poppins-bold', fontWeight: FontWeight.bold),
                        ),
                      ),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      // Text(
                      //   "Terms Of Service",
                      //   style: TextStyle(
                      //       color: Constant.black,
                      //       fontSize: 10,
                      //       fontFamily: 'Poppins-bold',
                      //       fontWeight: FontWeight.bold),
                      // ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(PrivacyPolicy("Refund & Return Policy", mainController.settingData.value.refundPolicy!));
                        },
                        child: Text(
                          "Refund & Return Policy",
                          style: TextStyle(color: Constant.black, fontSize: 10, fontFamily: 'Poppins-bold', fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Version ${appVersion}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Constant.black,
                      fontSize: 10,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
