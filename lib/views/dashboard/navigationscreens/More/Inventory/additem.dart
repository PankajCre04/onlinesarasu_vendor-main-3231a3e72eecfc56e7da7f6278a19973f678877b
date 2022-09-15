import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/single_choice_chip.dart';
import 'package:sooooperbusiness/commons/utils.dart';
import 'package:sooooperbusiness/controllers/inventory/addonController.dart';
import 'package:sooooperbusiness/controllers/inventory/inventoryController.dart';
import 'package:sooooperbusiness/controllers/offercontroller.dart';
import 'package:sooooperbusiness/model/more/inventory/addoncategorydata.dart';
import 'package:sooooperbusiness/views/components/custombutton.dart';
import 'package:sooooperbusiness/views/components/labeledcheckbox.dart';
import 'package:sooooperbusiness/views/components/my_cached_network_image.dart';
import 'package:sooooperbusiness/views/components/my_list_tile.dart';
import 'package:sooooperbusiness/views/components/my_text_field.dart';

class AddProduct extends StatelessWidget {
  final status;
  final id;
  final index;

  AddProduct(this.status, this.id, this.index);

  InventoryController controller = Get.put(InventoryController());
  OfferController offerController = Get.put(OfferController());
  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;
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
          "$status Product",
          style: TextStyle(
            fontSize: 16.0,
            color: Constant.black,
            fontFamily: 'Poppins_Bold',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
              child: Text(
                'Enter Details',
                style: TextStyle(fontSize: 20, letterSpacing: 1, fontWeight: FontWeight.bold, color: Constant.black, fontFamily: 'Poppins_Bold'),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 5.0, 10.0, 0.0),
                child: Obx(() {
                  return Form(
                    key: controller.additemformkey,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, right: 6),
                        child: MyTextField(
                          controller: controller.productNameController,
                          borderRadius: 10,
                          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          onChanged: (value) {},
                          labelText: 'Name',
                          borderColor: Constant.borderColor,
                          focusedBorderColor: Constant.black,
                          borderWidth: 2,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Name';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, right: 6),
                        child: MyTextField(
                          controller: controller.productDescriptionController,
                          borderRadius: 10,
                          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          onChanged: (value) {},
                          labelText: 'Description',
                          borderColor: Constant.borderColor,
                          focusedBorderColor: Constant.black,
                          borderWidth: 2,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Description';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, right: 6),
                        child: MyTextField(
                          controller: controller.productPriceController,
                          borderRadius: 10,
                          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          onChanged: (value) {},
                          labelText: 'Item Price',
                          borderColor: Constant.borderColor,
                          focusedBorderColor: Constant.black,
                          keyboardType: TextInputType.number,
                          borderWidth: 2,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Item Price';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, right: 6),
                        child: MyTextField(
                          controller: controller.productSalePriceController,
                          borderRadius: 10,
                          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          onChanged: (value) {},
                          labelText: 'Item Sale Price (Optional)',
                          borderColor: Constant.borderColor,
                          focusedBorderColor: Constant.black,
                          keyboardType: TextInputType.number,
                          borderWidth: 2,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, right: 6),
                        child: MyTextField(
                          controller: controller.productQuantityController,
                          borderRadius: 10,
                          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          onChanged: (value) {},
                          labelText: 'Quantity',
                          borderColor: Constant.borderColor,
                          focusedBorderColor: Constant.black,
                          keyboardType: TextInputType.number,
                          borderWidth: 2,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Quantity';
                            }
                            return null;
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 15, 8, 0),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  controller.selectedOpenTimeController.text = await controller.selectTime(context);
                                },
                                child: MyTextField(
                                  controller: controller.selectedOpenTimeController,
                                  borderRadius: 10,
                                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  onChanged: (value) {},
                                  isEnabled: false,
                                  labelText: 'Start Time',
                                  borderColor: Constant.borderColor,
                                  focusedBorderColor: Constant.black,
                                  borderWidth: 2,
                                  keyboardType: TextInputType.number,
                                  showTrailingWidget: true,
                                  overrideHintText: true,
                                  hintText: "Start",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Start Time';
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
                                onTap: () async {
                                  controller.selectedCloseTimeController.text = await controller.selectTime(context);
                                },
                                child: MyTextField(
                                  controller: controller.selectedCloseTimeController,
                                  borderRadius: 10,
                                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  onChanged: (value) {},
                                  labelText: 'End Time',
                                  isEnabled: false,
                                  borderColor: Constant.borderColor,
                                  focusedBorderColor: Constant.black,
                                  borderWidth: 2,
                                  overrideHintText: true,
                                  hintText: "End Time",
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
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
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
                                  "Product Category",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Wrap(
                                  children: [
                                    for (int i = 0; i < controller.allProductCategory.length; i++)
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                                        child: Obx(
                                          () => InkWell(
                                            onTap: () {
                                              print("clicked");
                                              controller.selectedProductCategory.value = controller.allProductCategory[i].id.toString();
                                              controller.GetProductSubCategory(controller.allProductCategory[i].id.toString());
                                            },
                                            child: controller.allProductCategory[i].name == null
                                                ? Container()
                                                : Container(
                                                    decoration: BoxDecoration(
                                                        color: (controller.selectedProductCategory.value == controller.allProductCategory[i].id.toString()) ? Constant.secondaryColor.withOpacity(1) : Colors.transparent,
                                                        border: Border.all(
                                                          color: Constant.secondaryColor.withOpacity(1),
                                                        ),
                                                        borderRadius: BorderRadius.all(Radius.circular(20))),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(
                                                        controller.allProductCategory[i].name!,
                                                        style: TextStyle(
                                                          color: (controller.selectedProductCategory.value == controller.allProductCategory[i].id.toString()) ? Constant.white : Constant.black,
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
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      (controller.productSubCategoryData.value.data == null)
                          ? Container()
                          : (controller.productSubCategoryData.value.data!.length == 0)
                              ? Container()
                              : Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
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
                                            "Product Sub Category",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Wrap(
                                            children: [
                                              for (int i = 0; i < controller.productSubCategoryData.value.data!.length; i++)
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                                                  child: Obx(
                                                    () => InkWell(
                                                      onTap: () {
                                                        controller.selectedProductCategory.value = controller.productSubCategoryData.value.data![i].id.toString();
                                                      },
                                                      child: Container(
                                                          decoration: BoxDecoration(
                                                              color: (controller.selectedProductCategory.value == controller.productSubCategoryData.value.data![i].id.toString()) ? Constant.secondaryColor.withOpacity(1) : Colors.transparent,
                                                              border: Border.all(
                                                                color: Constant.secondaryColor.withOpacity(1),
                                                              ),
                                                              borderRadius: BorderRadius.all(Radius.circular(20))),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Text(
                                                              controller.productSubCategoryData.value.data![i].name!,
                                                              style: TextStyle(
                                                                color: (controller.selectedProductCategory.value == controller.productSubCategoryData.value.data![i].id.toString()) ? Constant.white : Constant.black,
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
                                ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
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
                                  "Product Type",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Wrap(
                                  children: [
                                    for (int i = 0; i < controller.productType.length; i++)
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                                        child: Obx(
                                          () => InkWell(
                                            onTap: () {
                                              controller.selectedProductType.value = controller.productType[i].toString();
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: (controller.selectedProductType.value == controller.productType[i].toString()) ? Constant.secondaryColor.withOpacity(1) : Colors.transparent,
                                                    border: Border.all(
                                                      color: Constant.secondaryColor.withOpacity(1),
                                                    ),
                                                    borderRadius: BorderRadius.all(Radius.circular(20))),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    controller.productType[i],
                                                    style: TextStyle(
                                                      color: (controller.selectedProductType.value == controller.productType[i].toString()) ? Constant.white : Constant.black,
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
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
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
                                  "Product Tag",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Wrap(
                                  children: [
                                    for (int i = 0; i < controller.productTags.length; i++)
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                                        child: Obx(
                                          () => InkWell(
                                            onTap: () {
                                              controller.selectedProductTag.value = controller.productTags[i].toString();
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: (controller.selectedProductTag.value == controller.productTags[i].toString()) ? Constant.secondaryColor.withOpacity(1) : Colors.transparent,
                                                    border: Border.all(
                                                      color: Constant.secondaryColor.withOpacity(1),
                                                    ),
                                                    borderRadius: BorderRadius.all(Radius.circular(20))),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    controller.productTags[i],
                                                    style: TextStyle(
                                                      color: (controller.selectedProductTag.value == controller.productTags[i].toString()) ? Constant.white : Constant.black,
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
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
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
                                  "Product Unit",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Wrap(
                                  children: [
                                    for (int i = 0; i < controller.productUnits.length; i++)
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                                        child: Obx(
                                          () => InkWell(
                                            onTap: () {
                                              controller.selectedProductUnit.value = controller.productUnits[i].toString();
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: (controller.selectedProductUnit.value == controller.productUnits[i].toString()) ? Constant.secondaryColor.withOpacity(1) : Colors.transparent,
                                                    border: Border.all(
                                                      color: Constant.secondaryColor.withOpacity(1),
                                                    ),
                                                    borderRadius: BorderRadius.all(Radius.circular(20))),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    controller.productUnits[i],
                                                    style: TextStyle(
                                                      color: (controller.selectedProductUnit.value == controller.productUnits[i].toString()) ? Constant.white : Constant.black,
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
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
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
                                  "Coupons",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Wrap(
                                  children: [
                                    for (int i = 0; i < offerController.promoDataList.length; i++)
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                                        child: Obx(
                                          () => InkWell(
                                            onTap: () {
                                              if (offerController.selectedCoupons!.contains(offerController.promoDataList[i].id.toString())) {
                                                offerController.selectedCoupons!.remove(offerController.promoDataList[i].id.toString());
                                              } else {
                                                offerController.selectedCoupons!.add(offerController.promoDataList[i].id.toString());
                                              }
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: (offerController.selectedCoupons!.contains(offerController.promoDataList[i].id.toString()) ? Constant.secondaryColor.withOpacity(1) : Colors.transparent),
                                                    border: Border.all(
                                                      color: Constant.secondaryColor.withOpacity(1),
                                                    ),
                                                    borderRadius: BorderRadius.all(Radius.circular(20))),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    offerController.promoDataList[i].code.toString(),
                                                    style: TextStyle(
                                                      color: offerController.selectedCoupons!.contains(offerController.promoDataList[i].id.toString()) ? Constant.white : Constant.black,
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
                      ),
                      // Align(

                      SizedBox(
                        height: 2,
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, right: 6),
                        child: LabelCheckBox(
                            borderColor: Constant.borderColor,
                            borderRadius: 10,
                            borderWidth: 2,
                            labelText: "Is Active?",
                            onChanged: (value) {
                              controller.isActive.value = value!;
                            },
                            defaultValue: controller.isActive.value),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 6.0, right: 6),
                      //   child: LabelCheckBox(
                      //       borderColor: Constant.borderColor,
                      //       borderRadius: 10,
                      //       borderWidth: 2,
                      //       labelText: "Is Popular?",
                      //       onChanged: (value) {
                      //         controller.isPopular.value = value!;
                      //       },
                      //       defaultValue: controller.isPopular.value),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 6.0, right: 6),
                      //   child: LabelCheckBox(
                      //       borderColor: Constant.borderColor,
                      //       borderRadius: 10,
                      //       borderWidth: 2,
                      //       labelText: "Is New?",
                      //       onChanged: (value) {
                      //         controller.isNew.value = value!;
                      //       },
                      //       defaultValue: controller.isNew.value),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 6.0, right: 6),
                      //   child: LabelCheckBox(
                      //       borderColor: Constant.borderColor,
                      //       borderRadius: 10,
                      //       borderWidth: 2,
                      //       labelText: "Is Non-Veg?",
                      //       onChanged: (value) {
                      //         controller.isNonveg.value = value!;
                      //       },
                      //       defaultValue: controller.isNonveg.value),
                      // ),

                      GetBuilder<InventoryController>(
                          builder: (controller) => Obx(
                                () => controller.isProductImageSelected.value && controller.selectedProductImage.value != null
                                    ? Padding(
                                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child: Image.file(controller.selectedProductImage.value),
                                      )
                                    : Container(),
                              )),

                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: MyListTile(
                            margin: EdgeInsets.all(20),
                            title: "Product Image",
                            trailingIconData: (controller.isProductImageSelected.value && controller.selectedProductImage.value != null) ? Icons.check_circle : Icons.cloud_upload,
                            trailingColor: (controller.isProductImageSelected.value && controller.selectedProductImage != null) ? Colors.green[700] : Colors.red,
                            onPressed: () async {
                              controller.idType.value = "Image";
                              await controller.pickImage();
                            },
                            leadingImageName: null,
                            subtitle: null,
                          ),
                        ),
                      ),
                    ]),
                  );
                })),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: CustomButton(
                      title: "Save",
                      //0 title: "$status",
                      textColor: Constant.white,
                      textStyle: TextStyle(fontSize: 20, letterSpacing: 1, fontWeight: FontWeight.bold, color: Constant.white, fontFamily: 'Poppins'),
                      borderRadius: 25,
                      customPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      backgroundColor: Constant.secondaryColor,
                      onTap: () {
                        print("click");
                        if (controller.additemformkey.currentState!.validate()) {
                          controller.additemformkey.currentState!.save();
                          if (
                              // controller.isProductImageSelected.value &&
                              controller.selectedProductCategory.value != "" &&
                                  controller.selectedProductType.value != "" &&
                                  controller.selectedProductTag.value != "" &&
                                  controller.selectedProductUnit.value != "" &&
                                  controller.selectedOpenTimeController.text != "" &&
                                  controller.selectedCloseTimeController.text != "") {
                            if (status == "Add") {
                              if (controller.isProductImageSelected.value) {
                                print("Chiill");
                                controller.AddProduct();
                              } else {
                                controller.AddProductWithoutImage();
                              }
                            } else {
                              if (controller.isProductImageSelected.value) {
                                print("emdit");
                                print(id);
                                controller.EditProduct(id, index);
                              } else {
                                controller.EditProductWithoutImage(id, index);
                              }
                            }
                            print("success");
                            //Controller.AddCategory();
                          } else {
                            print("error");
                            Utility.showToastError("error", "Select All Fields");
                            return;
                          }
                        } else {
                          Utility.showToastError("error", "Select All Fields");
                        }

                        // }
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
