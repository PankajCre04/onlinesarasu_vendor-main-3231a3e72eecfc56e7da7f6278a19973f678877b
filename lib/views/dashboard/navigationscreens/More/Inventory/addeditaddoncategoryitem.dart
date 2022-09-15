// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sooooperbusiness/commons/constant.dart';
// import 'package:sooooperbusiness/controllers/inventory/addonController.dart';
// import 'package:sooooperbusiness/views/components/custombutton.dart';
// import 'package:sooooperbusiness/views/components/my_text_field.dart';
//
// class AddEditAddOnCategoryItem extends StatelessWidget {
//   final addonCategoryItemStatus;
//   final categoryItemId;
//   final itemId;
//   AddonController addonController = Get.find();
//
//   AddEditAddOnCategoryItem(
//       this.addonCategoryItemStatus, this.categoryItemId, this.itemId);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Constant.white,
//         leading: GestureDetector(
//           onTap: () {
//             Get.back();
//           },
//           child: Icon(
//             Icons.arrow_back,
//             color: Constant.black,
//           ),
//         ),
//         title: Text(
//           "$addonCategoryItemStatus Add-On Item",
//           style: TextStyle(
//             fontSize: 16.0,
//             color: Constant.black,
//             fontFamily: 'Poppins_Bold',
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Form(
//           key: addonController.addEditAddonCategoryItemFormKey,
//           child: Column(
//             children: [
//               Padding(
//                   padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
//                   child: MyTextField(
//                     controller: addonController.addonCategoryItemNameController,
//                     borderRadius: 10,
//                     contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//                     onChanged: (value) {},
//                     labelText: 'Addon Category Item name',
//                     borderColor: Constant.borderColor,
//                     focusedBorderColor: Constant.black,
//                     borderWidth: 2,
//                     keyboardType: TextInputType.name,
//                     showTrailingWidget: true,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Enter Addon Category Item name ';
//                       }
//                       return null;
//                     },
//                   )),
//               Padding(
//                   padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
//                   child: MyTextField(
//                     controller:
//                         addonController.addonCategoryItemPriceController,
//                     borderRadius: 10,
//                     contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//                     onChanged: (value) {},
//                     labelText: 'Addon Category Item Price',
//                     borderColor: Constant.borderColor,
//                     focusedBorderColor: Constant.black,
//                     borderWidth: 2,
//                     keyboardType: TextInputType.number,
//                     showTrailingWidget: true,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Enter Addon Category Item Price ';
//                       }
//                       return null;
//                     },
//                   )),
//               SizedBox(
//                 height: 15,
//               ),
//               CustomButton(
//                 title: "$addonCategoryItemStatus Add-On Item",
//                 onTap: () {
//                   if (addonController
//                       .addEditAddonCategoryItemFormKey.currentState!
//                       .validate()) {
//                     addonController
//                         .addEditAddonCategoryItemFormKey.currentState!
//                         .save();
//                     if (addonCategoryItemStatus == "Add") {
//                       addonController.AddAddonCategoryItem(categoryItemId);
//                       //ownerControllers.addRestaurant();
//                     } else {
//                       addonController.EditAddonCategoryItem(
//                         categoryItemId,
//                         itemId
//                       );
//                       //ownerControllers.EditRestaurant();
//                     }
//                   }
//                 },
//                 borderRadius: 25,
//                 width: double.infinity,
//                 margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
//                 height: 65,
//                 textColor: Constant.white,
//                 backgroundColor: Constant.black,
//               ),
//               SizedBox(
//                 height: 100,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
