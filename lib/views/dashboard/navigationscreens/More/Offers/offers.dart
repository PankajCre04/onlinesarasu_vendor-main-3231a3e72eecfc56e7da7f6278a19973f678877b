import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/loading_dialog.dart';
import 'package:sooooperbusiness/controllers/offercontroller.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/More/Offers/addeditoffers.dart';

class Offers extends StatelessWidget {
  OfferController offerController = Get.put(OfferController());

  showAlertDialog(BuildContext context, String offerId) {
    //print(categoryId);
    print("itemIdd");
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Get.back();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Delete"),
      onPressed: () {
        offerController.DeleteOffer(offerId);
        //Get.find<InventoryController>().DeleteCategory(categoryId);
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Notice"),
      content: Text("Your sure you want to delete"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  addOfferData(int index) async {
    offerController.offerCodeController.text = offerController.promoDataList[index].code!;
    offerController.offerDescriptionController.text = offerController.promoDataList[index].description!;
    offerController.maxUsePerUserController.text = offerController.promoDataList[index].maxUsePerUser.toString();
    offerController.startDateController.text = DateFormat('yyyy-MM-dd').format(offerController.promoDataList[index].startDate!);
    offerController.endDateController.text = DateFormat('yyyy-MM-dd').format(offerController.promoDataList[index].endDate!);
    offerController.minCartValueController.text = offerController.promoDataList[index].minCartValue!.toString();
    // offerController.totalUsageCountController.text = offerController
    //     .promoDataList[index].totalOverallUsageCount.toString();
    offerController.discountType.value = offerController.promoDataList[index].discountType!;
    // offerController.couponType.value = offerController.promoDataList[index].couponType;
    offerController.discountValueController.text = offerController.promoDataList[index].discountValue.toString();
    // offerController.minOrderValueController.text = offerController.promoDataList[index].minOrderValue.toString();
    offerController.maxDiscountValueController.text = offerController.promoDataList[index].maxDiscountValue!;
    offerController.isActive.value = offerController.promoDataList[index].active!;
    offerController.isCouponImageSelected.value = (offerController.promoDataList[index].image == "" || offerController.promoDataList[index].image == null) ? false : true;
    if (offerController.promoDataList[index].image != "" || offerController.promoDataList[index].image != null) {
      offerController.selectedCouponImage.value = await offerController.getImage(url: offerController.promoDataList[index].image!);
    }
  }

  clearOfferData() {
    offerController.offerCodeController.text = "";
    offerController.offerDescriptionController.text = "";
    offerController.maxUsePerUserController.text = "";
    offerController.startDateController.text = "";
    offerController.endDateController.text = "";
    // offerController.totalUsageCountController.text = "";
    offerController.minCartValueController.text = "";
    offerController.discountType.value = "Select discount type";
    // offerController.couponType.value = "Select coupon type";

    offerController.discountValueController.text = "";
    offerController.maxDiscountValueController.text = "";
    // offerController.minOrderValueController.text = "";
    // offerController.isPrivate.value = false;
    offerController.isActive.value = false;
    offerController.isCouponImageSelected.value = false;
    offerController.selectedCouponImage.value = File("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Constant.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Constant.black,
          ),
        ),
        title: Text(
          "Discounts",
          style: TextStyle(
            fontSize: 16.0,
            color: Constant.black,
            fontFamily: 'Poppins_Bold',
          ),
        ),
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: (offerController.promoDataList.length == 0)
              ? Center(
                  child: Container(
                    child: Text(
                      "No Offers Available!",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              : (offerController.isPromoLoading.value)
                  ? Container()
                  : Container(
                      child: ListView.builder(
                          itemCount: offerController.promoDataList.length,
                          itemBuilder: (context, index) {
                            offerController.isActiveList[index] = offerController.promoDataList[index].active ?? false;
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    print("===========>${offerController.promoDataList[index].id}");
                                    Get.to(AddEditOffers("Edit", offerController.promoDataList[index].id));
                                    addOfferData(index);
                                  },
                                  onLongPress: () {
                                    showAlertDialog(context, offerController.promoDataList[index].id!.toString());
                                  },
                                  child: Card(
                                    color: Constant.blueShadowBackground,
                                    //elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CachedNetworkImage(
                                                width: 50,
                                                height: 50,
                                                imageUrl: offerController.promoDataList[index].image ?? "",
                                                // imageUrl: (offerController.promoDataList[index].image!=
                                                //     null)
                                                //     ? (!offerController.promoDataList[index].image!
                                                //     .startsWith(
                                                //     '/'))
                                                //     ? Constant
                                                //     .imageUrl +
                                                //     "/" +
                                                //     offerController.promoDataList[index].image!
                                                //     : Constant
                                                //     .imageUrl +
                                                //     offerController.promoDataList[index].image!
                                                //     : Constant.imageUrl +
                                                //     "/" +
                                                //     offerController.promoDataList[index].image!,
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
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    offerController.promoDataList[index].code == null
                                                        ? Text("")
                                                        : Text(
                                                            offerController.promoDataList[index].code!,
                                                            style: TextStyle(color: Constant.black, fontSize: 15, fontFamily: 'Poppins-bold', fontWeight: FontWeight.bold),
                                                          ),
                                                    (offerController.promoDataList[index].description == null)
                                                        ? Text("")
                                                        : Text(
                                                            offerController.promoDataList[index].description!,
                                                            style: TextStyle(
                                                              color: Constant.greyDark,
                                                              fontSize: 12,
                                                              fontFamily: 'Poppins',
                                                            ),
                                                          )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Obx(
                                            () => FlutterSwitch(
                                              width: 50,
                                              height: 23,
                                              value: offerController.isActiveList[index],
                                              borderRadius: 30.0,
                                              padding: 2,
                                              switchBorder: Border.all(color: Constant.black, width: 2),
                                              activeColor: Constant.white,
                                              inactiveColor: Constant.white,
                                              inactiveToggleColor: Constant.errorColor,
                                              activeToggleColor: Constant.successColor,
                                              showOnOff: false,
                                              onToggle: (val) {
                                                offerController.isActiveList[index] = val;
                                                offerController.UpdateOfferStatus(offerController.isActiveList[index].toString(), offerController.promoDataList[index].id!.toString());
                                              },
                                            ),
                                          ),
                                        ],
                                      )),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                )
                              ],
                            );
                          }),
                    ),
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Constant.secondaryColor,
        foregroundColor: Constant.black,
        onPressed: () {
          Get.to(AddEditOffers("Add", "none"));
          clearOfferData();
        },
        label: Text(
          'Add Offers',
          style: TextStyle(color: Constant.white, fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
