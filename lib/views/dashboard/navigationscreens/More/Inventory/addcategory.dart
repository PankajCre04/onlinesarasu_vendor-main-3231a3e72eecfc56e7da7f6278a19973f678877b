import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';
import 'package:multi_select_flutter/util/horizontal_scrollbar.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/single_choice_chip.dart';
import 'package:sooooperbusiness/commons/utils.dart';
import 'package:sooooperbusiness/controllers/inventory/inventoryController.dart';
import 'package:sooooperbusiness/model/more/inventory/category.dart';
import 'package:sooooperbusiness/model/more/inventory/getcategoryresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/inventoryModel.dart';
import 'package:sooooperbusiness/model/more/inventory/productCategory.dart';
import 'package:sooooperbusiness/views/components/custombutton.dart';
import 'package:sooooperbusiness/views/components/labeledcheckbox.dart';
import 'package:sooooperbusiness/views/components/my_list_tile.dart';
import 'package:sooooperbusiness/views/components/my_text_field.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/More/Inventory/tabs/Products.dart';

class AddCategory extends StatelessWidget {
  final categorystatus;
  final categoryedit;
  final categoryId;
  final categoryIndex;
  final subcategoryIndex;

  AddCategory(this.categorystatus, this.categoryId, this.categoryedit, this.categoryIndex, this.subcategoryIndex);

  InventoryController inventoryController = Get.put(InventoryController());

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
          categoryedit + " Category",
          style: TextStyle(
            fontSize: 16.0,
            color: Constant.black,
            fontFamily: 'Poppins_Bold',
          ),
        ),
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: (inventoryController.isLoading!.value == true)
              ? Align(alignment: Alignment.center, child: CircularProgressIndicator())
              : Column(
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
                        child: Form(
                          key: inventoryController.addcategoryformKey,
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0, right: 6),
                              child: MyTextField(
                                controller: inventoryController.categoryNameController,
                                borderRadius: 10,
                                contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                onChanged: (value) {},
                                labelText: (categorystatus == "Add Category") ? 'Category Name' : "Subcategory Name",
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
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // (categoryedit == "Add")
                            //     ? Obx(
                            //         () => MyListTile(
                            //           //margin: EdgeInsets.all(20),
                            //           title: (categorystatus == "Add Category")
                            //               ? "Category Image"
                            //               : "Subcategory Image",
                            //           trailingIconData: (inventoryController
                            //                       .ImageSelected.value &&
                            //                   inventoryController
                            //                           .ImageSelected !=
                            //                       null)
                            //               ? Icons.check_circle
                            //               : Icons.cloud_upload,
                            //           trailingColor: (inventoryController
                            //                       .ImageSelected.value &&
                            //                   inventoryController
                            //                           .ImageSelected !=
                            //                       null)
                            //               ? Colors.green[700]
                            //               : Colors.red,
                            //           onPressed: () async {
                            //             inventoryController.idType.value =
                            //                 "Image";
                            //             await inventoryController.pickImage();
                            //           },
                            //           leadingImageName: null,
                            //           subtitle: null,
                            //         ),
                            //       )
                            //     : Container(),
                            // (categoryedit == "Add")
                            //     ? (categorystatus != "Add Category")
                            //         ? GetBuilder<InventoryController>(
                            //             builder: (addCat) => addCat
                            //                         .ImageSelected.value &&
                            //                     addCat.Image != null
                            //                 ? Padding(
                            //                     padding:
                            //                         const EdgeInsets.fromLTRB(
                            //                             20, 0, 20, 0),
                            //                     child: Image.file(
                            //                         addCat.Image as File),
                            //                   )
                            //                 : Container(),
                            //           )
                            //         : Container()
                            //     : Container(),
                            (categorystatus == "Add Category")
                                ? Container()
                                : SizedBox(
                                    height: 10,
                                  ),
                            //below is subcategory drop down
                            // (categorystatus == "Add Category")?Container():Obx(() {
                            //   return Padding(
                            //     padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            //     child: Container(
                            //       padding: EdgeInsets.only(left: 20, right: 10),
                            //       decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(10),
                            //           color: Constant.white,
                            //           border: Border.all(
                            //               color: Colors.grey.shade300, width: 2)),
                            //       child: DropdownButton(
                            //         icon: Icon(
                            //           Icons.arrow_drop_down_circle_rounded,
                            //           color: Constant.secondaryColor,
                            //         ),
                            //         iconSize: 20,
                            //         underline: SizedBox(),
                            //         isExpanded: true,
                            //         style: const TextStyle(color: Colors.black),
                            //         items: inventoryController.allProductCategory.map((item) {
                            //           return DropdownMenuItem<ProductCategory>(
                            //             child: Text(item.name!),
                            //             value: item,
                            //           );
                            //         }).toList(),
                            //         onChanged: (newVal) {
                            //           ProductCategory pc = newVal as ProductCategory;
                            //           print(pc.id);
                            //           inventoryController.selectedProductParentCategory.value = pc;
                            //           // inventoryController.selectedProductParentCategory.value = pc.id!.toString();
                            //         },
                            //
                            //         // value: inventoryController.allProductCategory[0],
                            //         value: (inventoryController.selectedProductParentCategory.value.id != null)
                            //             ?inventoryController.selectedProductParentCategory.value
                            //             : inventoryController.allProductCategory[0],
                            //       ),
                            //       // child: DropdownButton<String>(
                            //       //   value: inventoryController.selectedProductParentCategory.value,
                            //       //   icon: Icon(
                            //       //     Icons.arrow_drop_down_circle_rounded,
                            //       //     color: Constant.secondaryColor,
                            //       //   ),
                            //       //   iconSize: 20,
                            //       //   underline: SizedBox(),
                            //       //   isExpanded: true,
                            //       //   style: const TextStyle(color: Colors.black),
                            //       //   onChanged: (String? newValue) {
                            //       //     inventoryController.selectedProductParentCategory.value = newValue!;
                            //       //   },
                            //       //   items: inventoryController.items;
                            //       // ),
                            //     ),
                            //   );
                            // }),
                            SizedBox(
                              height: 10,
                            ),
                            GetBuilder<InventoryController>(
                                builder: (controller) => Obx(
                                      () => controller.isCategoryImageSelected.value && controller.selectedCategoryImage.value != null
                                          ? Padding(
                                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                              child: Image.file(controller.selectedCategoryImage.value),
                                            )
                                          : Container(),
                                    )),

                            // Obx(
                            //       () => Padding(
                            //     padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            //     child: MyListTile(
                            //       margin: EdgeInsets.all(20),
                            //       title: "Product Image",
                            //       trailingIconData:
                            //       (inventoryController.isCategoryImageSelected.value &&
                            //           inventoryController.selectedCategoryImage.value !=
                            //               null)
                            //           ? Icons.check_circle
                            //           : Icons.cloud_upload,
                            //       trailingColor:
                            //       (inventoryController.isCategoryImageSelected.value &&
                            //           inventoryController.selectedProductImage != null)
                            //           ? Colors.green[700]
                            //           : Colors.red,
                            //       onPressed: () async {
                            //
                            //         inventoryController.selectedCategoryImage.value = await inventoryController.pickImage();
                            //         print("bhaibah");
                            //         print(inventoryController.selectedCategoryImage.value.path);
                            //       },
                            //       leadingImageName: null,
                            //       subtitle: null,
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              height: 0,
                            ),
                            // (categorystatus != "Add Category")?(Controller.showDrop.value == false)
                            //     ? Container()
                            //     : Padding(
                            //         padding: const EdgeInsets.only(
                            //             left: 6.0, right: 6),
                            //         child: Container(
                            //           padding:
                            //               EdgeInsets.only(left: 20, right: 10),
                            //           decoration: BoxDecoration(
                            //               borderRadius:
                            //                   BorderRadius.circular(10),
                            //               color: Constant.white,
                            //               border: Border.all(
                            //                   color: Colors.grey.shade300,
                            //                   width: 2)
                            //               // boxShadow: [BoxShadow(
                            //               //   color: Colors.grey,
                            //               //   blurRadius: 5.0,
                            //               // ),]
                            //               ),
                            //           child: Obx(() {
                            //             return DropdownButton<Category>(
                            //               focusColor: Colors.white,
                            //               underline: SizedBox(),
                            //               //value: Controller.parent.value,
                            //               //value: Controller.parent!.value,
                            //               //addCatController.parentt.toString(),
                            //               //elevation: 5,
                            //               value: Controller.catItem.value,
                            //               isExpanded: true,
                            //               style: TextStyle(color: Colors.white),
                            //               iconEnabledColor: Colors.black,
                            //               items: Controller.categoryData.value.data!.results!.map<DropdownMenuItem<Category>>((Category value) {
                            //                 return DropdownMenuItem<Category>(
                            //                   value: value,
                            //                   child: Text(
                            //                     value.id!,
                            //                     style: TextStyle(
                            //                       color: Constant.greyDark,
                            //                       fontSize: 18,
                            //                     ),
                            //                   ),
                            //                 );
                            //               }).toList(),
                            //               hint: Text(
                            //                 "Parent",
                            //                 style: TextStyle(
                            //                   color: Constant.greyDark,
                            //                   fontSize: 18,
                            //                 ),
                            //               ),
                            //               icon: Icon(
                            //                 Icons
                            //                     .arrow_drop_down_circle_rounded,
                            //                 color: Constant.secondaryColor,
                            //               ),
                            //               iconSize: 20,
                            //               onChanged: (Category? value){
                            //                 Controller.catItem.value = value!;
                            //                 Controller.parent.value = Controller.catItem.value.name!;
                            //                 Controller.parentId!.value = Controller.catItem.value.id!;
                            //                 //Controller.parentId.value = value.id!;
                            //               },
                            //               // onChanged: (Category value) {
                            //               //   //print(value);
                            //               //   // for (var i = 0; i < Controller.item!.length; i++) {
                            //               //   //   if (value == Controller.item![i]) {
                            //               //   //
                            //               //   //     print(Controller.item![i]);
                            //               //   //     Controller.parentId!.value = Controller.parentList![i].toString();
                            //               //   //     // setState(() {
                            //               //   //     //   parentId = Controller.parent!.value[i].toString();
                            //               //   //     // });
                            //               //   //   }
                            //               //   // }
                            //               //   Controller.parent.value = value.name!;
                            //               //   // setState(() {
                            //               //   //   parent = value;
                            //               //   // });
                            //               // },
                            //             );
                            //           }),
                            //         ),
                            //       ):Container(),
                            SizedBox(
                              height: 0,
                            ),
                            // (categorystatus != "Add Category")
                            //     ? SingleSelectionChip(
                            //         inventoryController.allParentCategory,
                            //         inventoryController
                            //             .selectedParentSubcategory,
                            //         onSelectionChanged: (selectedList) {
                            //           print(selectedList);
                            //           inventoryController
                            //               .selectedParentSubcategory
                            //               .value = selectedList;
                            //         },
                            //       )
                            //     : Container(),
                            // (categorystatus != "Add Category")
                            //     ? Padding(
                            //         padding:
                            //             const EdgeInsets.fromLTRB(10, 5, 10, 0),
                            //         child:
                            //     : Container(),
                          ]),
                        )),
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
                              textColor: Constant.white,
                              textStyle: TextStyle(fontSize: 20, letterSpacing: 1, fontWeight: FontWeight.bold, color: Constant.white, fontFamily: 'Poppins'),
                              borderRadius: 25,
                              customPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              backgroundColor: Constant.secondaryColor,
                              onTap: () {
                                if (inventoryController.addcategoryformKey.currentState!.validate()) {
                                  if (categoryedit == "Add") {
                                    print("add");
                                    print("SaveButton2");
                                    inventoryController.AddProductCategory();
                                  } else {
                                    print("eldit");
                                    inventoryController.EditProductCategory(categoryId.toString(), categoryIndex);
                                  }
                                  // if(inventoryController.isProductImageSelected.value ){
                                  //   // if(categoryedit == "Add"){
                                  //   //   print("add");
                                  //   //   inventoryController.AddProductCategory();
                                  //   // }else{
                                  //   //   print("eldit");
                                  //   //   inventoryController.EditProductCategory(categoryId.toString(),categoryIndex);
                                  //   // }
                                  //
                                  // }else{
                                  //   Utility.showToastSuccess("error","Select all options");
                                  // }
                                } else {
                                  Utility.showToastSuccess("error", "Select all options");
                                }
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
        );
      }),
    );
  }
}
