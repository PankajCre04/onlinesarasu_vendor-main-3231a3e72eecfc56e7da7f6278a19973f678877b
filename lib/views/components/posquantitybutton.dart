// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:sooooperbusiness/commons/constant.dart';
// import 'package:sooooperbusiness/commons/utils.dart';
// import 'package:sooooperbusiness/controllers/inventory/ItemController.dart';
// import 'package:sooooperbusiness/controllers/pos/poscontroller.dart';
// import 'package:sooooperbusiness/model/more/inventory/product.dart';
// import 'package:sooooperbusiness/views/components/customcontainer.dart';
//
// class CartQuantityButton extends StatelessWidget {
//   final Items foodItem;
//   final int index;
//
//   CartQuantityButton({required this.foodItem, required this.index});
//
//   POSController cartController = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           foodItem.cartQuantity! > 0
//               ? CustomContainer(
//                   paddingEdge: EdgeInsets.fromLTRB(10, 5, 10, 5),
//                   backgroundColor: Constant.secondaryColor,
//                   borderRadius: 25,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           if (foodItem.cartQuantity! > 1) {
//                             foodItem.cartQuantity = foodItem.cartQuantity! - 1;
//                             print(foodItem.cartQuantity);
//                             cartController.setItems(foodItem);
//                             Get.find<ItemController>().searchItemList.elementAt(index).cartQuantity=foodItem.cartQuantity;
//                             Get.find<ItemController>().searchItemList.refresh();
//                             Get.find<ItemController>().update();
//                             // merchantController.restaurantItemList
//                             //     .insert(index, foodItem);
//                           }else if(foodItem.cartQuantity! <= 1){
//                             foodItem.cartQuantity =0;
//                             print(foodItem.cartQuantity);
//                             cartController.removeItem(foodItem);
//                             Get.find<ItemController>().searchItemList.elementAt(index).cartQuantity=foodItem.cartQuantity;
//                             Get.find<ItemController>().searchItemList.refresh();
//                             Get.find<ItemController>().update();
//                           }
//                         },
//                         child: Icon(
//                           Icons.remove,
//                           size: 20,
//                           color: Constant.white,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         "${foodItem.cartQuantity}",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Constant.white,
//                             fontSize: 16),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           if (foodItem.quantity! <= foodItem.cartQuantity!) {
//                             foodItem.cartQuantity = foodItem.quantity;
//                             Utility.showSingleTextToast(
//                                 "Only ${foodItem.cartQuantity} Available");
//                           } else {
//                             foodItem.cartQuantity = foodItem.cartQuantity! + 1;
//                           }
//                           // foodItem.quantity = foodItem.quantity! + 1;
//                           print(foodItem.cartQuantity);
//                           cartController.setItems(foodItem);
//                           // merchantController.restaurantItemList
//                           //     .insert(index, foodItem);
//                           Get.find<ItemController>().searchItemList.elementAt(index).cartQuantity=foodItem.cartQuantity;
//                           Get.find<ItemController>().searchItemList.refresh();
//                           Get.find<ItemController>().update();
//                         },
//                         child: Icon(
//                           Icons.add,
//                           size: 20,
//                           color: Constant.white,
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               : InkWell(
//                   onTap: () {
//                     if ((foodItem.quantity!) >= 1) {
//                       foodItem.cartQuantity = 1;
//                       print(foodItem.cartQuantity);
//                       cartController.setItems(foodItem);
//                       // merchantController.restaurantItemList
//                       //     .insert(index, foodItem);
//                       Get.find<ItemController>().searchItemList.elementAt(index).cartQuantity=foodItem.cartQuantity;
//                       Get.find<ItemController>().searchItemList.refresh();
//                       Get.find<ItemController>().update();
//
//                     } else {
//                       print("OUT OF STOCK");
//                       Utility.showSingleTextToast("Item Out Of Stock");
//                     }
//                   },
//                   child: Stack(
//                     children: [
//                       CustomContainer(
//                         paddingEdge: EdgeInsets.fromLTRB(10, 5, 10, 5),
//                         backgroundColor: Constant.secondaryColor,
//                         borderRadius: 25,
//                         width: MediaQuery.of(context).size.width * 0.20,
//                         child: Center(
//                           child: Text(
//                             "ADD",
//                             style: TextStyle(
//                               color: Constant.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 12,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         right: 15,
//                         top: 10,
//                         child: Container(
//                           height: 8,
//                           width: 8,
//                           child: Icon(
//                             Icons.add,
//                             color: Constant.white,
//                             size: 13,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//         ],
//       ),
//     );
//   }
// }
