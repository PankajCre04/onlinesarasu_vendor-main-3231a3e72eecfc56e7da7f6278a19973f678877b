import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/loading_dialog.dart';
import 'package:sooooperbusiness/controllers/inventory/inventoryController.dart';
import 'package:sooooperbusiness/model/more/inventory/inventoryModel.dart';
import 'package:sooooperbusiness/model/more/inventory/productCategory.dart';

import '../addcategory.dart';

class Subcategory extends StatelessWidget {
  InventoryController controller = Get.put(InventoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
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
            "Sub Category",
            style: TextStyle(
              fontSize: 16.0,
              color: Constant.black,
              fontFamily: 'Poppins_Bold',
            ),
          ),


        ),
      ),
      body: Obx(()=>
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: (controller.subCategoryDataList.length == 0)
              ? Center(
            child: Container(
              child: Text(
                "No Data Found!",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          )
              : Container(
            child: Obx(()=>
              RefreshIndicator(
                onRefresh: () async {
                  controller.GetProductSubCategory(controller.selectedProductParentCategory.value.id.toString());
                },
                child: ListView.builder(
                  // itemCount: controller
                  //     .productSubCategoryData.value.data!.length,
                  itemCount: controller.subCategoryDataList.length,
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {

                            },
                          onLongPress: () {

                          },
                          child:
                          Card(
                            color: Constant.blueShadowBackground,
                            //elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          // CachedNetworkImage(
                                          //   width: 50,
                                          //   height: 50,
                                          //   imageUrl: (controller
                                          //       .productSubCategoryData.value.data![index].image!=
                                          //       null)
                                          //       ? (!controller
                                          //       .productSubCategoryData.value.data![
                                          //   index]
                                          //       .image!
                                          //       .startsWith(
                                          //       '/'))
                                          //       ? Constant
                                          //       .imageUrl +
                                          //       "/" +
                                          //       controller
                                          //           .productSubCategoryData.value.data![
                                          //       index]
                                          //           .image!
                                          //       : Constant
                                          //       .imageUrl +
                                          //       controller
                                          //           .productSubCategoryData.value.data![
                                          //       index]
                                          //           .image!
                                          //       : Constant.imageUrl +
                                          //       "/" +
                                          //       controller
                                          //           .productSubCategoryData.value.data![index]
                                          //           .image!,
                                          //   placeholder:
                                          //       (context, url) {
                                          //     return LoadingDialog();
                                          //   },
                                          //   errorWidget: (context,
                                          //       url, error) {
                                          //     return Icon(
                                          //       Icons.error_outline,
                                          //       color: Constant.black,
                                          //     );
                                          //   },
                                          // ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  controller.subCategoryDataList[index].name!,
                                                  style: TextStyle(
                                                      color: Constant
                                                          .black,
                                                      fontSize: 15,
                                                      fontFamily:
                                                      'Poppins-bold',
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                ),
                                                // Container(
                                                //   width: MediaQuery.of(
                                                //       context)
                                                //       .size
                                                //       .width *
                                                //       0.5,
                                                //   child: Text(
                                                //     inventorycontroller
                                                //         .productCategoryData.value.data![
                                                //     index]
                                                //         .description!,
                                                //     style: TextStyle(
                                                //       color: Constant
                                                //           .greyDark,
                                                //       fontSize: 12,
                                                //       fontFamily:
                                                //       'Poppins',
                                                //     ),
                                                //   ),
                                                // ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                // Text(
                                                //   "Rs. " +
                                                //       controller
                                                //           .itemList[
                                                //       index]
                                                //           .price!
                                                //           .toString(),
                                                //   style: TextStyle(
                                                //     color: Constant
                                                //         .greyDark,
                                                //     fontSize: 12,
                                                //     fontFamily:
                                                //     'Poppins',
                                                //   ),
                                                // ),
                                                // Text(
                                                //   "Quantity" +
                                                //       controller
                                                //           .itemList[
                                                //       index]
                                                //           .unit!
                                                //           .toString(),
                                                //   style: TextStyle(
                                                //     color: Constant
                                                //         .greyDark,
                                                //     fontSize: 12,
                                                //     fontFamily:
                                                //     'Poppins',
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          insertCategoryData(index);
                                          Get.to(AddCategory(
                                              "Add SubCategory",
                                              controller.subCategoryDataList[index]
                                                  .id!,
                                              "Edit",0,index));
                                        },
                                        child: Icon(
                                          Icons.edit,
                                          color: Constant.secondaryColor,
                                        ),
                                      )
                                      // Obx(
                                      //       () => FlutterSwitch(
                                      //     width: 50,
                                      //     height: 23,
                                      //     value: controller
                                      //         .acceptOrders[index],
                                      //     // value: controller.itemData.value.data!.results![index].isHidden!,
                                      //     borderRadius: 30.0,
                                      //     padding: 2,
                                      //     switchBorder: Border.all(
                                      //         color: Constant.black,
                                      //         width: 2),
                                      //     activeColor: Constant.white,
                                      //     inactiveColor:
                                      //     Constant.white,
                                      //     inactiveToggleColor:
                                      //     Constant.secondaryColor,
                                      //     activeToggleColor:
                                      //     Constant.successColor,
                                      //     showOnOff: false,
                                      //     onToggle: (val) {
                                      //       controller.acceptOrders[
                                      //       index] = val;
                                      //       controller.itemList[index]
                                      //           .active = val;
                                      //       if (val) {
                                      //         controller
                                      //             .UpdateItemStatus(
                                      //             val.toString(),
                                      //             controller
                                      //                 .itemList[
                                      //             index]
                                      //                 .id!.toString());
                                      //       } else {
                                      //         controller
                                      //             .UpdateItemStatus(
                                      //             val.toString(),
                                      //             controller
                                      //                 .itemList[
                                      //             index]
                                      //                 .id!.toString());
                                      //       }
                                      //     },
                                      //   ),
                                      // ),
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
                    // var categoryData = inventorycontroller.categoryData;
                    // inventorycontroller.acceptOrders[index] =
                    //     inventorycontroller
                    //         .categoryData.value.data!.results![index].isHidden!;

                    // return Column(
                    //   children: [
                    //     InkWell(
                    //       onLongPress: () {
                    //         showAlertDialog(
                    //             context,
                    //             inventorycontroller.productCategoryData.value.data![index].id.toString());
                    //       },
                    //       child: Card(
                    //         color: Constant.blueShadowBackground,
                    //         //elevation: 5,
                    //         child: ExpansionTile(
                    //           title: Container(
                    //               child: Row(
                    //             mainAxisAlignment:
                    //                 MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               Expanded(
                    //                 child: Container(
                    //                   child: Column(
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.start,
                    //                     children: [
                    //                       Container(
                    //                         width: MediaQuery.of(context)
                    //                                 .size
                    //                                 .width *
                    //                             0.5,
                    //                         child: Padding(
                    //                           padding:
                    //                               const EdgeInsets.all(8.0),
                    //                           child: Text(
                    //                             inventorycontroller
                    //                                     .productCategoryData
                    //                                     .value
                    //                                     .data![index]
                    //                                     .name ??
                    //                                 "",
                    //                             style: TextStyle(
                    //                                 color: Constant.black,
                    //                                 fontSize: 15,
                    //                                 fontFamily: 'Poppins-bold',
                    //                                 fontWeight:
                    //                                     FontWeight.bold),
                    //                           ),
                    //                         ),
                    //                       ),
                    //                       // Text(
                    //                       //   addonData[index]
                    //                       //       .addonItems!
                    //                       //       .length
                    //                       //       .toString() +
                    //                       //       " Items",
                    //                       //   style: TextStyle(
                    //                       //     color: Constant.greyDark,
                    //                       //     fontSize: 12,
                    //                       //     fontFamily: 'Poppins',
                    //                       //   ),
                    //                       // )
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ),
                    //               Row(
                    //                 children: [
                    //                   // Obx(
                    //                   //   ()=> FlutterSwitch(
                    //                   //     width: 50,
                    //                   //     height: 23,
                    //                   //     value: inventorycontroller.productCategoryData.value.data![index].isHidden!,
                    //                   //     borderRadius: 30.0,
                    //                   //     padding: 2,
                    //                   //     switchBorder: Border.all(
                    //                   //         color: Constant.black, width: 2),
                    //                   //     activeColor: Constant.white,
                    //                   //     inactiveColor: Constant.white,
                    //                   //     inactiveToggleColor:
                    //                   //         Constant.secondaryColor,
                    //                   //     activeToggleColor:
                    //                   //         Constant.successColor,
                    //                   //     showOnOff: false,
                    //                   //     onToggle: (val) {
                    //                   //       inventorycontroller.categoryData.value.data!
                    //                   //           .results![index].isHidden = val;
                    //                   //       inventorycontroller
                    //                   //           .UpdateCategoryStatus(
                    //                   //               val.toString(),
                    //                   //               inventorycontroller
                    //                   //                   .categoryData
                    //                   //                   .value
                    //                   //                   .data!
                    //                   //                   .results![index]
                    //                   //                   .id!);
                    //                   //       inventorycontroller.update();
                    //                   //     },
                    //                   //   ),
                    //                   // ),
                    //                   SizedBox(
                    //                     width: 20,
                    //                   ),
                    //                   InkWell(
                    //                     onTap: () {
                    //                     //   inventorycontroller
                    //                     //           .nameController.text =
                    //                     //       inventorycontroller
                    //                     //           .productCategoryData
                    //                     //           .value
                    //                     //           .data![index]
                    //                     //           .name!;
                    //                     //   inventorycontroller.parentId!.value =
                    //                     //       (inventorycontroller
                    //                     //                   .productCategoryData
                    //                     //                   .value
                    //                     //                   .data!
                    //                     //                   .results![index]
                    //                     //                   .parent ==
                    //                     //               null)
                    //                     //           ? ""
                    //                     //           : inventorycontroller
                    //                     //               .productCategoryData
                    //                     //               .value
                    //                     //               .data!
                    //                     //               .results![index]
                    //                     //               .parent!;
                    //                     //   inventorycontroller.isHidden!.value =
                    //                     //       inventorycontroller
                    //                     //           .productCategoryData
                    //                     //           .value
                    //                     //           .data!
                    //                     //           .results![index]
                    //                     //           .isHidden!;
                    //                     //   inventorycontroller.ImageSelected
                    //                     //       .value = (inventorycontroller
                    //                     //               .productCategoryData
                    //                     //               .value
                    //                     //               .data!
                    //                     //               .results![index]
                    //                     //               .image ==
                    //                     //           null)
                    //                     //       ? false
                    //                     //       : true;
                    //                     //   inventorycontroller.Image =
                    //                     //       (inventorycontroller
                    //                     //                   .productCategoryData
                    //                     //                   .value
                    //                     //                   .data!
                    //                     //                   .results![index]
                    //                     //                   .image ==
                    //                     //               null)
                    //                     //           ? "" as File
                    //                     //           : File(inventorycontroller
                    //                     //               .productCategoryData
                    //                     //               .value
                    //                     //               .data!
                    //                     //               .results![index]
                    //                     //               .image!);
                    //                     //   Get.to(AddCategory(
                    //                     //       "Add Category",
                    //                     //       inventorycontroller
                    //                     //           .productCategoryData
                    //                     //           .value
                    //                     //           .data!
                    //                     //           .results![index]
                    //                     //           .id!,
                    //                     //       "Edit"));
                    //                     },
                    //                     child: Icon(
                    //                       Icons.edit,
                    //                       color: Constant.secondaryColor,
                    //                     ),
                    //                   )
                    //                 ],
                    //               ),
                    //             ],
                    //           )),
                    //           children: [
                    //             // Column(
                    //             //   children: [
                    //             //     Container(
                    //             //       color: Colors.white,
                    //             //       child: Row(
                    //             //         mainAxisAlignment:
                    //             //             MainAxisAlignment.center,
                    //             //         children: [
                    //             //           Padding(
                    //             //             padding: const EdgeInsets.only(
                    //             //                 top: 8.0, bottom: 8),
                    //             //             child: InkWell(
                    //             //               onTap: () {
                    //             //                 inventorycontroller
                    //             //                         .nameController.text =
                    //             //                     inventorycontroller
                    //             //                         .productCategoryData
                    //             //                         .value
                    //             //                         .data!
                    //             //                         .results![index]
                    //             //                         .name!;
                    //             //                 inventorycontroller
                    //             //                         .parentId!.value =
                    //             //                     (inventorycontroller
                    //             //                                 .productCategoryData
                    //             //                                 .value
                    //             //                                 .data!
                    //             //                                 .results![index]
                    //             //                                 .parent ==
                    //             //                             null)
                    //             //                         ? ""
                    //             //                         : inventorycontroller
                    //             //                             .productCategoryData
                    //             //                             .value
                    //             //                             .data!
                    //             //                             .results![index]
                    //             //                             .parent!;
                    //             //                 inventorycontroller
                    //             //                         .isHidden!.value =
                    //             //                     inventorycontroller
                    //             //                         .productCategoryData
                    //             //                         .value
                    //             //                         .data!
                    //             //                         .results![index]
                    //             //                         .isHidden!;
                    //             //                 inventorycontroller
                    //             //                         .ImageSelected.value =
                    //             //                     (inventorycontroller
                    //             //                                 .productCategoryData
                    //             //                                 .value
                    //             //                                 .data!
                    //             //                                 .results![index]
                    //             //                                 .image ==
                    //             //                             null)
                    //             //                         ? false
                    //             //                         : true;
                    //             //                 inventorycontroller.Image =
                    //             //                     (inventorycontroller
                    //             //                                 .productCategoryData
                    //             //                                 .value
                    //             //                                 .data!
                    //             //                                 .results![index]
                    //             //                                 .image ==
                    //             //                             null)
                    //             //                         ? "" as File
                    //             //                         : File(
                    //             //                             inventorycontroller
                    //             //                                 .productCategoryData
                    //             //                                 .value
                    //             //                                 .data!
                    //             //                                 .results![index]
                    //             //                                 .image!);
                    //             //                 inventorycontroller
                    //             //                     .nameController.text = "";
                    //             //                 inventorycontroller
                    //             //                     .parentId!.value = "";
                    //             //                 inventorycontroller
                    //             //                     .isHidden!.value = false;
                    //             //                 inventorycontroller
                    //             //                     .ImageSelected
                    //             //                     .value = false;
                    //             //                 inventorycontroller
                    //             //                         .selectedParentSubcategory
                    //             //                         .value =
                    //             //                     inventorycontroller
                    //             //                         .productCategoryData
                    //             //                         .value
                    //             //                         .data!
                    //             //                         .results![index]
                    //             //                         .id!;
                    //             //                 Get.to(AddCategory(
                    //             //                     "Add SubCategory",
                    //             //                     "none",
                    //             //                     "Add"));
                    //             //               },
                    //             //               child: Text(
                    //             //                 "+ Add SubCategory",
                    //             //                 style: TextStyle(
                    //             //                     color: Constant
                    //             //                         .secondaryColor),
                    //             //               ),
                    //             //             ),
                    //             //           )
                    //             //         ],
                    //             //       ),
                    //             //     ),
                    //             //     // Container()
                    //             //     ListView.builder(
                    //             //         shrinkWrap: true,
                    //             //         physics: NeverScrollableScrollPhysics(),
                    //             //         itemCount: inventorycontroller
                    //             //             .subCategoryData[inventorycontroller
                    //             //                 .productCategoryData
                    //             //                 .value
                    //             //                 .data!
                    //             //                 .results![index]
                    //             //                 .id!]
                    //             //             .length,
                    //             //         itemBuilder:
                    //             //             (context, indexSubCategory) {
                    //             //           return InkWell(
                    //             //             onTap: () {
                    //             //               inventorycontroller
                    //             //                       .nameController.text =
                    //             //                   inventorycontroller
                    //             //                       .subCategoryData[
                    //             //                           inventorycontroller
                    //             //                               .productCategoryData
                    //             //                               .value
                    //             //                               .data!
                    //             //                               .results![index]
                    //             //                               .id!]
                    //             //                           [indexSubCategory]
                    //             //                       .name!;
                    //             //               inventorycontroller.parentId!
                    //             //                   .value = (inventorycontroller
                    //             //                           .subCategoryData[
                    //             //                               inventorycontroller
                    //             //                                   .productCategoryData
                    //             //                                   .value
                    //             //                                   .data!
                    //             //                                   .results![
                    //             //                                       index]
                    //             //                                   .id!]
                    //             //                               [indexSubCategory]
                    //             //                           .parent ==
                    //             //                       null)
                    //             //                   ? ""
                    //             //                   : inventorycontroller
                    //             //                       .subCategoryData[
                    //             //                           inventorycontroller
                    //             //                               .productCategoryData
                    //             //                               .value
                    //             //                               .data!
                    //             //                               .results![index]
                    //             //                               .id!]
                    //             //                           [indexSubCategory]
                    //             //                       .parent!;
                    //             //               inventorycontroller
                    //             //                       .isHidden!.value =
                    //             //                   inventorycontroller
                    //             //                       .subCategoryData[
                    //             //                           inventorycontroller
                    //             //                               .productCategoryData
                    //             //                               .value
                    //             //                               .data!
                    //             //                               .results![index]
                    //             //                               .id!]
                    //             //                           [indexSubCategory]
                    //             //                       .isHidden!;
                    //             //               inventorycontroller.ImageSelected
                    //             //                   .value = (inventorycontroller
                    //             //                           .subCategoryData[
                    //             //                               inventorycontroller
                    //             //                                   .productCategoryData
                    //             //                                   .value
                    //             //                                   .data!
                    //             //                                   .results![
                    //             //                                       index]
                    //             //                                   .id!]
                    //             //                               [indexSubCategory]
                    //             //                           .image ==
                    //             //                       null)
                    //             //                   ? false
                    //             //                   : true;
                    //             //               print(inventorycontroller
                    //             //                   .subCategoryData[
                    //             //                       inventorycontroller
                    //             //                           .productCategoryData
                    //             //                           .value
                    //             //                           .data!
                    //             //                           .results![index]
                    //             //                           .id!]
                    //             //                       [indexSubCategory]
                    //             //                   .parent!);
                    //             //               inventorycontroller
                    //             //                       .selectedParentSubcategory
                    //             //                       .value =
                    //             //                   inventorycontroller
                    //             //                       .subCategoryData[
                    //             //                           inventorycontroller
                    //             //                               .productCategoryData
                    //             //                               .value
                    //             //                               .data!
                    //             //                               .results![index]
                    //             //                               .id!]
                    //             //                           [indexSubCategory]
                    //             //                       .parent!;
                    //             //               inventorycontroller.update();
                    //             //
                    //             //               Get.to(AddCategory(
                    //             //                   "Add SubCategory",
                    //             //                   inventorycontroller
                    //             //                       .subCategoryData[
                    //             //                           inventorycontroller
                    //             //                               .productCategoryData
                    //             //                               .value
                    //             //                               .data!
                    //             //                               .results![index]
                    //             //                               .id!]
                    //             //                           [indexSubCategory]
                    //             //                       .id,
                    //             //                   "Edit"));
                    //             //             },
                    //             //             onLongPress: () {},
                    //             //             child: Container(
                    //             //                 color: Constant.white,
                    //             //                 child: Padding(
                    //             //                   padding: const EdgeInsets.all(
                    //             //                       10.0),
                    //             //                   child: Row(
                    //             //                     mainAxisAlignment:
                    //             //                         MainAxisAlignment
                    //             //                             .spaceBetween,
                    //             //                     children: [
                    //             //                       Container(
                    //             //                         width: MediaQuery.of(
                    //             //                                     context)
                    //             //                                 .size
                    //             //                                 .width *
                    //             //                             0.6,
                    //             //                         child: Column(
                    //             //                           crossAxisAlignment:
                    //             //                               CrossAxisAlignment
                    //             //                                   .start,
                    //             //                           children: [
                    //             //                             Text(
                    //             //                               inventorycontroller
                    //             //                                       .subCategoryData[inventorycontroller
                    //             //                                           .productCategoryData
                    //             //                                           .value
                    //             //                                           .data!
                    //             //                                           .results![
                    //             //                                               index]
                    //             //                                           .id!][indexSubCategory]
                    //             //                                       .name ??
                    //             //                                   "",
                    //             //                               style: TextStyle(
                    //             //                                 color: Constant
                    //             //                                     .black,
                    //             //                                 fontSize: 15,
                    //             //                                 fontFamily:
                    //             //                                     'Poppins',
                    //             //                               ),
                    //             //                             ),
                    //             //                           ],
                    //             //                         ),
                    //             //                       ),
                    //             //                       Obx(
                    //             //                         () => FlutterSwitch(
                    //             //                           width: 50,
                    //             //                           height: 23,
                    //             //                           value: inventorycontroller
                    //             //                                   .subCategoryData[
                    //             //                                       inventorycontroller
                    //             //                                           .productCategoryData
                    //             //                                           .value
                    //             //                                           .data!
                    //             //                                           .results![
                    //             //                                               index]
                    //             //                                           .id!][
                    //             //                                       indexSubCategory]
                    //             //                                   .isHidden ??
                    //             //                               "",
                    //             //                           borderRadius: 30.0,
                    //             //                           padding: 2,
                    //             //                           switchBorder:
                    //             //                               Border.all(
                    //             //                                   color: Constant
                    //             //                                       .black,
                    //             //                                   width: 2),
                    //             //                           activeColor:
                    //             //                               Constant.white,
                    //             //                           inactiveColor:
                    //             //                               Constant.white,
                    //             //                           inactiveToggleColor:
                    //             //                               Constant
                    //             //                                   .secondaryColor,
                    //             //                           activeToggleColor:
                    //             //                               Constant
                    //             //                                   .successColor,
                    //             //                           showOnOff: false,
                    //             //                           onToggle: (val) {
                    //             //                             inventorycontroller
                    //             //                                 .subCategoryData[
                    //             //                                     inventorycontroller
                    //             //                                         .productCategoryData
                    //             //                                         .value
                    //             //                                         .data!
                    //             //                                         .results![
                    //             //                                             index]
                    //             //                                         .id!][
                    //             //                                     indexSubCategory]
                    //             //                                 .isHidden = val;
                    //             //                             inventorycontroller.UpdateCategoryStatus(
                    //             //                                 val.toString(),
                    //             //                                 inventorycontroller
                    //             //                                     .subCategoryData[inventorycontroller
                    //             //                                         .productCategoryData
                    //             //                                         .value
                    //             //                                         .data![
                    //             //                                             index]
                    //             //                                         .id!][indexSubCategory]
                    //             //                                     .id);
                    //             //                             inventorycontroller
                    //             //                                 .update();
                    //             //                           },
                    //             //                         ),
                    //             //                       ),
                    //             //                     ],
                    //             //                   ),
                    //             //                 )),
                    //             //           );
                    //             //         }),
                    //             //   ],
                    //             // )
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       height: 10,
                    //     )
                    //   ],
                    // );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: (controller
      //       .allcategoryData.value.data == null)?Center(
      //     child: Container(
      //       child: Text(
      //         "No Data Found!",
      //         style: TextStyle(
      //           fontSize: 20,
      //         ),
      //       ),
      //     ),
      //   ):Container(
      //     child: ListView.builder(
      //         itemCount: controller.allcategoryData.value
      //             .data!.results!.length,
      //         itemBuilder: (context, index) {
      //           controller.acceptOrders[index] = controller
      //               .allcategoryData.value.data!.results![index].isHidden!;
      //           return Column(
      //             children: [
      //               InkWell(
      //                 onTap: () {
      //                   controller.nameController.text = controller.allcategoryData.value.data!.results![index].name!;
      //                   controller.parentId!.value = (controller.allcategoryData.value.data!.results![index].parent == null)?"":controller.allcategoryData.value.data!.results![index].parent!;
      //                   controller.isHidden!.value = controller.allcategoryData.value.data!.results![index].isHidden!;
      //                   controller.ImageSelected.value = (controller.allcategoryData.value.data!.results![index].image == null)?false:true;
      //                   controller.selectedParentSubcategory.value=controller.allcategoryData.value.data!.results![index].parent!;
      //                   Get.to(AddCategory("Add SubCategory",controller.allcategoryData.value.data!.results![index].id!,"Edit"));
      //                 },
      //                 child: Card(
      //                   color: Constant.blueShadowBackground,
      //                   //elevation: 5,
      //                   child: Padding(
      //                     padding: const EdgeInsets.all(8.0),
      //                     child: Container(
      //                         child: Row(
      //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                           children: [
      //                             Container(
      //                               child: Column(
      //                                 crossAxisAlignment: CrossAxisAlignment.start,
      //                                 children: [
      //                                   Text(
      //                                     controller.allcategoryData.value
      //                                         .data!.results![index].name!,
      //                                     style: TextStyle(
      //                                         color: Constant.black,
      //                                         fontSize: 15,
      //                                         fontFamily: 'Poppins-bold',
      //                                         fontWeight: FontWeight.bold),
      //                                   ),
      //                                   Text(
      //                                     controller.allcategoryData.value
      //                                         .data!.results![index].name!,
      //                                     style: TextStyle(
      //                                       color: Constant.greyDark,
      //                                       fontSize: 12,
      //                                       fontFamily: 'Poppins',
      //                                     ),
      //                                   )
      //                                 ],
      //                               ),
      //                             ),
      //                             Obx(
      //                                   () => FlutterSwitch(
      //                                 width: 50,
      //                                 height: 23,
      //                                 value: controller.acceptOrders[index],
      //                                 borderRadius: 30.0,
      //                                 padding: 2,
      //                                 switchBorder: Border.all(
      //                                     color: Constant.black, width: 2),
      //                                 activeColor: Constant.white,
      //                                 inactiveColor: Constant.white,
      //                                 inactiveToggleColor: Constant.secondaryColor,
      //                                 activeToggleColor: Constant.successColor,
      //                                 showOnOff: false,
      //                                 onToggle: (val) {
      //                                   controller.acceptOrders[index] = val;
      //                                   controller.UpdateCategoryStatus(controller.acceptOrders[index].toString(),controller.allcategoryData.value
      //                                       .data!.results![index].id!);
      //                                 },
      //                               ),
      //                             ),
      //                           ],
      //                         )),
      //                   ),
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: 5,
      //               )
      //             ],
      //           );
      //           // return Column(
      //           //   children: [
      //           //     Card(
      //           //       color: Constant.blueShadowBackground,
      //           //       //elevation: 5,
      //           //       child: Padding(
      //           //         padding: const EdgeInsets.all(8.0),
      //           //         child: Container(
      //           //
      //           //             child: Row(
      //           //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           //               children: [
      //           //                 Container(
      //           //                   child: Column(
      //           //                     crossAxisAlignment: CrossAxisAlignment.start,
      //           //                     children: [
      //           //                       Text(
      //           //                         subCategory[index].name??"",
      //           //                         style: TextStyle(
      //           //                             color: Constant.black,
      //           //                             fontSize: 15,
      //           //                             fontFamily: 'Poppins-bold',
      //           //                             fontWeight: FontWeight.bold
      //           //                         ),
      //           //                       ),
      //           //                       Text(
      //           //                         subCategory[index].items??"",
      //           //                         style: TextStyle(
      //           //                           color: Constant.greyDark,
      //           //                           fontSize: 12,
      //           //                           fontFamily: 'Poppins',
      //           //                         ),
      //           //                       )
      //           //                     ],
      //           //                   ),
      //           //                 ),
      //           //                 Obx(
      //           //                       () => FlutterSwitch(
      //           //                     width: 50,
      //           //                     height: 23,
      //           //                     value: controller.acceptOrders.value[index],
      //           //                     borderRadius: 30.0,
      //           //                     padding: 2,
      //           //                     switchBorder: Border.all(color: Constant.black, width: 2),
      //           //                     activeColor: Constant.white,
      //           //                     inactiveColor: Constant.white,
      //           //                     inactiveToggleColor: Constant.secondaryColor,
      //           //                     activeToggleColor: Constant.successColor,
      //           //                     showOnOff: false,
      //           //                     onToggle: (val) {
      //           //                       controller.acceptOrders.value[index] = val;
      //           //                     },
      //           //                   ),
      //           //                 ),
      //           //               ],
      //           //             )
      //           //         ),
      //           //       ),
      //           //     ),
      //           //     SizedBox(
      //           //       height: 5,
      //           //     )
      //           //   ],
      //           // );
      //         }),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Constant.secondaryColor,
        foregroundColor: Constant.black,
        onPressed: () {
          // Respond to button press
          removeCategoryData();
          Get.to(AddCategory("Add SubCategory","none","Add",0,0));
        },
        label: Text(
          'Add Subcategory',
          style: TextStyle(
            color: Constant.white,
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  void insertCategoryData(index) async {
    controller.categoryNameController.text = controller.subCategoryDataList[index].name!;
    controller.selectedProductParentCategory.value.id = controller.subCategoryDataList[index].parent;
    controller.isCategoryImageSelected.value = (controller.subCategoryDataList[index].image == null)?false:true;
    if(controller.subCategoryDataList[index].image != null){
      controller.selectedCategoryImage.value = await controller.getImage(url: Constant.imageUrl+controller.subCategoryDataList[index].image!);
    }
  }

  void removeCategoryData() {
    controller.categoryNameController.text = "";
    // controller.selectedProductParentCategory.value = ProductCategory();
    controller.selectedCategoryImage.value = File("");
    controller.isCategoryImageSelected.value = false;
  }
}
