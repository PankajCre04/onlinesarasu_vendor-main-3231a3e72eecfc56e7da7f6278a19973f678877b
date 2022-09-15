import 'dart:io';
import 'package:share/share.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/utils.dart';
import 'package:sooooperbusiness/controllers/maincontroller.dart';
import 'package:sooooperbusiness/controllers/order/ordercontroller.dart';
import 'package:sooooperbusiness/controllers/ownercontrollers.dart';
import 'package:sooooperbusiness/model/owner.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/Home/homePage.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/More/profile.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/order/oders.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/reports/report.dart';
import 'package:sooooperbusiness/views/owner/addrestaurant.dart';
import 'package:sooooperbusiness/views/owner/listrestaurants.dart';
import 'navigationscreens/order/orderProcessing/processing_order.dart';
import 'navigationscreens/pos/homescreen.dart';
import 'navigationscreens/reports.dart';

class HomeRoot extends StatelessWidget {
  MainController mainController = Get.put(MainController());
  OwnerControllers ownercontroller = Get.put(OwnerControllers());

  final TextStyle unselectedLabelStyle = TextStyle(color: Constant.black, fontWeight: FontWeight.bold, fontSize: 12);

  final TextStyle selectedLabelStyle = TextStyle(color: Constant.black, fontWeight: FontWeight.bold, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Container(
          decoration: BoxDecoration(
            color: Constant.white,
            border: Border.all(color: Constant.greyDark, width: 1 // red as border color
                ),
          ),
          child: BottomNavigationBar(
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value <= 4 ? landingPageController.tabIndex.value : 2,
            backgroundColor: Constant.white,
            // unselectedItemColor:Constant.greyDark.withOpacity(0.5),
            // selectedItemColor: Constant.greyDark,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            showSelectedLabels: true,
            fixedColor: Constant.black,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            elevation: 5,

            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.circle_outlined,
                    size: 25.0,
                  ),
                ),
                label: 'Home',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    size: 25.0,
                  ),
                ),
                label: 'Order',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.bar_chart,
                    size: 25.0,
                  ),
                ),
                label: 'Reports',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.more_outlined,
                    size: 25.0,
                  ),
                ),
                label: 'More',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Constant.white,
        toolbarHeight: 80,
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 30, 0),
            child: Image.asset(
              'assets/images/logo_long.png',
              width: 80,
            ),
          ),
        ]),
        actions: [
          Obx(
            () => (mainController.selectedStore.value.id == null)
                ? Container()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => FlutterSwitch(
                          width: 50,
                          height: 23,
                          value: mainController.acceptOrders.value,
                          borderRadius: 30.0,
                          padding: 2,
                          switchBorder: Border.all(color: Constant.black, width: 2),
                          activeColor: Constant.white,
                          inactiveColor: Constant.white,
                          inactiveToggleColor: Constant.errorColor,
                          activeToggleColor: Constant.successColor,
                          showOnOff: false,
                          onToggle: (val) {
                            mainController.acceptOrders.value = val;
                            ownercontroller.UpdateStoreStatus(mainController.acceptOrders.value);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          "Accept Orders?",
                          style: TextStyle(
                            color: Constant.black,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  ),
          ),
          Obx(
            () => (mainController.selectedStore.value.id == null)
                ? Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Get.to(AddEditRestaurant("Add", ""));
                          clearData();
                        },
                        child: Constant.isEcom == 0
                            ? Text("Add New +",
                                style: TextStyle(
                                  color: Constant.secondaryColor,
                                  fontFamily: 'Poppins_Bold',
                                  fontSize: 14,
                                ))
                            : SizedBox(),
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () async {
                      String link = await mainController.createDynamicLinkStore(true, "store/${mainController.selectedStore.value.id.toString()}");
                      print(link);
                      if (mainController.selectedStore.value.image == null) {
                        print("if me aaya");
                        // Navigator.pop(context);
                        // for (var discount in items) {
                        // }
                        await Share.share("Check out this \"${mainController.selectedStore.value.name}\" on Local Shopi \n${mainController.selectedStore.value.name}\n ($link)"); //.\n${brand.applicableOffers.join(",\n")}");
                      } else {
                        await Share.share("Check out this \"${mainController.selectedStore.value.name}\" on Local Shopi \n${mainController.selectedStore.value.name}\n ($link)");
                        //   print("else me aaya");
                        //   String imageurl = "https://wedun.ssdemo.xyz${mainController.selectedStore.value.image!}";
                        //   print(imageurl);
                        //   File _productImage = await mainController.getImage(url: imageurl);
                        //   print("after image get");
                        //   // final image = new File(_productImage);
                        //   // _productImage.writeAsBytesSync(res.bodyBytes);
                        //   if (_productImage.path != null) {
                        //     // Navigator.pop(context);
                        //     // for (var discount in items) {
                        //     // }
                        //     await Share.shareFiles(
                        //       [_productImage.path],
                        //       text:
                        //           "Check out this \"${mainController.selectedStore.value.name}\" on dunzo \n${mainController.selectedStore.value.name}\n ($link)",
                        //     );
                        //   }
                      }
                    },
                    child: Image.asset(
                      'assets/images/message.png',
                      color: Constant.black,
                      width: 50,
                      height: 50,
                    ),
                  ),
          )
        ],
      ),
      bottomNavigationBar: buildBottomNavigationMenu(context, mainController),
      body: Obx(() => IndexedStack(
            index: mainController.tabIndex.value,
            children: [
              // HomePage(),
              HomeScreen(),
              orders(),
              Reports(),
              profile(),
            ],
          )),
    );
  }

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
    ownercontroller.selectedImage.value = File("");
    ownercontroller.selectedGalleryImage!.value = [];
  }
}
