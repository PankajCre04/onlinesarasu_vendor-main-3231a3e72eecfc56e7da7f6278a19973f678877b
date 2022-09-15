import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/utils.dart';
import 'package:sooooperbusiness/controllers/maincontroller.dart';
import 'package:sooooperbusiness/controllers/offercontroller.dart';
import 'package:sooooperbusiness/views/components/custombutton.dart';
import 'package:sooooperbusiness/views/components/labeledcheckbox.dart';
import 'package:sooooperbusiness/views/components/my_list_tile.dart';
import 'package:sooooperbusiness/views/components/my_text_field.dart';

//import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';

class AddEditOffers extends StatelessWidget {
  final offerstatus;
  final offerId;

  AddEditOffers(this.offerstatus, this.offerId);

  OfferController offerController = Get.put(OfferController());

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
            offerstatus + " Coupon",
            style: TextStyle(
              fontSize: 16.0,
              color: Constant.black,
              fontFamily: 'Poppins_Bold',
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: offerController.addEditOfferFormKey,
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: MyTextField(
                      controller: offerController.offerCodeController,
                      borderRadius: 10,
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      onChanged: (value) {},
                      labelText: 'Enter Code',
                      borderColor: Constant.borderColor,
                      focusedBorderColor: Constant.black,
                      borderWidth: 2,
                      keyboardType: TextInputType.name,
                      showTrailingWidget: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Offer Code ';
                        }
                        return null;
                      },
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: MyTextField(
                      controller: offerController.offerDescriptionController,
                      borderRadius: 10,
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      onChanged: (value) {},
                      labelText: 'Coupon Description',
                      borderColor: Constant.borderColor,
                      focusedBorderColor: Constant.black,
                      borderWidth: 2,
                      minLine: 3,
                      maxLine: 5,
                      keyboardType: TextInputType.multiline,
                      showTrailingWidget: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Offer Description ';
                        }
                        return null;
                      },
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: MyTextField(
                      controller: offerController.maxUsePerUserController,
                      borderRadius: 10,
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      onChanged: (value) {},
                      labelText: 'Enter max use per user',
                      borderColor: Constant.borderColor,
                      focusedBorderColor: Constant.black,
                      borderWidth: 2,
                      keyboardType: TextInputType.number,
                      showTrailingWidget: true,
                      // prefixWidget: Padding(
                      //   padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      //   child: Text("+91"),
                      // ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter max use per user ';
                        }
                        return null;
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _selectDate(0, context);
                          },
                          child: MyTextField(
                            controller: offerController.startDateController,
                            borderRadius: 10,
                            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            onChanged: (value) {},
                            isEnabled: false,
                            labelText: 'Start Date',
                            borderColor: Constant.borderColor,
                            focusedBorderColor: Constant.black,
                            borderWidth: 2,
                            keyboardType: TextInputType.number,
                            showTrailingWidget: true,
                            overrideHintText: true,
                            hintText: "Start",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Start Date';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _selectDate(1, context);
                          },
                          child: MyTextField(
                            controller: offerController.endDateController,
                            borderRadius: 10,
                            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            onChanged: (value) {},
                            labelText: 'End Date',
                            isEnabled: false,
                            borderColor: Constant.borderColor,
                            focusedBorderColor: Constant.black,
                            borderWidth: 2,
                            overrideHintText: true,
                            hintText: "End Date",
                            keyboardType: TextInputType.number,
                            showTrailingWidget: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter End Date';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: MyTextField(
                      controller: offerController.minCartValueController,
                      borderRadius: 10,
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      onChanged: (value) {},
                      labelText: 'Min Cart Value',
                      borderColor: Constant.borderColor,
                      focusedBorderColor: Constant.black,
                      borderWidth: 2,
                      keyboardType: TextInputType.number,
                      showTrailingWidget: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Min Cart Value ';
                        }
                        return null;
                      },
                    )),
                Obx(() {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Constant.white, border: Border.all(color: Colors.grey.shade300, width: 2)),
                      child: DropdownButton<String>(
                        value: offerController.discountType.value,
                        icon: Icon(
                          Icons.arrow_drop_down_circle_rounded,
                          color: Constant.secondaryColor,
                        ),
                        iconSize: 20,
                        underline: SizedBox(),
                        isExpanded: true,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? newValue) {
                          offerController.discountType.value = newValue!;
                        },
                        items: <String>['Select discount type', 'FREE DELIVERY', 'WALLET CASHBACK', 'FLAT'].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                }),
                // Obx(() {
                //   return Padding(
                //     padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                //     child: Container(
                //       padding: EdgeInsets.only(left: 20, right: 10),
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           color: Constant.white,
                //           border: Border.all(
                //               color: Colors.grey.shade300, width: 2)),
                //       child: DropdownButton<String>(
                //         value: offerController.couponType.value,
                //         icon: Icon(
                //           Icons.arrow_drop_down_circle_rounded,
                //           color: Constant.secondaryColor,
                //         ),
                //         iconSize: 20,
                //         underline: SizedBox(),
                //         isExpanded: true,
                //         style: const TextStyle(color: Colors.black),
                //         onChanged: (String? newValue) {
                //           offerController.couponType.value = newValue!;
                //         },
                //         items: <String>[
                //           'Select coupon type',
                //           'DISCOUNT',
                //           'CASHBACK'
                //         ].map<DropdownMenuItem<String>>((String value) {
                //           return DropdownMenuItem<String>(
                //             value: value,
                //             child: Text(value),
                //           );
                //         }).toList(),
                //       ),
                //     ),
                //   );
                // }),

                Obx(() => Column(
                      children: [
                        (offerController.discountType.value == "FREE DELIVERY")
                            ? Container()
                            : Padding(
                                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                                child: MyTextField(
                                  controller: offerController.discountValueController,
                                  borderRadius: 10,
                                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  onChanged: (value) {},
                                  labelText: 'Discount value',
                                  borderColor: Constant.borderColor,
                                  focusedBorderColor: Constant.black,
                                  borderWidth: 2,
                                  keyboardType: TextInputType.number,
                                  showTrailingWidget: true,
                                  validator: (value) {
                                    if (offerController.discountType.value == "FREE DELIVERY") {
                                      if (value!.isEmpty) {
                                        return 'Enter Discount value ';
                                      }
                                    }

                                    return null;
                                  },
                                )),
                        (offerController.discountType.value == "FREE DELIVERY")
                            ? Container()
                            : Padding(
                                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                                child: MyTextField(
                                  controller: offerController.maxDiscountValueController,
                                  borderRadius: 10,
                                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  onChanged: (value) {},
                                  labelText: 'Max Discount',
                                  borderColor: Constant.borderColor,
                                  focusedBorderColor: Constant.black,
                                  borderWidth: 2,
                                  keyboardType: TextInputType.number,
                                  showTrailingWidget: true,
                                  validator: (value) {
                                    if (offerController.discountType.value != "FREE DELIVERY") {
                                      if (value!.isEmpty) {
                                        return 'Enter Max Discount value ';
                                      }
                                    }

                                    return null;
                                  },
                                )),
                      ],
                    )),

                // Padding(
                //   padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                //   child: Obx(() {
                //     return LabelCheckBox(
                //         borderColor: Constant.borderColor,
                //         borderRadius: 10,
                //         borderWidth: 2,
                //         labelText: "Is Private?",
                //         onChanged: (value) {
                //           offerController.isPrivate.value = value!;
                //         },
                //         defaultValue: offerController.isPrivate.value);
                //   }),
                // ),
                Obx(() {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: LabelCheckBox(
                        borderColor: Constant.borderColor,
                        borderRadius: 10,
                        borderWidth: 2,
                        labelText: "Is Active?",
                        onChanged: (value) {
                          offerController.isActive.value = value!;
                        },
                        defaultValue: offerController.isActive.value),
                  );
                }),
                SizedBox(
                  height: 10,
                ),
                GetBuilder<OfferController>(
                    builder: (controller) => Obx(
                          () => controller.isCouponImageSelected.value && controller.selectedCouponImage.value != null
                              ? Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Image.file(controller.selectedCouponImage.value),
                                )
                              : Container(),
                        )),

                Obx(
                  () => Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: MyListTile(
                      margin: EdgeInsets.all(20),
                      title: "Product Image",
                      trailingIconData: (offerController.isCouponImageSelected.value && offerController.selectedCouponImage.value != null) ? Icons.check_circle : Icons.cloud_upload,
                      trailingColor: (offerController.isCouponImageSelected.value && offerController.selectedCouponImage != null) ? Colors.green[700] : Colors.red,
                      onPressed: () async {
                        offerController.pickImage();
                      },
                      leadingImageName: null,
                      subtitle: null,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomButton(
                  title: "$offerstatus Offer",
                  onTap: () {
                    if (offerController.addEditOfferFormKey.currentState!.validate()) {
                      offerController.addEditOfferFormKey.currentState!.save();
                      if (offerController.discountType.value == "Select discount type") {
                        Utility.showToastError("Please Select Discount Type", "Data Error");
                      }
                      // else if (offerController.couponType.value ==
                      //     "Select coupon type") {
                      //   Utility.showToastError(
                      //       "Please Select Coupon Type", "Data Error");
                      // }
                      else {
                        if (offerstatus == "Add") {
                          offerController.AddOffer();
                          //ownerControllers.addRestaurant();
                        } else {
                          offerController.EditOffer(offerId.toString());
                          //ownerControllers.EditRestaurant();
                        }
                      }
                    } else if (offerController.startDateController.text == "" && offerController.endDateController.text == "") {
                      Utility.showToastError("Please Select Start and End date", "Date Error");
                    }
                  },
                  borderRadius: 25,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
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
        ));
  }

  Future<Null> _selectDate(int type, BuildContext context) async {
    final DateTime? picked = await showDatePicker(context: context, initialDate: offerController.selectedDate, initialDatePickerMode: DatePickerMode.day, firstDate: DateTime(2015), lastDate: DateTime(2101));
    if (picked != null) if (type == 0) {
      offerController.startDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      //ownerControllers.openTime.value = picked.hour.toString();
    } else {
      offerController.endDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      //ownerControllers.closeTime.value = picked.hour.toString();
    }
    // setState(() {
    //   selectedDate = picked;
    //   _dateController.text = DateFormat.yMd().format(selectedDate);
    // });
  }

// Future<TimeOfDay> chooseTimePicker(int type, BuildContext context) async {
//   TimeOfDay _time = TimeOfDay.now();
//   TimeOfDay picked;
//   picked = (await showTimePicker(
//       context: context,
//       initialTime: _time,
//       initialEntryMode: TimePickerEntryMode.input))!;
//   print(picked);
//   if (type == 0) {
//     ownerControllers.openTimeEditingController.text = picked.toString();
//     ownerControllers.openTime.value = picked.hour.toString();
//   } else {
//     ownerControllers.closeTimeEditingController.text = picked.toString();
//     ownerControllers.closeTime.value = picked.hour.toString();
//   }
//   ownerControllers.update();
//   return _time = picked;
// }

}
