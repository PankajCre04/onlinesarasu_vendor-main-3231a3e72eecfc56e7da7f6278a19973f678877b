import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cross_file/src/types/interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/loading_dialog.dart';
import 'package:sooooperbusiness/controllers/inventory/addonController.dart';
import 'package:sooooperbusiness/controllers/inventory/inventoryController.dart';
import 'package:sooooperbusiness/controllers/maincontroller.dart';
import 'package:sooooperbusiness/model/more/inventory/inventoryModel.dart';
import 'package:sooooperbusiness/views/components/customcontainer.dart';
import 'package:sooooperbusiness/views/components/my_text_field.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/More/Inventory/addeditaddoncategory.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/More/Inventory/additem.dart';
import 'package:share/share.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/order/orderProcessing/selectTimePopup.dart';

import '../addSKU.dart';

class Products extends StatelessWidget {
  InventoryController controller = Get.put(InventoryController());

  @override
  Widget build(BuildContext context) {
    //return Obx(() {
    return DefaultTabController(
      length: controller.item!.length + 1,
      child: subcategory("All"),
      // child: Obx(()=>
      // () => (controller.allcategoryData.value.data == null)
      //     ? Center(
      //         child: Container(
      //           child: Text(
      //             "No Data Found!",
      //             style: TextStyle(
      //               fontSize: 20,
      //             ),
      //           ),
      //         ),
      //       )
      // : Scaffold(
      //     appBar: PreferredSize(
      //         child: Obx(() {
      //           return TabBar(
      //             isScrollable: true,
      //             labelColor: Constant.black,
      //             unselectedLabelColor: Constant.black.withOpacity(0.3),
      //             indicatorColor: Constant.black,
      //             tabs: List<Widget>.generate(controller.item!.length + 1,
      //                 (int tabindex) {
      //               print(categories[0]);
      //               return new Tab(
      //                 child: (tabindex == 0)
      //                     ? Text(
      //                         "All",
      //                       )
      //                     : Text(
      //                         controller.item![tabindex - 1],
      //                       ),
      //               );
      //             }),
      //             // tabs: [
      //             //   Tab(
      //             //     child: Text('DIY With BWS'),
      //             //   ),
      //             //   Tab(
      //             //     child: Text('BWS Special'),
      //             //   ),
      //             //   Tab(
      //             //     child: Text('Waffles'),
      //             //   ),
      //             //   Tab(
      //             //     child: Text('Mini Pancakes'),
      //             //   ),
      //             //   Tab(
      //             //     child: Text('Waffle Cakes'),
      //             //   ),
      //             //   Tab(
      //             //     child: Text('Beverages'),
      //             //   )
      //             // ]
      //           );
      //         }),
      //         preferredSize: Size.fromHeight(50.0)),
      //     body: TabBarView(
      //       physics: NeverScrollableScrollPhysics(),
      //       children: List<Widget>.generate(controller.item!.length + 1,
      //           (int tabindex) {
      //         print(categories[0]);
      //         return (tabindex == 0)
      //             ? subcategory("All")
      //             : subcategory(controller.item![tabindex - 1]);
      //       }),
      //     ),
      //     floatingActionButton: FloatingActionButton.extended(
      //       backgroundColor: Constant.secondaryColor,
      //       foregroundColor: Constant.black,
      //       onPressed: () {
      //         // Respond to button press
      //         controller.itemNameController.text = "";
      //         controller.itemDescriptionController.text = "";
      //         controller.itemPriceController.text = "";
      //         controller.itemSalePriceController.text = "";
      //         controller.ImageSelected.value = false;
      //         controller.parentId!.value = "6107902a3b149c5f81bafdea";
      //         controller.parentId2!.value = "6107902a3b149c5f81bafdea";
      //         controller.isRecommanded.value = false;
      //         controller.isPopular.value = false;
      //         controller.isNew.value = false;
      //         controller.isNonveg.value = false;
      //         controller.selectedParentSubcategory.value = "";
      //         controller.selectedAddon!.clear();
      //         controller.selectedSubCategory.value = "";
      //         //controller.Image = "" as File;
      //         controller.selectedGalleryImage!.value = [];
      //
      //         Get.to(AddItem("Add", "none"));
      //       },
      //       label: Text(
      //         'Add Items',
      //         style: TextStyle(
      //             color: Constant.white,
      //             fontSize: 12,
      //             fontFamily: 'Poppins',
      //             fontWeight: FontWeight.bold),
      //       ),
      //     ),
      //   ),
      // ),
    );
    //});
  }
}

class subcategory extends StatelessWidget {
  final category;

  subcategory(this.category);

  InventoryController controller = Get.put(InventoryController());
  MainController mainController = Get.put(MainController());
  AddonController variantController = Get.put(AddonController());

  // SaveItem(int index) {
  //   controller.itemNameController.text = controller.itemList[index].name!;
  //   controller.itemDescriptionController.text =
  //       controller.itemList[index].description!;
  //   controller.itemPriceController.text =
  //       (controller.itemList[index].itemPrice == null)
  //           ? ""
  //           : controller.itemList[index].itemPrice!.toString();
  //   controller.itemQuantityController.text =
  //       (controller.itemList[index].quantity == null)
  //           ? ""
  //           : controller.itemList[index].quantity!.toString();
  //   controller.itemSalePriceController.text =
  //       (controller.itemList[index].salePrice == null)
  //           ? ""
  //           : controller.itemList[index].salePrice!.toString();
  //   controller.ImageSelected.value =
  //       (controller.itemList[index].images == null) ? false : true;
  //   controller.parentId!.value =
  //       (controller.itemList[index].itemCategories == null)
  //           ? controller.itemList[index].itemCategories![0].toString()
  //           : "";
  //   controller.parentId2!.value =
  //       (controller.itemList[index].addonCategories == null)
  //           ? controller.itemList[index].addonCategories![0].toString()
  //           : "";
  //   controller.isRecommanded.value = controller.itemList[index].isRecommended!;
  //   controller.isPopular.value = controller.itemList[index].isPopular!;
  //   controller.isNew.value = controller.itemList[index].isNew!;
  //   controller.isNonveg.value =
  //       (controller.itemList[index].vegNonveg! == "NONVEG") ? false : true;
  //   controller.selectedGalleryImage!.value =
  //       (controller.itemList[index].images == [])
  //           ? []
  //           : controller.itemList[index].images!;
  //   controller.selectedParentSubcategory.value =
  //       (controller.itemList[index].itemCategories != null &&
  //               controller.itemList[index].itemCategories!.length > 0)
  //           ? controller.itemList[index].itemCategories![0].toString()
  //           : "";
  //
  //   controller.selectedAddon!.clear();
  //   controller.selectedAddon!.value =
  //       controller.itemList[index].addonCategories!;
  //   controller.selectedSubCategory.value =
  //       (controller.itemList[index].itemCategories != null &&
  //               controller.itemList[index].itemCategories!.length > 1)
  //           ? controller.itemList[index].itemCategories![1].toString()
  //           : "";
  //   controller.update();
  // }

  Future<Null> refreshLocalProduct() async {
    print('refreshing stocks...');
    controller.GetItem("All", 1);
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 0), () {
      controller.cat.value = category;
    });
    return Scaffold(
      body: FutureBuilder(
        future: controller.GetItem(category, 1), // async work
        builder: (BuildContext context, snapshot) {
          return Obx(() {
            return (controller.itemData.value.data == null)
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
                : SingleChildScrollView(
                    controller: controller.itemScrollController,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyTextField(
                            onChanged: (value) {
                              controller.runFilter(value);
                            },
                            // controller: editingController,
                            // decoration: InputDecoration(
                            //     labelText: "Search Product",
                            //     hintText: "Search Product",
                            //     prefixIcon: Icon(Icons.search),
                            //
                            //     border: OutlineInputBorder(
                            //         borderRadius: BorderRadius.all(Radius.circular(35.0)))),
                            labelText: 'Search Product',
                            borderColor: Constant.black,
                          ),
                        ),
                        RefreshIndicator(
                          onRefresh: refreshLocalProduct,
                          child: (controller.tempItemList.isEmpty)
                              ? Container(
                                  height: MediaQuery.of(context).size.height * 0.8,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : ListView.builder(
                                  //itemCount: controller.itemData.value.data!.results!.length,
                                  itemCount: controller.tempItemList.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    Future.delayed(Duration(seconds: 1), () {
                                      controller.acceptOrders[index + 1] = controller.tempItemList[index].active!;
                                      for (int i = 0; i < controller.tempItemList[index].variants!.length; i++) {
                                        controller.acceptOrders[((index + 1) * 10) + i] = (controller.tempItemList[index].variants![i].active == 1) ? true : false;
                                      }
                                    });
                                    // return (controller
                                    //             .itemData.value.data!.data!.length ==
                                    //         0)
                                    //     ? Center(
                                    //         child: Container(
                                    //           child: Text(
                                    //             "No Data found!" +
                                    //                 controller.itemList[index].name!,
                                    //             style: TextStyle(
                                    //               fontSize: 20,
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       )
                                    //     : Column(
                                    //         children: [
                                    //           InkWell(
                                    //             onTap: () {
                                    //               addProductData(index);
                                    //
                                    //               Get.to(AddProduct("Edit",
                                    //                   controller.itemList[index].id.toString()));
                                    //
                                    //
                                    //               //controller.Image = controller.categoryData.value.data!.results![index].image! as File;
                                    //             },
                                    //             onLongPress: () {
                                    //               showAlertDialog(
                                    //                   context,
                                    //                   controller.itemList[index].id!.toString(),
                                    //                   InventoryController,
                                    //                   category);
                                    //             },
                                    //             child:
                                    //             Card(
                                    //               color: Constant.blueShadowBackground,
                                    //               //elevation: 5,
                                    //               child: Padding(
                                    //                 padding: const EdgeInsets.all(8.0),
                                    //                 child: Container(
                                    //                     child: Row(
                                    //                   mainAxisAlignment:
                                    //                       MainAxisAlignment
                                    //                           .spaceBetween,
                                    //                   children: [
                                    //                     Row(
                                    //                       children: [
                                    //                         CachedNetworkImage(
                                    //                           width: 79,
                                    //                           height: 79,
                                    //                           imageUrl: (controller
                                    //                                       .itemList[
                                    //                                           index]
                                    //                                       .image!=
                                    //                                   null)
                                    //                               ? (!controller
                                    //                                       .itemList[
                                    //                                           index]
                                    //                                       .image!
                                    //                                       .startsWith(
                                    //                                           '/'))
                                    //                                   ? Constant
                                    //                                           .imageUrl +
                                    //                                       "/" +
                                    //                                       controller
                                    //                                               .itemList[
                                    //                                                   index]
                                    //                                               .image!
                                    //                                   : Constant
                                    //                                           .imageUrl +
                                    //                                       controller
                                    //                                               .itemList[
                                    //                                                   index]
                                    //                                               .image!
                                    //                               : Constant.imageUrl +
                                    //                                   "/" +
                                    //                                   mainController
                                    //                                       .selectedStore
                                    //                                       .value
                                    //                                       .image!,
                                    //                           placeholder:
                                    //                               (context, url) {
                                    //                             return LoadingDialog();
                                    //                           },
                                    //                           errorWidget: (context,
                                    //                               url, error) {
                                    //                             return Icon(
                                    //                               Icons.error_outline,
                                    //                               color: Constant.black,
                                    //                             );
                                    //                           },
                                    //                         ),
                                    //                         SizedBox(
                                    //                           width: 5,
                                    //                         ),
                                    //                         Container(
                                    //                           child: Column(
                                    //                             crossAxisAlignment:
                                    //                                 CrossAxisAlignment
                                    //                                     .start,
                                    //                             mainAxisAlignment:
                                    //                                 MainAxisAlignment
                                    //                                     .start,
                                    //                             children: [
                                    //                               Text(
                                    //                                 controller.itemList[index].name!,
                                    //                                 style: TextStyle(
                                    //                                     color: Constant
                                    //                                         .black,
                                    //                                     fontSize: 15,
                                    //                                     fontFamily:
                                    //                                         'Poppins-bold',
                                    //                                     fontWeight:
                                    //                                         FontWeight
                                    //                                             .bold),
                                    //                               ),
                                    //                               Container(
                                    //                                 width: MediaQuery.of(
                                    //                                             context)
                                    //                                         .size
                                    //                                         .width *
                                    //                                     0.5,
                                    //                                 child: Text(
                                    //                                   controller
                                    //                                       .itemList[
                                    //                                           index]
                                    //                                       .description!,
                                    //                                   style: TextStyle(
                                    //                                     color: Constant
                                    //                                         .greyDark,
                                    //                                     fontSize: 12,
                                    //                                     fontFamily:
                                    //                                         'Poppins',
                                    //                                   ),
                                    //                                 ),
                                    //                               ),
                                    //                               SizedBox(
                                    //                                 height: 10,
                                    //                               ),
                                    //                               Text(
                                    //                                 "Rs. " +
                                    //                                     controller
                                    //                                         .itemList[
                                    //                                             index]
                                    //                                         .price!
                                    //                                         .toString(),
                                    //                                 style: TextStyle(
                                    //                                   color: Constant
                                    //                                       .greyDark,
                                    //                                   fontSize: 12,
                                    //                                   fontFamily:
                                    //                                       'Poppins',
                                    //                                 ),
                                    //                               ),
                                    //                               Text(
                                    //                                 "Quantity" +
                                    //                                     controller
                                    //                                         .itemList[
                                    //                                             index]
                                    //                                         .unit!
                                    //                                         .toString(),
                                    //                                 style: TextStyle(
                                    //                                   color: Constant
                                    //                                       .greyDark,
                                    //                                   fontSize: 12,
                                    //                                   fontFamily:
                                    //                                       'Poppins',
                                    //                                 ),
                                    //                               ),
                                    //                             ],
                                    //                           ),
                                    //                         ),
                                    //                       ],
                                    //                     ),
                                    //                     Obx(
                                    //                       () => FlutterSwitch(
                                    //                         width: 50,
                                    //                         height: 23,
                                    //                         value: controller
                                    //                             .acceptOrders[index],
                                    //                         // value: controller.itemData.value.data!.results![index].isHidden!,
                                    //                         borderRadius: 30.0,
                                    //                         padding: 2,
                                    //                         switchBorder: Border.all(
                                    //                             color: Constant.black,
                                    //                             width: 2),
                                    //                         activeColor: Constant.white,
                                    //                         inactiveColor:
                                    //                             Constant.white,
                                    //                         inactiveToggleColor:
                                    //                             Constant.secondaryColor,
                                    //                         activeToggleColor:
                                    //                             Constant.successColor,
                                    //                         showOnOff: false,
                                    //                         onToggle: (val) {
                                    //                           controller.acceptOrders[
                                    //                               index] = val;
                                    //                           controller.itemList[index]
                                    //                               .active = val;
                                    //                           if (val) {
                                    //                             controller
                                    //                                 .UpdateItemStatus(
                                    //                                     val.toString(),
                                    //                                     controller
                                    //                                         .itemList[
                                    //                                             index]
                                    //                                         .id!.toString());
                                    //                           } else {
                                    //                             controller
                                    //                                 .UpdateItemStatus(
                                    //                                     val.toString(),
                                    //                                     controller
                                    //                                         .itemList[
                                    //                                             index]
                                    //                                         .id!.toString());
                                    //                           }
                                    //                         },
                                    //                       ),
                                    //                     ),
                                    //                   ],
                                    //                 )),
                                    //               ),
                                    //             ),
                                    //           ),
                                    //           SizedBox(
                                    //             height: 5,
                                    //           )
                                    //         ],
                                    //       );
                                    return (controller.tempItemList[index].productType == "SIMPLE")
                                        ? Card(
                                            color: Constant.blueShadowBackground,
                                            child: Container(
                                              color: Constant.blueShadowBackground,
                                              //elevation: 5,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Container(
                                                    child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        (controller.tempItemList[index].image == "")
                                                            ? Container()
                                                            : (controller.tempItemList[index].image!.contains("http"))
                                                                ? CachedNetworkImage(width: 79, height: 79, imageUrl: controller.tempItemList[index].image!)
                                                                : CachedNetworkImage(
                                                                    width: 79,
                                                                    height: 79,
                                                                    imageUrl: (controller.tempItemList[index].image != null)
                                                                        ? (!controller.tempItemList[index].image!.startsWith('/'))
                                                                            ? Constant.imageUrl + "/" + controller.tempItemList[index].image!
                                                                            : Constant.imageUrl + controller.tempItemList[index].image!
                                                                        : Constant.imageUrl + "/" + mainController.selectedStore.value.image!,
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
                                                          width: 10,
                                                        ),
                                                        Container(
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                controller.tempItemList[index].name!,
                                                                style: TextStyle(color: Constant.black, fontSize: 15, fontFamily: 'Poppins-bold', fontWeight: FontWeight.bold),
                                                              ),
                                                              controller.tempItemList[index].description != null
                                                                  ? Container(
                                                                      width: MediaQuery.of(context).size.width * 0.4,
                                                                      child: Text(
                                                                        controller.tempItemList[index].description!,
                                                                        maxLines: 2,
                                                                        overflow: TextOverflow.ellipsis,
                                                                        style: TextStyle(
                                                                          color: Constant.greyDark,
                                                                          fontSize: 12,
                                                                          fontFamily: 'Poppins',
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : Text(""),
                                                              SizedBox(
                                                                height: 0,
                                                              ),
                                                              Text(
                                                                "Rs. " + controller.tempItemList[index].price!.toString(),
                                                                style: TextStyle(
                                                                  color: Constant.greyDark,
                                                                  fontSize: 12,
                                                                  fontFamily: 'Poppins',
                                                                ),
                                                              ),
                                                              CustomContainer(
                                                                onTap: () {
                                                                  showDialog(
                                                                    context: context,
                                                                    builder: (_) => AddSKU(controller.tempItemList[index].id.toString()),
                                                                  );
                                                                },
                                                                padding: 5,
                                                                backgroundColor: (controller.tempItemList[index].sku! > 10) ? Constant.successColor : Constant.errorColor,
                                                                child: Obx(
                                                                  () => Text(
                                                                    "Quantity " + controller.tempItemList[index].sku!.toString(),
                                                                    style: TextStyle(
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Constant.white,
                                                                      fontSize: 12,
                                                                      fontFamily: 'Poppins',
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Obx(
                                                          () => FlutterSwitch(
                                                            width: 50,
                                                            height: 23,
                                                            value: controller.acceptOrders[index + 1],
                                                            // value: controller.itemList[index].active!,
                                                            // value: controller.itemData.value.data!.results![index].isHidden!,
                                                            borderRadius: 30.0,
                                                            padding: 2,
                                                            switchBorder: Border.all(color: Constant.black, width: 2),
                                                            activeColor: Constant.white,
                                                            inactiveColor: Constant.white,
                                                            inactiveToggleColor: Constant.errorColor,
                                                            activeToggleColor: Constant.successColor,
                                                            showOnOff: false,
                                                            onToggle: (val) {
                                                              controller.acceptOrders[index + 1] = val;
                                                              controller.tempItemList[index].active = val;
                                                              controller.EditProductStatus(controller.tempItemList[index].id.toString(), val);
                                                              // if (val) {
                                                              //   print(val);
                                                              //   controller.itemList[index].active = false;
                                                              //
                                                              // } else {
                                                              //   print("false");
                                                              //   controller.itemList[index].active = true;
                                                              //   controller.EditProductStatus(controller.itemList[index].id.toString(),true);
                                                              // }
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            InkWell(
                                                              onTap: () async {
                                                                String link = await mainController.createDynamicLinkStore(true, "product/${controller.tempItemList[index].id.toString()}");
                                                                print(link);
                                                                if (mainController.selectedStore.value.image == null) {
                                                                  print("if me aaya");
                                                                  // Navigator.pop(context);
                                                                  // for (var discount in items) {
                                                                  // }
                                                                  await Share.share(
                                                                      "Check out this \"${controller.tempItemList[index].name}\" on Local Shopi \n${mainController.selectedStore.value.name}\n ($link)"); //.\n${brand.applicableOffers.join(",\n")}");
                                                                } else {
                                                                  await Share.share("Check out this \"${controller.tempItemList[index].name}\" on Local Shopi \n${mainController.selectedStore.value.name}\n ($link)");
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
                                                              child: Icon(
                                                                Icons.share,
                                                                color: Constant.secondaryColor,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                addProductData(index);
                                                                Get.to(AddProduct("Edit", controller.tempItemList[index].id.toString(), index));
                                                              },
                                                              child: Icon(
                                                                Icons.edit,
                                                                color: Constant.secondaryColor,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )),
                                              ),
                                            ),
                                          )
                                        : Column(
                                            children: [
                                              InkWell(
                                                onLongPress: () {},
                                                child: Card(
                                                  color: Constant.blueShadowBackground,
                                                  //elevation: 5,
                                                  child: ExpansionTile(
                                                    // title: Container(
                                                    //     child: Row(
                                                    //       mainAxisAlignment:
                                                    //       MainAxisAlignment.spaceBetween,
                                                    //       children: [
                                                    //         Expanded(
                                                    //           child: Container(
                                                    //             child: Column(
                                                    //               crossAxisAlignment:
                                                    //               CrossAxisAlignment.start,
                                                    //               children: [
                                                    //                 Container(
                                                    //                   width: MediaQuery.of(context)
                                                    //                       .size
                                                    //                       .width *
                                                    //                       0.5,
                                                    //                   child: Padding(
                                                    //                     padding:
                                                    //                     const EdgeInsets.all(8.0),
                                                    //                     child: Text(
                                                    //                       controller.itemList[index]
                                                    //                           .name ??
                                                    //                           "",
                                                    //                       style: TextStyle(
                                                    //                           color: Constant.black,
                                                    //                           fontSize: 15,
                                                    //                           fontFamily: 'Poppins-bold',
                                                    //                           fontWeight:
                                                    //                           FontWeight.bold),
                                                    //                     ),
                                                    //                   ),
                                                    //                 ),
                                                    //                 // Text(
                                                    //                 //   addonData[index]
                                                    //                 //       .addonItems!
                                                    //                 //       .length
                                                    //                 //       .toString() +
                                                    //                 //       " Items",
                                                    //                 //   style: TextStyle(
                                                    //                 //     color: Constant.greyDark,
                                                    //                 //     fontSize: 12,
                                                    //                 //     fontFamily: 'Poppins',
                                                    //                 //   ),
                                                    //                 // )
                                                    //               ],
                                                    //             ),
                                                    //           ),
                                                    //         ),
                                                    //         Row(
                                                    //           children: [
                                                    //             Obx(
                                                    //               ()=> FlutterSwitch(
                                                    //                 width: 50,
                                                    //                 height: 23,
                                                    //                 value: controller.itemList[index].active!,
                                                    //                 borderRadius: 30.0,
                                                    //                 padding: 2,
                                                    //                 switchBorder: Border.all(
                                                    //                     color: Constant.black, width: 2),
                                                    //                 activeColor: Constant.white,
                                                    //                 inactiveColor: Constant.white,
                                                    //                 inactiveToggleColor:
                                                    //                     Constant.secondaryColor,
                                                    //                 activeToggleColor:
                                                    //                     Constant.successColor,
                                                    //                 showOnOff: false,
                                                    //                 onToggle: (val) {
                                                    //
                                                    //                 },
                                                    //               ),
                                                    //             ),
                                                    //             SizedBox(
                                                    //               width: 20,
                                                    //             ),
                                                    //             InkWell(
                                                    //               onTap: () {
                                                    //                 //   inventorycontroller
                                                    //                 //           .nameController.text =
                                                    //                 //       inventorycontroller
                                                    //                 //           .productCategoryData
                                                    //                 //           .value
                                                    //                 //           .data![index]
                                                    //                 //           .name!;
                                                    //                 //   inventorycontroller.parentId!.value =
                                                    //                 //       (inventorycontroller
                                                    //                 //                   .productCategoryData
                                                    //                 //                   .value
                                                    //                 //                   .data!
                                                    //                 //                   .results![index]
                                                    //                 //                   .parent ==
                                                    //                 //               null)
                                                    //                 //           ? ""
                                                    //                 //           : inventorycontroller
                                                    //                 //               .productCategoryData
                                                    //                 //               .value
                                                    //                 //               .data!
                                                    //                 //               .results![index]
                                                    //                 //               .parent!;
                                                    //                 //   inventorycontroller.isHidden!.value =
                                                    //                 //       inventorycontroller
                                                    //                 //           .productCategoryData
                                                    //                 //           .value
                                                    //                 //           .data!
                                                    //                 //           .results![index]
                                                    //                 //           .isHidden!;
                                                    //                 //   inventorycontroller.ImageSelected
                                                    //                 //       .value = (inventorycontroller
                                                    //                 //               .productCategoryData
                                                    //                 //               .value
                                                    //                 //               .data!
                                                    //                 //               .results![index]
                                                    //                 //               .image ==
                                                    //                 //           null)
                                                    //                 //       ? false
                                                    //                 //       : true;
                                                    //                 //   inventorycontroller.Image =
                                                    //                 //       (inventorycontroller
                                                    //                 //                   .productCategoryData
                                                    //                 //                   .value
                                                    //                 //                   .data!
                                                    //                 //                   .results![index]
                                                    //                 //                   .image ==
                                                    //                 //               null)
                                                    //                 //           ? "" as File
                                                    //                 //           : File(inventorycontroller
                                                    //                 //               .productCategoryData
                                                    //                 //               .value
                                                    //                 //               .data!
                                                    //                 //               .results![index]
                                                    //                 //               .image!);
                                                    //                 //   Get.to(AddCategory(
                                                    //                 //       "Add Category",
                                                    //                 //       inventorycontroller
                                                    //                 //           .productCategoryData
                                                    //                 //           .value
                                                    //                 //           .data!
                                                    //                 //           .results![index]
                                                    //                 //           .id!,
                                                    //                 //       "Edit"));
                                                    //               },
                                                    //               child: Icon(
                                                    //                 Icons.edit,
                                                    //                 color: Constant.secondaryColor,
                                                    //               ),
                                                    //             )
                                                    //           ],
                                                    //         ),
                                                    //       ],
                                                    //     )),
                                                    title: Container(
                                                      color: Constant.blueShadowBackground,
                                                      //elevation: 5,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(0.0),
                                                        child: Container(
                                                            child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                (controller.tempItemList[index].image == "")
                                                                    ? Container()
                                                                    : (controller.tempItemList[index].image!.contains("http"))
                                                                        ? CachedNetworkImage(width: 79, height: 79, imageUrl: controller.tempItemList[index].image!)
                                                                        : CachedNetworkImage(
                                                                            width: 79,
                                                                            height: 79,
                                                                            imageUrl: (controller.tempItemList[index].image != null)
                                                                                ? (!controller.tempItemList[index].image!.startsWith('/'))
                                                                                    ? Constant.imageUrl + "/" + controller.tempItemList[index].image!
                                                                                    : Constant.imageUrl + controller.tempItemList[index].image!
                                                                                : Constant.imageUrl + "/" + mainController.selectedStore.value.image!,
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
                                                                  width: 10,
                                                                ),
                                                                Container(
                                                                  child: Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    children: [
                                                                      Text(
                                                                        controller.tempItemList[index].name!,
                                                                        style: TextStyle(color: Constant.black, fontSize: 15, fontFamily: 'Poppins-bold', fontWeight: FontWeight.bold),
                                                                      ),
                                                                      controller.tempItemList[index].description != null
                                                                          ? Container(
                                                                              width: MediaQuery.of(context).size.width * 0.4,
                                                                              child: Text(
                                                                                controller.tempItemList[index].description!,
                                                                                maxLines: 2,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                style: TextStyle(
                                                                                  color: Constant.greyDark,
                                                                                  fontSize: 12,
                                                                                  fontFamily: 'Poppins',
                                                                                ),
                                                                              ),
                                                                            )
                                                                          : Text(""),
                                                                      SizedBox(
                                                                        height: 0,
                                                                      ),
                                                                      Text(
                                                                        "Rs. " + controller.tempItemList[index].price!.toString(),
                                                                        style: TextStyle(
                                                                          color: Constant.greyDark,
                                                                          fontSize: 12,
                                                                          fontFamily: 'Poppins',
                                                                        ),
                                                                      ),
                                                                      CustomContainer(
                                                                        onTap: () {
                                                                          showDialog(
                                                                            context: context,
                                                                            builder: (_) => AddSKU(controller.tempItemList[index].id.toString()),
                                                                          );
                                                                        },
                                                                        padding: 5,
                                                                        backgroundColor: (controller.tempItemList[index].sku! > 10) ? Constant.successColor : Constant.errorColor,
                                                                        child: Text(
                                                                          "Quantity " + controller.tempItemList[index].sku!.toString(),
                                                                          style: TextStyle(
                                                                            color: Constant.white,
                                                                            fontSize: 12,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontFamily: 'Poppins',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                Obx(
                                                                  () => FlutterSwitch(
                                                                    width: 50,
                                                                    height: 23,
                                                                    value: controller.acceptOrders[index + 1],
                                                                    // value: controller.itemList[index].active!,
                                                                    // value: controller.itemData.value.data!.results![index].isHidden!,
                                                                    borderRadius: 30.0,
                                                                    padding: 2,
                                                                    switchBorder: Border.all(color: Constant.black, width: 2),
                                                                    activeColor: Constant.white,
                                                                    inactiveColor: Constant.white,
                                                                    inactiveToggleColor: Constant.errorColor,
                                                                    activeToggleColor: Constant.successColor,
                                                                    showOnOff: false,
                                                                    onToggle: (val) {
                                                                      controller.acceptOrders[index + 1] = val;
                                                                      controller.tempItemList[index].active = val;
                                                                      controller.EditProductStatus(controller.tempItemList[index].id.toString(), val);
                                                                      // if (val) {
                                                                      //   print(val);
                                                                      //   controller.itemList[index].active = false;
                                                                      //
                                                                      // } else {
                                                                      //   print("false");
                                                                      //   controller.itemList[index].active = true;
                                                                      //   controller.EditProductStatus(controller.itemList[index].id.toString(),true);
                                                                      // }
                                                                    },
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    InkWell(
                                                                      onTap: () async {
                                                                        String link = await mainController.createDynamicLinkStore(true, "product/${controller.tempItemList[index].id.toString()}");
                                                                        print(link);
                                                                        if (mainController.selectedStore.value.image == null) {
                                                                          print("if me aaya");
                                                                          // Navigator.pop(context);
                                                                          // for (var discount in items) {
                                                                          // }
                                                                          await Share.share(
                                                                              "Check out this \"${controller.tempItemList[index].name}\" on Local Shopi \n${mainController.selectedStore.value.name}\n ($link)"); //.\n${brand.applicableOffers.join(",\n")}");
                                                                        } else {
                                                                          await Share.share("Check out this \"${controller.tempItemList[index].name}\" on Local Shopi \n${mainController.selectedStore.value.name}\n ($link)");
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
                                                                      child: Icon(
                                                                        Icons.share,
                                                                        color: Constant.secondaryColor,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    InkWell(
                                                                      onTap: () {
                                                                        addProductData(index);

                                                                        Get.to(AddProduct("Edit", controller.tempItemList[index].id.toString(), index));
                                                                      },
                                                                      child: Icon(
                                                                        Icons.edit,
                                                                        color: Constant.secondaryColor,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        )),
                                                      ),
                                                    ),
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Container(
                                                            color: Colors.white,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                                                                  child: InkWell(
                                                                    onTap: () {
                                                                      Get.to(AddEditAddOnCategory("Add", "none", index, 0));
                                                                      clearVariantData(index);
                                                                    },
                                                                    child: Text(
                                                                      (controller.tempItemList[index].productType == "CUSTOMIZABLE") ? "+ Customize" : "+ Add Variant",
                                                                      style: TextStyle(color: Constant.secondaryColor),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          // Container()
                                                          (controller.tempItemList[index].variants == null)
                                                              ? Container()
                                                              : ListView.builder(
                                                                  shrinkWrap: true,
                                                                  physics: NeverScrollableScrollPhysics(),
                                                                  itemCount: controller.tempItemList[index].variants!.length,
                                                                  itemBuilder: (context, indexSubCategory) {
                                                                    return InkWell(
                                                                      onTap: () {},
                                                                      onLongPress: () {},
                                                                      child: Container(
                                                                          color: Constant.white,
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.all(10.0),
                                                                            child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Container(
                                                                                  width: MediaQuery.of(context).size.width * 0.6,
                                                                                  child: Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        controller.tempItemList[index].variants![indexSubCategory].name ?? "",
                                                                                        style: TextStyle(
                                                                                          color: Constant.black,
                                                                                          fontSize: 15,
                                                                                          fontFamily: 'Poppins',
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap: () {
                                                                                        insertVariantData(index, indexSubCategory);
                                                                                        Get.to(AddEditAddOnCategory("Edit", controller.tempItemList[index].variants![indexSubCategory].id, index, indexSubCategory));
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.edit,
                                                                                        color: Constant.secondaryColor,
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: 10,
                                                                                    ),
                                                                                    Obx(
                                                                                      () => FlutterSwitch(
                                                                                        width: 50,
                                                                                        height: 23,
                                                                                        value: controller.acceptOrders[((index + 1) * 10) + indexSubCategory],
                                                                                        // value: controller.itemList[index].variants![indexSubCategory].active == 1 ?true:false,
                                                                                        borderRadius: 30.0,
                                                                                        padding: 2,
                                                                                        switchBorder: Border.all(color: Constant.black, width: 2),
                                                                                        activeColor: Constant.white,
                                                                                        inactiveColor: Constant.white,
                                                                                        inactiveToggleColor: Constant.errorColor,
                                                                                        activeToggleColor: Constant.successColor,
                                                                                        showOnOff: false,
                                                                                        onToggle: (val) {
                                                                                          print(val);
                                                                                          controller.acceptOrders[((index + 1) * 10) + indexSubCategory] = val;
                                                                                          variantController.EditVariantStatus(controller.tempItemList[index].variants![indexSubCategory].id.toString(), val);
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          )),
                                                                    );
                                                                  }),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              )
                                            ],
                                          );
                                    // return Column(
                                    //   children: [
                                    //     Card(
                                    //       color: Constant.blueShadowBackground,
                                    //       //elevation: 5,
                                    //       child: ExpansionTile(
                                    //         title: Container(
                                    //
                                    //             child: Row(
                                    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //               children: [
                                    //                 Container(
                                    //                   child: Column(
                                    //                     crossAxisAlignment: CrossAxisAlignment.start,
                                    //                     children: [
                                    //                       Text(
                                    //                         subCategory[index].name??"",
                                    //                         style: TextStyle(
                                    //                             color: Constant.black,
                                    //                             fontSize: 15,
                                    //                             fontFamily: 'Poppins-bold',
                                    //                             fontWeight: FontWeight.bold
                                    //                         ),
                                    //                       ),
                                    //                       Text(
                                    //                         subCategory[index].items??"",
                                    //                         style: TextStyle(
                                    //                           color: Constant.greyDark,
                                    //                           fontSize: 12,
                                    //                           fontFamily: 'Poppins',
                                    //                         ),
                                    //                       )
                                    //                     ],
                                    //                   ),
                                    //                 ),
                                    //                 Obx(
                                    //                       () => FlutterSwitch(
                                    //                     width: 50,
                                    //                     height: 23,
                                    //                     value: controller.acceptOrders.value[index],
                                    //                     borderRadius: 30.0,
                                    //                     padding: 2,
                                    //                     switchBorder: Border.all(color: Constant.black, width: 2),
                                    //                     activeColor: Constant.white,
                                    //                     inactiveColor: Constant.white,
                                    //                     inactiveToggleColor: Constant.secondaryColor,
                                    //                     activeToggleColor: Constant.successColor,
                                    //                     showOnOff: false,
                                    //                     onToggle: (val) {
                                    //                       controller.acceptOrders.value[index] = val;
                                    //                     },
                                    //                   ),
                                    //                 ),
                                    //               ],
                                    //             )
                                    //         ),
                                    //         children: [
                                    //           ListView.builder(
                                    //               shrinkWrap: true,
                                    //               physics: ScrollPhysics(),
                                    //               itemCount: item1.length,
                                    //               itemBuilder: (context, indexx) {
                                    //                 return InkWell(
                                    //                   onTap: () {
                                    //                     Customize(context,index,indexx);
                                    //                   },
                                    //                   child: Container(
                                    //                       color: Constant.white,
                                    //                       child: Padding(
                                    //                         padding: const EdgeInsets.all(10.0),
                                    //                         child: Row(
                                    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //                           children: [
                                    //                             Container(
                                    //                               width: MediaQuery.of(context).size.width*0.6,
                                    //                               child: Column(
                                    //                                 crossAxisAlignment: CrossAxisAlignment.start,
                                    //                                 children: [
                                    //                                   Text(
                                    //                                     item1[indexx].Name??"",
                                    //                                     style: TextStyle(
                                    //                                       color: Constant.black,
                                    //                                       fontSize: 15,
                                    //                                       fontFamily: 'Poppins',
                                    //                                     ),
                                    //                                   ),
                                    //                                   Text(
                                    //                                     "Rs. "+item1[indexx].price,
                                    //                                     style: TextStyle(
                                    //                                         color: Constant.black,
                                    //                                         fontSize: 12,
                                    //                                         fontFamily: 'Poppins-bold',
                                    //                                         fontWeight: FontWeight.bold
                                    //                                     ),
                                    //                                   )
                                    //                                 ],
                                    //                               ),
                                    //                             ),
                                    //                             Obx(
                                    //                                   () => FlutterSwitch(
                                    //                                 width: 50,
                                    //                                 height: 23,
                                    //                                 value: controller.acceptOrders.value[(index*10)+indexx],
                                    //                                 borderRadius: 30.0,
                                    //                                 padding: 2,
                                    //                                 switchBorder: Border.all(color: Constant.black, width: 2),
                                    //                                 activeColor: Constant.white,
                                    //                                 inactiveColor: Constant.white,
                                    //                                 inactiveToggleColor: Constant.secondaryColor,
                                    //                                 activeToggleColor: Constant.successColor,
                                    //                                 showOnOff: false,
                                    //                                 onToggle: (val) {
                                    //                                   controller.acceptOrders.value[(index*10)+indexx] = val;
                                    //                                 },
                                    //                               ),
                                    //                             ),
                                    //                           ],
                                    //                         ),
                                    //                       )
                                    //                   ),
                                    //                 );
                                    //               })
                                    //         ],
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
                        Center(
                          child: Obx(
                            () => new Opacity(
                              opacity: controller.isPageLoading.value ? 1.0 : 00,
                              child: new CircularProgressIndicator(
                                color: Constant.greyBack,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
          });
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Constant.secondaryColor,
        foregroundColor: Constant.black,
        onPressed: () {
          // Respond to button press
          clearProductData();

          Get.to(AddProduct("Add", "none", 0));
        },
        label: Text(
          'Add Items',
          style: TextStyle(color: Constant.white, fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   backgroundColor: Constant.blueShadowBackground,
      //   foregroundColor: Constant.black,
      //   onPressed: () {
      //     // Respond to button press
      //   },
      //   label: Text(
      //     'Add Subcategory',
      //     style: TextStyle(
      //       color: Constant.black,
      //       fontSize: 12,
      //       fontFamily: 'Poppins',
      //     ),
      //   ),
      // ),
    );
  }

  void insertVariantData(index, variantIndex) async {
    variantController.variantProductId.value = controller.tempItemList[index].id!.toString();
    variantController.variantNameController.text = controller.tempItemList[index].variants![variantIndex].name!;
    variantController.variantPriceController.text = controller.tempItemList[index].variants![variantIndex].price!.toString();
    variantController.variantDiscountPriceController.text = controller.tempItemList[index].variants![variantIndex].discountPrice!.toString();
    variantController.variantQuantityController.text = controller.tempItemList[index].variants![variantIndex].sku!.toString();
    variantController.isVariantImageSelected.value = (controller.tempItemList[index].variants![variantIndex].image != "") ? true : false;
    variantController.selectedVariantImage.value = await controller.getImage(url: controller.tempItemList[index].variants![variantIndex].image!);
  }

  void clearVariantData(index) {
    variantController.variantProductId.value = controller.tempItemList[index].id!.toString();
    variantController.variantNameController.text = "";
    variantController.variantPriceController.text = "";
    variantController.variantDiscountPriceController.text = "";
    variantController.variantQuantityController.text = "";
    variantController.isVariantImageSelected.value = false;
    variantController.selectedVariantImage.value = File("");
  }

  void addProductData(index) async {
    controller.productNameController.text = controller.tempItemList[index].name!;
    controller.productDescriptionController.text = controller.tempItemList[index].description!;
    controller.productPriceController.text = controller.tempItemList[index].price.toString();
    controller.productSalePriceController.text = controller.tempItemList[index].discountPrice.toString();
    controller.selectedProductType.value = controller.tempItemList[index].productType!.toLowerCase();

    controller.isProductImageSelected.value = (controller.tempItemList[index].image == "") ? false : true;
    controller.selectedProductUnit.value = controller.tempItemList[index].unit!;
    controller.selectedProductCategory.value = controller.tempItemList[index].categoryId.toString();
    controller.productQuantityController.text = controller.tempItemList[index].sku.toString();
    // controller.selectedOpenTimeController.text = controller.itemList[index].
    controller.selectedProductTag.value = controller.tempItemList[index].productTags!;
    controller.isActive.value = controller.tempItemList[index].active!;
    if (controller.tempItemList[index].image != null) {
      print("add product ke if me");
      controller.selectedProductImage.value = (await controller.getImage(url: controller.tempItemList[index].image!));
    }
    controller.selectedOpenTimeController.text = controller.tempItemList[index].opening_Time!;
    controller.selectedCloseTimeController.text = controller.tempItemList[index].closing_Time!;
    // controller.selectedOpenTimeController.text = controller.itemList[index].k
  }

  void clearProductData() {
    controller.productNameController.text = "";
    controller.productDescriptionController.text = "";
    controller.productPriceController.text = "";
    controller.productSalePriceController.text = "";
    controller.selectedProductType.value = "";
    controller.selectedProductImage.value = File("");
    controller.isProductImageSelected.value = false;
    controller.selectedProductUnit.value = "";
    controller.selectedProductCategory.value = "";
    controller.productQuantityController.text = "";
    controller.selectedProductTag.value = "";
    controller.isActive.value = false;
    controller.selectedOpenTimeController.text = "";
    controller.selectedCloseTimeController.text = "";
    controller.selectedOpenTimeController.text = "";
    controller.selectedCloseTimeController.text = "";
  }

  // void Customize(context, index, indexx) {
  //   showCupertinoModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext context) =>
  //         StatefulBuilder(builder: (context, setState) {
  //       return CupertinoActionSheet(
  //         actions: [
  //           Container(
  //               color: Constant.white,
  //               //color: Colors.grey[900],
  //               child: Column(
  //                 children: [
  //                   Text(
  //                     "Add-Ons",
  //                     style: TextStyle(
  //                         color: Constant.black,
  //                         fontSize: 20,
  //                         fontFamily: 'Poppins-bold',
  //                         fontWeight: FontWeight.bold,
  //                         decoration: TextDecoration.none),
  //                   ),
  //                   SizedBox(
  //                     height: MediaQuery.of(context).size.height * 0.5,
  //                     child: ListView.builder(
  //                       itemCount: addOnCategory.length,
  //                       itemBuilder: (context, indexxx) {
  //                         return Column(
  //                           children: [
  //                             Card(
  //                               color: Constant.blueShadowBackground,
  //                               //elevation: 5,
  //                               child: ExpansionTile(
  //                                 title: Container(
  //                                     child: Row(
  //                                   mainAxisAlignment:
  //                                       MainAxisAlignment.spaceBetween,
  //                                   children: [
  //                                     Container(
  //                                       child: Column(
  //                                         crossAxisAlignment:
  //                                             CrossAxisAlignment.start,
  //                                         children: [
  //                                           Text(
  //                                             addOnCategory[indexxx].name ?? "",
  //                                             style: TextStyle(
  //                                                 color: Constant.black,
  //                                                 fontSize: 15,
  //                                                 fontFamily: 'Poppins-bold',
  //                                                 fontWeight: FontWeight.bold),
  //                                           ),
  //                                           Text(
  //                                             addOnCategory[indexxx].items ??
  //                                                 "",
  //                                             style: TextStyle(
  //                                               color: Constant.greyDark,
  //                                               fontSize: 12,
  //                                               fontFamily: 'Poppins',
  //                                             ),
  //                                           )
  //                                         ],
  //                                       ),
  //                                     ),
  //                                     Obx(
  //                                       () => FlutterSwitch(
  //                                         width: 50,
  //                                         height: 23,
  //                                         value: controller.acceptOrders.value[
  //                                             (((index * 10) + indexx) * 10) +
  //                                                 indexxx],
  //                                         borderRadius: 30.0,
  //                                         padding: 2,
  //                                         switchBorder: Border.all(
  //                                             color: Constant.black, width: 2),
  //                                         activeColor: Constant.white,
  //                                         inactiveColor: Constant.white,
  //                                         inactiveToggleColor:
  //                                             Constant.secondaryColor,
  //                                         activeToggleColor:
  //                                             Constant.successColor,
  //                                         showOnOff: false,
  //                                         onToggle: (val) {
  //                                           controller.acceptOrders.value[
  //                                               (((index * 10) + indexx) * 10) +
  //                                                   indexxx] = val;
  //                                         },
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 )),
  //                                 children: [
  //                                   ListView.builder(
  //                                       shrinkWrap: true,
  //                                       physics: ScrollPhysics(),
  //                                       itemCount: item1.length,
  //                                       itemBuilder: (context, indexxxx) {
  //                                         return InkWell(
  //                                           onTap: () {
  //                                             Get.back();
  //                                           },
  //                                           child: Container(
  //                                               color: Constant.white,
  //                                               child: Padding(
  //                                                 padding: const EdgeInsets.all(
  //                                                     10.0),
  //                                                 child: Row(
  //                                                   mainAxisAlignment:
  //                                                       MainAxisAlignment
  //                                                           .spaceBetween,
  //                                                   children: [
  //                                                     Container(
  //                                                       width: MediaQuery.of(
  //                                                                   context)
  //                                                               .size
  //                                                               .width *
  //                                                           0.6,
  //                                                       child: Column(
  //                                                         crossAxisAlignment:
  //                                                             CrossAxisAlignment
  //                                                                 .start,
  //                                                         children: [
  //                                                           Text(
  //                                                             addOnItems[indexxxx]
  //                                                                     .Name ??
  //                                                                 "",
  //                                                             style: TextStyle(
  //                                                               color: Constant
  //                                                                   .black,
  //                                                               fontSize: 15,
  //                                                               fontFamily:
  //                                                                   'Poppins',
  //                                                             ),
  //                                                           ),
  //                                                           Text(
  //                                                             "Rs. " +
  //                                                                 addOnItems[
  //                                                                         indexxxx]
  //                                                                     .price,
  //                                                             style: TextStyle(
  //                                                                 color: Constant
  //                                                                     .black,
  //                                                                 fontSize: 12,
  //                                                                 fontFamily:
  //                                                                     'Poppins-bold',
  //                                                                 fontWeight:
  //                                                                     FontWeight
  //                                                                         .bold),
  //                                                           )
  //                                                         ],
  //                                                       ),
  //                                                     ),
  //                                                     Obx(
  //                                                       () => FlutterSwitch(
  //                                                         width: 50,
  //                                                         height: 23,
  //                                                         value: controller
  //                                                             .acceptOrders
  //                                                             .value[(((((index * 10) +
  //                                                                             indexx) *
  //                                                                         10) +
  //                                                                     indexxx) *
  //                                                                 10) +
  //                                                             indexxxx],
  //                                                         borderRadius: 30.0,
  //                                                         padding: 2,
  //                                                         switchBorder:
  //                                                             Border.all(
  //                                                                 color: Constant
  //                                                                     .black,
  //                                                                 width: 2),
  //                                                         activeColor:
  //                                                             Constant.white,
  //                                                         inactiveColor:
  //                                                             Constant.white,
  //                                                         inactiveToggleColor:
  //                                                             Constant
  //                                                                 .secondaryColor,
  //                                                         activeToggleColor:
  //                                                             Constant
  //                                                                 .successColor,
  //                                                         showOnOff: false,
  //                                                         onToggle: (val) {
  //                                                           controller
  //                                                               .acceptOrders
  //                                                               .value[(((((index * 10) +
  //                                                                               indexx) *
  //                                                                           10) +
  //                                                                       indexxx) *
  //                                                                   10) +
  //                                                               indexxxx] = val;
  //                                                         },
  //                                                       ),
  //                                                     ),
  //                                                   ],
  //                                                 ),
  //                                               )),
  //                                         );
  //                                       })
  //                                 ],
  //                               ),
  //                             ),
  //                             SizedBox(
  //                               height: 10,
  //                             )
  //                           ],
  //                         );
  //                       },
  //                     ),
  //                   ),
  //                 ],
  //               )),
  //
  //           // CupertinoActionSheetAction(
  //           //   child: Container(
  //           //     width: MediaQuery.of(context).size.width*0.9,
  //           //     height: MediaQuery.of(context).size.height*0.06,
  //           //     child: Card(
  //           //         color: Constant.blueShadowBackground,
  //           //         child: Center(
  //           //             child: Text(
  //           //               'Customize Item',
  //           //               style: TextStyle(
  //           //                   color: Constant.black,
  //           //                   fontSize: 15,
  //           //                   fontFamily: 'Poppins-bold',
  //           //                   fontWeight: FontWeight.bold
  //           //               ),
  //           //             )
  //           //         )
  //           //     ),
  //           //   ),
  //           //   onPressed: () {
  //           //     Get.back();
  //           //   },
  //           // ),
  //         ],
  //       );
  //     }),
  //   );
  // }

  showAlertDialog(BuildContext context, String itemId, var controller, String category) {
    print(itemId);
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
        Get.find<InventoryController>().DeleteItem(itemId, category);
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
}
