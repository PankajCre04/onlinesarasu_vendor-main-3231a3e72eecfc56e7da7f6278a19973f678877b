import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/loading_dialog.dart';
import 'package:sooooperbusiness/commons/sessionmanager.dart';
import 'package:sooooperbusiness/controllers/inventory/categoryController.dart';
import 'package:sooooperbusiness/controllers/inventory/inventoryController.dart';
import 'package:sooooperbusiness/model/more/inventory/inventoryModel.dart';
import 'package:sooooperbusiness/model/more/inventory/productCategory.dart';
import 'package:sooooperbusiness/views/components/my_text_field.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/More/Inventory/tabs/subcategory.dart';

import '../addcategory.dart';

class Category extends StatefulWidget {
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  InventoryController inventorycontroller = Get.put(InventoryController());

  showAlertDialog(BuildContext context, String categoryId) {
    print(categoryId);
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
        Get.find<InventoryController>().DeleteCategory(categoryId);
        Get.back();
      },
    );

    // set up the AlertDialog
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

  Future<Null> refreshLocalProduct() async {
    print('refreshing stocks...');
    SessionManager.getAccessToken().then((value) {
      inventorycontroller.GetProductCategory(value!);
      inventorycontroller.GetItem("All", 1);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SessionManager.getAccessToken().then((value) {
      inventorycontroller.GetProductCategory(value!);
      inventorycontroller.GetItem("All", 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: MyTextField(
              //     onChanged: (value) {
              //       inventorycontroller.runFilterCategory(value);
              //     },
              //     // controller: editingController,
              //     // decoration: InputDecoration(
              //     //     labelText: "Search Product",
              //     //     hintText: "Search Product",
              //     //     prefixIcon: Icon(Icons.search),
              //     //
              //     //     border: OutlineInputBorder(
              //     //         borderRadius: BorderRadius.all(Radius.circular(35.0)))),
              //     labelText: 'Search Category',
              //     borderColor: Constant.black,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: (inventorycontroller.allProductCategory.isEmpty || inventorycontroller.allProductCategoryTemp.isEmpty)
                    ? Center(
                        child: Container(
                          child: Text(
                            "No Data Found!!!",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: refreshLocalProduct,
                        child: ListView.builder(
                          itemCount: inventorycontroller.allProductCategoryTemp.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    inventorycontroller.selectedProductParentCategory.value = inventorycontroller.allProductCategoryTemp[index];
                                    inventorycontroller.GetProductSubCategory(inventorycontroller.allProductCategoryTemp[index].id.toString()).then((value) {
                                      print("after tehn");
                                      print(value);
                                      if (value) {
                                        Get.to(Subcategory());
                                      }
                                    });
                                    // if(inventorycontroller.productSubCategoryData.value.data!.length != 0){
                                    //   print(inventorycontroller.productSubCategoryData.value.data!.length);
                                    //
                                    // }
                                    //controller.Image = controller.categoryData.value.data!.results![index].image! as File;
                                  },
                                  onLongPress: () {},
                                  child: (inventorycontroller.allProductCategoryTemp[index].name == null)
                                      ? Container(
                                          height: MediaQuery.of(context).size.height * 0.8,
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        )
                                      : Card(
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
                                                    // CachedNetworkImage(
                                                    //   width: 50,
                                                    //   height: 50,
                                                    //   imageUrl: (inventorycontroller.allProductCategory[index].image!=
                                                    //       null)
                                                    //       ? (!inventorycontroller.allProductCategory[
                                                    //   index]
                                                    //       .image!
                                                    //       .startsWith(
                                                    //       '/'))
                                                    //       ? Constant
                                                    //       .imageUrl +
                                                    //       "/" +
                                                    //       inventorycontroller.allProductCategory[
                                                    //       index]
                                                    //           .image!
                                                    //       : Constant
                                                    //       .imageUrl +
                                                    //       inventorycontroller.allProductCategory[
                                                    //       index]
                                                    //           .image!
                                                    //       : Constant.imageUrl +
                                                    //       "/" +
                                                    //       inventorycontroller.allProductCategory[index]
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
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            inventorycontroller.allProductCategoryTemp[index].name!,
                                                            style: TextStyle(color: Constant.black, fontSize: 15, fontFamily: 'Poppins-bold', fontWeight: FontWeight.bold),
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
                                                    Get.to(AddCategory("Add Category", inventorycontroller.allProductCategoryTemp[index].id!, "Edit", index, 0));
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.edit,
                                                        color: Constant.secondaryColor,
                                                      ),
                                                    ],
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
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Constant.secondaryColor,
        foregroundColor: Constant.black,
        onPressed: () {
          removeCategoryData();
          // Respond to button press
          Get.to(AddCategory("Add Category", "none", "Add", 0, 0));
        },
        label: Text(
          'Add Category',
          style: TextStyle(color: Constant.white, fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void insertCategoryData(index) async {
    inventorycontroller.selectedProductParentCategory.value = ProductCategory();
    inventorycontroller.categoryNameController.text = inventorycontroller.allProductCategoryTemp[index].name!;
    inventorycontroller.isCategoryImageSelected.value = (inventorycontroller.allProductCategoryTemp[index].image == null) ? false : true;
    if (inventorycontroller.allProductCategoryTemp[index].image != null) {
      inventorycontroller.selectedCategoryImage.value = await inventorycontroller.getImage(url: Constant.imageUrl + inventorycontroller.allProductCategoryTemp[index].image!);
    }
  }

  void removeCategoryData() {
    inventorycontroller.categoryNameController.text = "";
    inventorycontroller.selectedProductParentCategory.value = ProductCategory();
    inventorycontroller.selectedCategoryImage.value = File("");
    inventorycontroller.isCategoryImageSelected.value = false;
  }
}
