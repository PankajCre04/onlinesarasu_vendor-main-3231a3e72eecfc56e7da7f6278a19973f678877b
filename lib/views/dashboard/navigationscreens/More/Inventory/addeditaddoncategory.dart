import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/utils.dart';
import 'package:sooooperbusiness/controllers/inventory/addonController.dart';
import 'package:sooooperbusiness/views/components/custombutton.dart';
import 'package:sooooperbusiness/views/components/my_list_tile.dart';
import 'package:sooooperbusiness/views/components/my_text_field.dart';

class AddEditAddOnCategory extends StatelessWidget {
  final addonCategoryStatus;
  final variantId;
  final index;
  final variantIndex;

  AddEditAddOnCategory(this.addonCategoryStatus,this.variantId,this.index,this.variantIndex);

  AddonController addonController = Get.find();

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
          "$addonCategoryStatus Variant",
          style: TextStyle(
            fontSize: 16.0,
            color: Constant.black,
            fontFamily: 'Poppins_Bold',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: addonController.addEditAddonCategoryFormKey,
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: MyTextField(
                    controller: addonController.variantNameController,
                    borderRadius: 10,
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    onChanged: (value) {},
                    labelText: 'Enter Variant name',
                    borderColor: Constant.borderColor,
                    focusedBorderColor: Constant.black,
                    borderWidth: 2,
                    keyboardType: TextInputType.name,
                    showTrailingWidget: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Variant name ';
                      }
                      return null;
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: MyTextField(
                    controller: addonController.variantPriceController,
                    borderRadius: 10,
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    onChanged: (value) {},
                    labelText: 'Enter Variant Price',
                    borderColor: Constant.borderColor,
                    focusedBorderColor: Constant.black,
                    borderWidth: 2,
                    keyboardType: TextInputType.number,
                    showTrailingWidget: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Variant Price ';
                      }
                      return null;
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: MyTextField(
                    controller: addonController.variantDiscountPriceController,
                    borderRadius: 10,
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    onChanged: (value) {},
                    labelText: 'Enter Variant Discount price',
                    borderColor: Constant.borderColor,
                    focusedBorderColor: Constant.black,
                    borderWidth: 2,
                    keyboardType: TextInputType.number,
                    showTrailingWidget: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Variant Discount price ';
                      }
                      return null;
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: MyTextField(
                    controller: addonController.variantQuantityController,
                    borderRadius: 10,
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    onChanged: (value) {},
                    labelText: 'Enter Variant Quantity',
                    borderColor: Constant.borderColor,
                    focusedBorderColor: Constant.black,
                    borderWidth: 2,
                    keyboardType: TextInputType.number,
                    showTrailingWidget: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Variant Quantity ';
                      }
                      return null;
                    },
                  )),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: GetBuilder<AddonController>(
                    builder: (controller) => Obx(
                          () => controller.isVariantImageSelected.value &&
                          controller.selectedVariantImage.value != null
                          ? Padding(
                        padding: const EdgeInsets.fromLTRB(
                            10, 0, 10, 0),
                        child: Image.file(controller
                            .selectedVariantImage.value),
                      )
                          : Container(),
                    )),
              ),

              Obx(
                    () => Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: MyListTile(
                    margin: EdgeInsets.all(20),
                    title: "Variant Image",
                    trailingIconData:
                    (addonController.isVariantImageSelected.value &&
                        addonController.selectedVariantImage.value !=
                            null)
                        ? Icons.check_circle
                        : Icons.cloud_upload,
                    trailingColor:
                    (addonController.isVariantImageSelected.value &&
                        addonController.selectedVariantImage != null)
                        ? Colors.green[700]
                        : Colors.red,
                    onPressed: () async {
                      addonController.pickImage();
                    },
                    leadingImageName: null,
                    subtitle: null,
                  ),
                ),
              ),
              // Padding(
              //     padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              //     child: MyTextField(
              //       controller:
              //           addonController.addonCategoryDescriptionController,
              //       borderRadius: 10,
              //       contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              //       onChanged: (value) {},
              //       labelText: 'Offer Description',
              //       borderColor: Constant.borderColor,
              //       focusedBorderColor: Constant.black,
              //       borderWidth: 2,
              //       minLine: 3,
              //       maxLine: 5,
              //       keyboardType: TextInputType.multiline,
              //       showTrailingWidget: true,
              //       validator: (value) {
              //         if (value!.isEmpty) {
              //           return 'Enter Offer Description ';
              //         }
              //         return null;
              //       },
              //     )),
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
              //         value: addonController.addonCategoryType.value,
              //         icon: Icon(
              //           Icons.arrow_drop_down_circle_rounded,
              //           color: Constant.secondaryColor,
              //         ),
              //         iconSize: 20,
              //         underline: SizedBox(),
              //         isExpanded: true,
              //         style: const TextStyle(color: Colors.black),
              //         onChanged: (String? newValue) {
              //           addonController.addonCategoryType.value = newValue!;
              //         },
              //         items: <String>[
              //           'Select Addon Category type',
              //           'Multiple Selection',
              //           'Single Selection'
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
              // (addonController.addonCategoryType.value ==
              //         "Multiple Selection")
              //     ? Padding(
              //         padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              //         child: MyTextField(
              //           controller: addonController.addonCategoryMinCount,
              //           borderRadius: 10,
              //           contentPadding:
              //               const EdgeInsets.fromLTRB(20, 15, 20, 15),
              //           onChanged: (value) {},
              //           labelText: 'Enter Addon Category min count',
              //           borderColor: Constant.borderColor,
              //           focusedBorderColor: Constant.black,
              //           borderWidth: 2,
              //           keyboardType: TextInputType.number,
              //           showTrailingWidget: true,
              //           // validator: (value) {
              //           //   if (value!.isEmpty) {
              //           //     return 'Enter Addon Category min count';
              //           //   }
              //           //   return null;
              //           // },
              //         ))
              //     : Container(),
              // (addonController.addonCategoryType.value ==
              //         "Multiple Selection")
              //     ? Padding(
              //         padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              //         child: MyTextField(
              //           controller: addonController.addonCategoryMaxCount,
              //           borderRadius: 10,
              //           contentPadding:
              //               const EdgeInsets.fromLTRB(20, 15, 20, 15),
              //           onChanged: (value) {},
              //           labelText: 'Addon Category min count',
              //           borderColor: Constant.borderColor,
              //           focusedBorderColor: Constant.black,
              //           borderWidth: 2,
              //           keyboardType: TextInputType.number,
              //           showTrailingWidget: true,
              //           // validator: (value) {
              //           //   if (value!.isEmpty) {
              //           //     return 'Enter Addon Category min count';
              //           //   }
              //           //   return null;
              //           // },
              //         ))
              //     : Container(),
              SizedBox(
                height: 15,
              ),
              CustomButton(
                title: "$addonCategoryStatus Variant",
                onTap: () {
                  if (addonController
                      .addEditAddonCategoryFormKey.currentState!
                      .validate()) {
                    addonController.addEditAddonCategoryFormKey.currentState!
                        .save();
                    if (addonCategoryStatus == "Add") {
                      if(addonController.isVariantImageSelected.value){
                        addonController.AddVariant(index, variantIndex);
                      }else{
                        addonController.AddVariantWithoutImage(index, variantIndex);
                      }


                      //ownerControllers.addRestaurant();
                    } else {
                      if(addonController.isVariantImageSelected.value){
                        addonController.EditVariant(variantId.toString(),index,variantIndex);
                      }else{
                        addonController.EditVariantWithoutImage(variantId.toString(),index,variantIndex);
                      }

                      //offerController.EditOffer(offerId);
                      //ownerControllers.EditRestaurant();
                    }
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
      ),
    );
  }
}
