// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sooooperbusiness/commons/constant.dart';
// import 'package:sooooperbusiness/controllers/pos/poscontroller.dart';
//
// class Quantity extends StatelessWidget {
//   int index;
//
//   Quantity(this.index);
//
//   POSController posController = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 30,
//       margin: EdgeInsets.fromLTRB(0, 5, 10, 0),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(
//             Radius.circular(25),
//           ),
//           border: Border(
//               right: BorderSide(
//                 color: Constant.greyDark,
//                 width: 1,
//               ),
//               left: BorderSide(
//                 color: Constant.greyDark,
//                 width: 1,
//               ),
//               top: BorderSide(
//                 color: Constant.greyDark,
//                 width: 1,
//               ),
//               bottom: BorderSide(
//                 color: Constant.greyDark,
//                 width: 1,
//               ))),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           InkWell(
//             focusColor: Constant.transparentSecondaryColor,
//             onTap: () {
//               posController.decreaseQuantity(index);
//             },
//             child: Padding(
//               padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
//               child: Icon(
//                 Icons.remove,
//                 size: 18,
//               ),
//             ),
//           ),
//           Container(
//             width: 1,
//             color: Constant.greyDark,
//           ),
//           Padding(
//             padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
//             child: Obx(
//               () => Text(
//                 posController.quantityMap.value[index].toString(),
//                 style: TextStyle(
//                   color: Constant.black,
//                   fontSize: 15,
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             width: 1,
//             color: Constant.greyDark,
//           ),
//           InkWell(
//             onTap: () {
//               posController.increaseQuantity(index);
//             },
//             child: Padding(
//               padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
//               child: Icon(
//                 Icons.add,
//                 size: 18,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
