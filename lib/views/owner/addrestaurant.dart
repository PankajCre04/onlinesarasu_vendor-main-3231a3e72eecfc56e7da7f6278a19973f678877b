import 'dart:io';

import 'package:easy_container/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/utils.dart';
import 'package:sooooperbusiness/controllers/ownercontrollers.dart';
import 'package:sooooperbusiness/views/components/custombutton.dart';
import 'package:sooooperbusiness/views/components/labeledcheckbox.dart';
import 'package:sooooperbusiness/views/components/my_list_tile.dart';
import 'package:sooooperbusiness/views/components/my_text_field.dart';

class AddEditRestaurant extends StatelessWidget {
  final status;
  final storeId;

  AddEditRestaurant(this.status, this.storeId);

  OwnerControllers ownerControllers = Get.put(OwnerControllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Constant.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Constant.black,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$status Store",
              style: TextStyle(
                color: Constant.black,
                fontFamily: 'Poppins_Bold',
                fontSize: 16,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 30, 0),
            child: Image.asset(
              'assets/images/logo_long.png',
              width: 100,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: ownerControllers.addRestaurantKey,
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                  child: MyTextField(
                    controller: ownerControllers.nameEditingController,
                    borderRadius: 10,
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    onChanged: (value) {},
                    labelText: 'Merchant Name',
                    borderColor: Constant.borderColor,
                    focusedBorderColor: Constant.black,
                    borderWidth: 2,
                    keyboardType: TextInputType.name,
                    showTrailingWidget: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Merchant Name ';
                      }
                      return null;
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                  child: MyTextField(
                    controller: ownerControllers.descriptionEditingController,
                    borderRadius: 10,
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    onChanged: (value) {},
                    labelText: 'Merchant Description',
                    borderColor: Constant.borderColor,
                    focusedBorderColor: Constant.black,
                    borderWidth: 2,
                    minLine: 3,
                    maxLine: 5,
                    keyboardType: TextInputType.multiline,
                    showTrailingWidget: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Merchant Description ';
                      }
                      return null;
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                  child: MyTextField(
                    controller: ownerControllers.phoneEditingController,
                    borderRadius: 10,
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    onChanged: (value) {},
                    labelText: 'Mobile Number',
                    borderColor: Constant.borderColor,
                    focusedBorderColor: Constant.black,
                    borderWidth: 2,
                    keyboardType: TextInputType.phone,
                    showTrailingWidget: true,
                    prefixWidget: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Text("+91"),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Mobile ';
                      } else if (!value.isPhoneNumber) {
                        return 'Enter 10 Digit Mobile Number';
                      }
                      return null;
                    },
                    // trailing: Padding(
                    //   padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                    //   child: CircleAvatar(
                    //     backgroundColor: Constant.secondaryColor,
                    //     radius: 5,
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Image.asset('assets/images/arrow_bold.png'),
                    //     ),
                    //   ),
                    // ),
                  )),
              Padding(
                  padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                  child: MyTextField(
                    controller: ownerControllers.emailEditingController,
                    borderRadius: 10,
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    onChanged: (value) {},
                    labelText: 'Email',
                    borderColor: Constant.borderColor,
                    focusedBorderColor: Constant.black,
                    borderWidth: 2,
                    keyboardType: TextInputType.emailAddress,
                    showTrailingWidget: true,
                    // prefixWidget: Padding(
                    //   padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    //   child: Text("+91"),
                    // ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Email ';
                      }
                      return null;
                    },
                    // trailing: Padding(
                    //   padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                    //   child: CircleAvatar(
                    //     backgroundColor: Constant.secondaryColor,
                    //     radius: 5,
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Image.asset('assets/images/arrow_bold.png'),
                    //     ),
                    //   ),
                    // ),
                  )),
              InkWell(
                onTap: () {
                  ownerControllers.showPlacePicker();
                },
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                    child: MyTextField(
                      controller: ownerControllers.fullAddressEditingController,
                      borderRadius: 10,
                      isEnabled: false,
                      autofocus: false,
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      onChanged: (value) {},
                      labelText: 'Choose Address',
                      borderColor: Constant.borderColor,
                      focusedBorderColor: Constant.black,
                      borderWidth: 2,
                      keyboardType: TextInputType.name,
                      showTrailingWidget: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Select Address';
                        }
                        return null;
                      },
                    )),
              ),
              // Padding(
              //     padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
              //     child: MyTextField(
              //       controller: ownerControllers.landMarkEditingController,
              //       borderRadius: 10,
              //       contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              //       onChanged: (value) {},
              //       labelText: 'Landmark',
              //       borderColor: Constant.borderColor,
              //       focusedBorderColor: Constant.black,
              //       borderWidth: 2,
              //       keyboardType: TextInputType.name,
              //       showTrailingWidget: false,
              //       validator: (value) {
              //         if (value!.isEmpty) {
              //           return 'Enter Landmark ';
              //         }
              //         return null;
              //       },
              //       // trailing: Padding(
              //       //   padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
              //       //   child: CircleAvatar(
              //       //     backgroundColor: Constant.secondaryColor,
              //       //     radius: 5,
              //       //     child: Padding(
              //       //       padding: const EdgeInsets.all(8.0),
              //       //       child: Image.asset('assets/images/arrow_bold.png'),
              //       //     ),
              //       //   ),
              //       // ),
              //     )),
              // Row(
              //   children: [
              //     Obx(
              //           () =>
              //           Checkbox(
              //               value: ownerControllers.isFeatured.value,
              //               onChanged: (value) {
              //                 ownerControllers.isFeatured.value = value!;
              //               }),
              //     ),
              //     Text(data)
              //   ],
              // )

              // Obx(
              //   () => Padding(
              //     padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
              //     child: InkWell(
              //       onTap: () {
              //         if (ownerControllers.isFeatured.isTrue) {
              //           ownerControllers.isFeatured.value = false;
              //         } else {
              //           ownerControllers.isFeatured.value = true;
              //         }
              //       },
              //       child: LabelCheckBox(
              //           borderColor: Constant.borderColor,
              //           borderRadius: 10,
              //           borderWidth: 2,
              //           labelText: "Featured",
              //           onChanged: (value) {
              //             ownerControllers.isFeatured.value = value!;
              //           },
              //           defaultValue: ownerControllers.isFeatured.value),
              //     ),
              //   ),
              // ),

              // Obx(
              //   () => Padding(
              //     padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
              //     child: InkWell(
              //       onTap: () {
              //         if (ownerControllers.isVegOnly.isTrue) {
              //           ownerControllers.isVegOnly.value = false;
              //         } else {
              //           ownerControllers.isVegOnly.value = true;
              //         }
              //       },
              //       child: LabelCheckBox(
              //           borderColor: Constant.borderColor,
              //           borderRadius: 10,
              //           borderWidth: 2,
              //           labelText: "Veg Only",
              //           onChanged: (value) {
              //             ownerControllers.isVegOnly.value = value!;
              //           },
              //           defaultValue: ownerControllers.isVegOnly.value),
              //     ),
              //   ),
              // ),
              // Obx(
              //   () => Padding(
              //     padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
              //     child: InkWell(
              //       onTap: () {
              //         if (ownerControllers.isDeliveryEnabled.isTrue) {
              //           ownerControllers.isDeliveryEnabled.value = false;
              //         } else {
              //           ownerControllers.isDeliveryEnabled.value = true;
              //         }
              //       },
              //       child: LabelCheckBox(
              //           borderColor: Constant.borderColor,
              //           borderRadius: 10,
              //           borderWidth: 2,
              //           labelText: "Delivery Enabled",
              //           onChanged: (value) {
              //             ownerControllers.isDeliveryEnabled.value = value!;
              //           },
              //           defaultValue: ownerControllers.isDeliveryEnabled.value),
              //     ),
              //   ),
              // ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                  child: MyTextField(
                    controller: ownerControllers.deliveryRadiusEditingController,
                    borderRadius: 10,
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    onChanged: (value) {},
                    labelText: 'Delivery Radius',
                    borderColor: Constant.borderColor,
                    focusedBorderColor: Constant.black,
                    borderWidth: 2,
                    keyboardType: TextInputType.number,
                    showTrailingWidget: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Delivery Radius ';
                      }
                      return null;
                    },
                  )),
              // Obx(
              //   () => Padding(
              //     padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
              //     child: InkWell(
              //       onTap: () {
              //         if (ownerControllers.isFixedDeliveryCharged.isTrue) {
              //           ownerControllers.isFixedDeliveryCharged.value = false;
              //           ownerControllers.selectedDeliveryType.value = "Dynamic";
              //         } else {
              //           ownerControllers.isFixedDeliveryCharged.value = true;
              //           ownerControllers.selectedDeliveryType.value = "Fixed";
              //         }
              //         print(ownerControllers.selectedDeliveryType.value);
              //       },
              //       child: LabelCheckBox(
              //           borderColor: Constant.borderColor,
              //           borderRadius: 10,
              //           borderWidth: 2,
              //           labelText: "Fixed Delivery Charged",
              //           onChanged: (value) {
              //             if (value!) {
              //               ownerControllers.isFixedDeliveryCharged.value =
              //                   true;
              //               ownerControllers.selectedDeliveryType.value =
              //                   "Fixed";
              //             } else {
              //               ownerControllers.isFixedDeliveryCharged.value =
              //                   false;
              //               ownerControllers.selectedDeliveryType.value =
              //                   "Dynamic";
              //             }
              //             print(ownerControllers.selectedDeliveryType.value);
              //           },
              //           helperTextEnabled:
              //               !ownerControllers.isFixedDeliveryCharged.value,
              //           helperText: "Dynamic Charged will Applied",
              //           defaultValue:
              //               ownerControllers.isFixedDeliveryCharged.value),
              //     ),
              //   ),
              // ),
              // Obx(
              //   () => !ownerControllers.isFixedDeliveryCharged.value
              //       ? Container(
              //           child: Column(
              //             children: [
              //               Padding(
              //                   padding:
              //                       const EdgeInsets.fromLTRB(15, 25, 15, 0),
              //                   child: MyTextField(
              //                     controller: ownerControllers
              //                         .baseDeliveryChargeEditingController,
              //                     borderRadius: 10,
              //                     contentPadding:
              //                         const EdgeInsets.fromLTRB(20, 15, 20, 15),
              //                     onChanged: (value) {},
              //                     labelText: 'Base Delivery Charge Per KM',
              //                     borderColor: Constant.borderColor,
              //                     focusedBorderColor: Constant.black,
              //                     borderWidth: 2,
              //                     keyboardType: TextInputType.number,
              //                     showTrailingWidget: true,
              //                     validator: (value) {
              //                       if (value!.isEmpty) {
              //                         return 'Enter Base Delivery Charge';
              //                       }
              //                       return null;
              //                     },
              //                   )),
              //               Padding(
              //                   padding:
              //                       const EdgeInsets.fromLTRB(15, 25, 15, 0),
              //                   child: MyTextField(
              //                     controller: ownerControllers
              //                         .baseDeliveryDistanceEditingController,
              //                     borderRadius: 10,
              //                     contentPadding:
              //                         const EdgeInsets.fromLTRB(20, 15, 20, 15),
              //                     onChanged: (value) {},
              //                     labelText: 'Base Delivery Distance (In Km)',
              //                     borderColor: Constant.borderColor,
              //                     focusedBorderColor: Constant.black,
              //                     borderWidth: 2,
              //                     keyboardType: TextInputType.number,
              //                     showTrailingWidget: true,
              //                     validator: (value) {
              //                       if (value!.isEmpty) {
              //                         return 'Enter Base Delivery Distance';
              //                       }
              //                       return null;
              //                     },
              //                   )),
              //               Padding(
              //                   padding:
              //                       const EdgeInsets.fromLTRB(15, 25, 15, 0),
              //                   child: MyTextField(
              //                     controller: ownerControllers
              //                         .extraDeliveryChargeEditingController,
              //                     borderRadius: 10,
              //                     contentPadding:
              //                         const EdgeInsets.fromLTRB(20, 15, 20, 15),
              //                     onChanged: (value) {},
              //                     labelText: 'Delivery Charge Per KM',
              //                     borderColor: Constant.borderColor,
              //                     focusedBorderColor: Constant.black,
              //                     borderWidth: 2,
              //                     keyboardType: TextInputType.number,
              //                     showTrailingWidget: true,
              //                     validator: (value) {
              //                       if (value!.isEmpty) {
              //                         return 'Enter Delivery Radius ';
              //                       }
              //                       return null;
              //                     },
              //                   )),
              //             ],
              //           ),
              //         )
              //       : Padding(
              //           padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
              //           child: MyTextField(
              //             controller: ownerControllers
              //                 .fixedDeliveryChargeEditingController,
              //             borderRadius: 10,
              //             contentPadding:
              //                 const EdgeInsets.fromLTRB(20, 15, 20, 15),
              //             onChanged: (value) {},
              //             labelText: 'Fix Delivery Charge',
              //             borderColor: Constant.borderColor,
              //             focusedBorderColor: Constant.black,
              //             borderWidth: 2,
              //             keyboardType: TextInputType.number,
              //             showTrailingWidget: true,
              //             validator: (value) {
              //               if (value!.isEmpty) {
              //                 return 'Enter Fix Delivery Charge';
              //               }
              //               return null;
              //             },
              //           )),
              // ),
              // Padding(
              //     padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
              //     child: MyTextField(
              //       controller:
              //           ownerControllers.avgDeliveryTimeEditingController,
              //       borderRadius: 10,
              //       contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              //       onChanged: (value) {},
              //       labelText: 'Average Delivery Time',
              //       borderColor: Constant.borderColor,
              //       focusedBorderColor: Constant.black,
              //       borderWidth: 2,
              //       keyboardType: TextInputType.number,
              //       showTrailingWidget: true,
              //       validator: (value) {
              //         if (value!.isEmpty) {
              //           return 'Average Delivery Time ';
              //         }
              //         return null;
              //       },
              //     )),
              // Padding(
              //     padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
              //     child: MyTextField(
              //       controller: ownerControllers.minOrderPriceEditingController,
              //       borderRadius: 10,
              //       contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              //       onChanged: (value) {},
              //       labelText: 'Minimum Order Value',
              //       borderColor: Constant.borderColor,
              //       focusedBorderColor: Constant.black,
              //       borderWidth: 2,
              //       keyboardType: TextInputType.number,
              //       showTrailingWidget: true,
              //       validator: (value) {
              //         if (value!.isEmpty) {
              //           return 'Minimum Order Value';
              //         }
              //         return null;
              //       },
              //     )),
              // Padding(
              //     padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
              //     child: MyTextField(
              //       controller: ownerControllers.cost2EditingController,
              //       borderRadius: 10,
              //       contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              //       onChanged: (value) {},
              //       labelText: 'Approx Cost for 2 Persons',
              //       borderColor: Constant.borderColor,
              //       focusedBorderColor: Constant.black,
              //       borderWidth: 2,
              //       keyboardType: TextInputType.number,
              //       showTrailingWidget: true,
              //       validator: (value) {
              //         if (value!.isEmpty) {
              //           return 'Approx Cost for 2 Persons ';
              //         }
              //         return null;
              //       },
              //     )),
              // Obx(
              //   () => Padding(
              //     padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
              //     child: InkWell(
              //       onTap: () {
              //         if (ownerControllers.isTakeAwayEnabled.isTrue) {
              //           ownerControllers.isTakeAwayEnabled.value = false;
              //         } else {
              //           ownerControllers.isTakeAwayEnabled.value = true;
              //         }
              //       },
              //       child: LabelCheckBox(
              //           borderColor: Constant.borderColor,
              //           borderRadius: 10,
              //           borderWidth: 2,
              //           labelText: "TakeAway Enabled",
              //           onChanged: (value) {
              //             ownerControllers.isTakeAwayEnabled.value = value!;
              //           },
              //           defaultValue: ownerControllers.isTakeAwayEnabled.value),
              //     ),
              //   ),
              // ),
              // Obx(
              //   () => Padding(
              //     padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
              //     child: InkWell(
              //       onTap: () {
              //         if (ownerControllers.isDineInEnabled.isTrue) {
              //           ownerControllers.isDineInEnabled.value = false;
              //         } else {
              //           ownerControllers.isDineInEnabled.value = true;
              //         }
              //       },
              //       child: LabelCheckBox(
              //           borderColor: Constant.borderColor,
              //           borderRadius: 10,
              //           borderWidth: 2,
              //           labelText: "DineIn Enabled",
              //           onChanged: (value) {
              //             ownerControllers.isDineInEnabled.value = value!;
              //           },
              //           defaultValue: ownerControllers.isDineInEnabled.value),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: InkWell(
              //           onTap: () {
              //             chooseTimePicker(0, context);
              //           },
              //           child: MyTextField(
              //             controller:
              //                 ownerControllers.openTimeEditingController,
              //             borderRadius: 10,
              //             contentPadding:
              //                 const EdgeInsets.fromLTRB(20, 15, 20, 15),
              //             onChanged: (value) {},
              //             isEnabled: false,
              //             labelText: 'Open Time',
              //             borderColor: Constant.borderColor,
              //             focusedBorderColor: Constant.black,
              //             borderWidth: 2,
              //             keyboardType: TextInputType.number,
              //             showTrailingWidget: true,
              //             overrideHintText: true,
              //             hintText: "Open",
              //             validator: (value) {
              //               if (value!.isEmpty) {
              //                 return 'Open';
              //               }
              //               return null;
              //             },
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       Expanded(
              //         child: InkWell(
              //           onTap: () {
              //             chooseTimePicker(1, context);
              //           },
              //           child: MyTextField(
              //             controller:
              //                 ownerControllers.closeTimeEditingController,
              //             borderRadius: 10,
              //             contentPadding:
              //                 const EdgeInsets.fromLTRB(20, 15, 20, 15),
              //             onChanged: (value) {},
              //             labelText: 'Close Time',
              //             isEnabled: false,
              //             borderColor: Constant.borderColor,
              //             focusedBorderColor: Constant.black,
              //             borderWidth: 2,
              //             overrideHintText: true,
              //             hintText: "Open",
              //             keyboardType: TextInputType.number,
              //             showTrailingWidget: true,
              //             validator: (value) {
              //               if (value!.isEmpty) {
              //                 return 'Close Time';
              //               }
              //               return null;
              //             },
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Obx(
                () => ownerControllers.isCategoryLoaded.value
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: BoxDecoration(border: Border.all(color: Constant.borderColor, width: 1.8), borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Zones",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ownerControllers.zoneData.value.data == null
                                    ? Container()
                                    : Wrap(
                                        children: [
                                          for (int i = 0; i < ownerControllers.zoneData.value.data!.length; i++)
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                                              child: Obx(
                                                () => InkWell(
                                                  onTap: () {
                                                    if (ownerControllers.selectedZoneId!.contains(ownerControllers.zoneData.value.data![i].id.toString())) {
                                                      ownerControllers.selectedZoneId!.remove(ownerControllers.zoneData.value.data![i].id.toString());
                                                    } else {
                                                      ownerControllers.selectedZoneId!.add(ownerControllers.zoneData.value.data![i].id.toString());
                                                    }
                                                    print(ownerControllers.selectedZoneId!);
                                                  },
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          color: (ownerControllers.selectedZoneId!.contains(ownerControllers.zoneData.value.data![i].id.toString())) ? Constant.secondaryColor.withOpacity(1) : Colors.transparent,
                                                          border: Border.all(
                                                            color: Constant.secondaryColor.withOpacity(1),
                                                          ),
                                                          borderRadius: BorderRadius.all(Radius.circular(20))),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text(
                                                          ownerControllers.zoneData.value.data![i].title!,
                                                          style: TextStyle(
                                                            color: (ownerControllers.selectedZoneId!.contains(ownerControllers.zoneData.value.data![i].id.toString())) ? Constant.white : Constant.black,
                                                          ),
                                                        ),
                                                      )),
                                                ),
                                              ),
                                            )
                                        ],
                                      )
                              ],
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text("Loading Type...."),
                      )),
              ),
              Obx(
                () => ownerControllers.isCategoryLoaded.value
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: BoxDecoration(border: Border.all(color: Constant.borderColor, width: 1.8), borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Store Category",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Wrap(
                                  children: [
                                    for (int i = 0; i < ownerControllers.storeCategoryRealData.value.data!.length; i++)
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                                        child: Obx(
                                          () => InkWell(
                                            onTap: () {
                                              if (ownerControllers.selectedCategoryId!.contains(ownerControllers.storeCategoryRealData.value.data![i].id.toString())) {
                                                ownerControllers.selectedCategoryId!.remove(ownerControllers.storeCategoryRealData.value.data![i].id.toString());
                                              } else {
                                                ownerControllers.selectedCategoryId!.add(ownerControllers.storeCategoryRealData.value.data![i].id.toString());
                                              }
                                              print(ownerControllers.selectedCategoryId!);
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: (ownerControllers.selectedCategoryId!.contains(ownerControllers.storeCategoryRealData.value.data![i].id.toString())) ? Constant.secondaryColor.withOpacity(1) : Colors.transparent,
                                                    border: Border.all(
                                                      color: Constant.secondaryColor.withOpacity(1),
                                                    ),
                                                    borderRadius: BorderRadius.all(Radius.circular(20))),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    ownerControllers.storeCategoryRealData.value.data![i].name!,
                                                    style: TextStyle(
                                                      color: (ownerControllers.selectedCategoryId!.contains(ownerControllers.storeCategoryRealData.value.data![i].id.toString())) ? Constant.white : Constant.black,
                                                    ),
                                                  ),
                                                )),
                                          ),
                                        ),
                                      )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text("Loading Type...."),
                      )),
              ),

              // Obx(
              //   () => ownerControllers.isCategoryLoaded.value
              //       ? Padding(
              //           padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
              //           child: GetBuilder<OwnerControllers>(
              //             builder: (ownerControllers) => MultiSelectChipField(
              //               items: ownerControllers.itemsCategory,
              //               initialValue: ownerControllers.selectedStoreCategory,
              //               title: Text(
              //                 "Store Category",
              //                 style: TextStyle(color: Constant.black),
              //               ),
              //               searchable: true,
              //               showHeader: true,
              //               searchTextStyle: TextStyle(fontSize: 12),
              //               headerColor: Constant.greyBack,
              //               decoration: BoxDecoration(
              //                   border: Border.all(
              //                       color: Constant.borderColor, width: 1.8),
              //                   borderRadius:
              //                       BorderRadius.all(Radius.circular(10))),
              //               selectedChipColor:
              //                   Constant.secondaryColor.withOpacity(1),
              //               selectedTextStyle: TextStyle(color: Constant.white),
              //               scroll: false,
              //               scrollBar: HorizontalScrollBar(isAlwaysShown: true),
              //               onTap: (values) {
              //                 //_selectedAnimals4 = values;
              //                 // ownerControllers.selectedStoreCategory.addAll(values.map((e) => e.toString()));
              //                 ownerControllers.selectedCategoryId!
              //                     .addAll(values.map((e) => e.toString()));
              //                 // print(ownerControllers.selectedCategoryId[);
              //                 // ownerControllers.selectedCategoryId!.value =
              //                 //     values.map((e) => e.toString());
              //                 print("jjk");
              //                 // ownerControllers.selectedStoreCategory = values;
              //                 print(values);
              //               },
              //             ),
              //           ),
              //         )
              //       : Center(
              //           child: Padding(
              //           padding: const EdgeInsets.all(15),
              //           child: Text("Loading Category...."),
              //         )),
              // ),

              Obx(
                () => ownerControllers.isTypeLoaded.value
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: BoxDecoration(border: Border.all(color: Constant.borderColor, width: 1.8), borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Service Category",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Wrap(
                                  children: [
                                    for (int i = 0; i < ownerControllers.categoryData.value.data!.length; i++)
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                                        child: Obx(
                                          () => InkWell(
                                            onTap: () {
                                              ownerControllers.selectedStoreTypeId.value = ownerControllers.categoryData.value.data![i].id.toString();
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: (ownerControllers.selectedStoreTypeId.value == ownerControllers.categoryData.value.data![i].id.toString()) ? Constant.secondaryColor.withOpacity(1) : Colors.transparent,
                                                    border: Border.all(
                                                      color: Constant.secondaryColor.withOpacity(1),
                                                    ),
                                                    borderRadius: BorderRadius.all(Radius.circular(20))),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    ownerControllers.categoryData.value.data![i].name!,
                                                    style: TextStyle(
                                                      color: (ownerControllers.selectedStoreTypeId.value == ownerControllers.categoryData.value.data![i].id.toString()) ? Constant.white : Constant.black,
                                                    ),
                                                  ),
                                                )),
                                          ),
                                        ),
                                      )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text("Loading Type...."),
                      )),
              ),

              Obx(
                () => Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: MyListTile(
                    margin: EdgeInsets.all(20),
                    title: "Thumbnail Image",
                    trailingIconData: (ownerControllers.isImageSelected.value && ownerControllers.selectedImage != null) ? Icons.check_circle : Icons.cloud_upload,
                    trailingColor: (ownerControllers.isImageSelected.value && ownerControllers.selectedImage != null) ? Colors.green[700] : Colors.red,
                    onPressed: () async {
                      ownerControllers.pickImage();
                    },
                    leadingImageName: null,
                    subtitle: null,
                  ),
                ),
              ),

              GetBuilder<OwnerControllers>(
                builder: (getstarted) => getstarted.isImageSelected.value && getstarted.selectedImage != null
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Image.file(getstarted.selectedImage.value),
                      )
                    : Container(),
              ),

              // Align(
              //   alignment: Alignment.topLeft,
              //   child: Padding(
              //     padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              //     child: Text(
              //       "Select Gallery Images*",
              //       style: TextStyle(
              //           fontSize: 16,
              //           fontWeight: FontWeight.bold,
              //           fontFamily: "Poppins_Bold"),
              //     ),
              //   ),
              // ),
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: Padding(
              //     padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
              //     child: Obx(
              //       () => Text(
              //         "${ownerControllers.selectedGalleryImage!.length} Image Selected",
              //         style: TextStyle(
              //             fontSize: 14,
              //             color: Constant.greyDark,
              //             fontFamily: "Poppins"),
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
              //   child: GetBuilder<OwnerControllers>(
              //     builder: (ownerControllers) => GridView.builder(
              //       itemBuilder: (context, index) {
              //         if (ownerControllers.selectedGalleryImage!.length ==
              //             index) {
              //           return InkWell(
              //             onTap: () {
              //               ownerControllers.pickGalleryImages();
              //             },
              //             child: Container(
              //               decoration: BoxDecoration(
              //                   border: Border.all(
              //                       color: Constant.borderColor, width: 1.8),
              //                   borderRadius:
              //                       BorderRadius.all(Radius.circular(10))),
              //               child: Padding(
              //                 padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              //                 child: Icon(Icons.add_circle),
              //               ),
              //             ),
              //           );
              //         } else {
              //           return Container(
              //             decoration: BoxDecoration(
              //                 border: Border.all(
              //                     color: Constant.borderColor, width: 1.8),
              //                 borderRadius:
              //                     BorderRadius.all(Radius.circular(10))),
              //             child: Stack(
              //               children: [
              //                 Padding(
              //                   padding:
              //                       const EdgeInsets.fromLTRB(5, 10, 5, 10),
              //                   child: Center(
              //                     child: Image.file(ownerControllers
              //                         .selectedGalleryImage!
              //                         .elementAt(index) as File),
              //                   ),
              //                 ),
              //                 Align(
              //                   child: InkWell(
              //                       child: Padding(
              //                         padding:
              //                             const EdgeInsets.fromLTRB(5, 5, 5, 0),
              //                         child: Icon(
              //                           Icons.remove_circle,
              //                           color: Colors.red,
              //                         ),
              //                       ),
              //                       onTap: () {
              //                         ownerControllers.selectedGalleryImage!
              //                             .removeAt(index);
              //                         ownerControllers.update();
              //                       }),
              //                   alignment: Alignment.topRight,
              //                 ),
              //               ],
              //             ),
              //           );
              //         }
              //       },
              //       itemCount:
              //           ownerControllers.selectedGalleryImage!.length + 1,
              //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount:
              //               ownerControllers.selectedGalleryImage!.length > 0
              //                   ? 2
              //                   : 1,
              //           crossAxisSpacing: 10,
              //           mainAxisSpacing: 10),
              //       shrinkWrap: true,
              //       reverse: true,
              //       physics: NeverScrollableScrollPhysics(),
              //     ),
              //   ),
              // ),
              CustomButton(
                title: "Save",
                onTap: () {
                  if (ownerControllers.selectedZoneId!.isEmpty || ownerControllers.selectedCategoryId!.isEmpty || ownerControllers.selectedStoreTypeId.isEmpty) {
                    Utility.showSingleSuccessToast("Fields cant be empty");
                  } else {
                    if (ownerControllers.addRestaurantKey.currentState!.validate()) {
                      ownerControllers.addRestaurantKey.currentState!.save();
                      if (ownerControllers.isImageSelected.value == true) {
                        if (status == "Add") {
                          ownerControllers.addStore();
                        } else {
                          ownerControllers.editStore(storeId);
                          // ownerControllers.EditRestaurant();
                        }
                      } else {
                        Utility.showToastError("select all feilds", "error");
                      }
                    }
                  }
                },
                borderRadius: 25,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                height: 65,
                textColor: Constant.white,
                backgroundColor: Constant.black,
              ),

              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<TimeOfDay> chooseTimePicker(int type, BuildContext context) async {
    TimeOfDay _time = TimeOfDay.now();
    TimeOfDay picked;
    picked = (await showTimePicker(context: context, initialTime: _time, initialEntryMode: TimePickerEntryMode.input))!;
    print(picked);
    if (type == 0) {
      ownerControllers.openTimeEditingController.text = picked.toString();
      ownerControllers.openTime.value = picked.hour.toString();
    } else {
      ownerControllers.closeTimeEditingController.text = picked.toString();
      ownerControllers.closeTime.value = picked.hour.toString();
    }
    ownerControllers.update();
    return _time = picked;
  }
}
