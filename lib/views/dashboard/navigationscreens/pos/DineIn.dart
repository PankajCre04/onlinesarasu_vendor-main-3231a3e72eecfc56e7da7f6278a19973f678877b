// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sooooperbusiness/commons/constant.dart';
// import 'package:sooooperbusiness/commons/utils.dart';
// import 'package:sooooperbusiness/controllers/pos/homecontroller.dart';
// import 'package:sooooperbusiness/controllers/pos/poscontroller.dart';
// import 'package:sooooperbusiness/model/pos/dineInModel.dart';
// import 'package:sooooperbusiness/views/dashboard/navigationscreens/pos/order_creator.dart';
//
// class DineIn extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.fromLTRB(30, 20, 30, 5),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Dine In - Select Table",
//                   style: TextStyle(
//                       color: Constant.black,
//                       fontSize: 18,
//                       fontFamily: 'Poppins_Bold',
//                       fontWeight: FontWeight.bold),
//                 ),
//                 InkWell(
//                     onTap: () {
//                       Get.find<HomeController>().changeTabIndex(0);
//                     },
//                     child: Icon(Icons.close))
//               ],
//             ),
//           ),
//           Expanded(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: GridView.builder(
//                     shrinkWrap: true,
//                     itemCount: tableData.length,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 4, childAspectRatio: 20 / 10),
//                     itemBuilder: (BuildContext context, int index) {
//                       return Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: InkWell(
//                           onTap: () {
//                             if (tableData[index].status == 0) {
//                               Get.find<HomeController>().changeTabIndex(4);
//                               Get
//                                   .find<POSController>()
//                                   .orderType
//                                   .value = "DINEIN";
//                               Get
//                                   .find<POSController>()
//                                   .tableNumber
//                                   .value =
//                                   tableData[index].tableNumber.toString();
//                             } else {
//                               Utility.showSingleTextToast(
//                                   "Table already reserved");
//                             }
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: (tableData[index].status == 0)
//                                   ? Constant.blueShadowBackground
//                                   : (tableData[index].status == 3)
//                                   ? Constant.greyDark
//                                   : Constant.secondaryColor,
//                             ),
//                             child: Center(
//                               child: Text(
//                                 tableData[index].tableNumber ?? "",
//                                 style: TextStyle(
//                                   color: Constant.black,
//                                   fontSize: 18,
//                                   fontFamily: 'Poppins',
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       Container(
//                         height: 18,
//                         width: 18,
//                         decoration: BoxDecoration(
//                           color: Constant.blueShadowBackground,
//                           border: Border.all(color: Constant.greyDark),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                         "Vacant",
//                         style: TextStyle(
//                           color: Constant.black,
//                           fontSize: 15,
//                           fontFamily: 'Poppins',
//                         ),
//                       ),
//                       SizedBox(width: 15),
//                       Container(
//                         height: 18,
//                         width: 18,
//                         decoration: BoxDecoration(
//                           color: Constant.greyDark,
//                           border: Border.all(color: Constant.greyDark),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                         "Reserved",
//                         style: TextStyle(
//                           color: Constant.black,
//                           fontSize: 15,
//                           fontFamily: 'Poppins',
//                         ),
//                       ),
//                       SizedBox(
//                         width: 15,
//                       ),
//                       Container(
//                         height: 18,
//                         width: 18,
//                         decoration: BoxDecoration(
//                           color: Constant.secondaryColor,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                         "Being Used",
//                         style: TextStyle(
//                           color: Constant.black,
//                           fontSize: 15,
//                           fontFamily: 'Poppins',
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 // Row(
//                 //   mainAxisAlignment: MainAxisAlignment.end,
//                 //   children: [
//                 //     Padding(
//                 //       padding: const EdgeInsets.all(16.0),
//                 //       child: GestureDetector(
//                 //         onTap: () {},
//                 //         child: Container(
//                 //           decoration: BoxDecoration(
//                 //             color: Constant.secondaryColor,
//                 //             borderRadius: BorderRadius.circular(29),
//                 //             border: Border.all(
//                 //               color: Constant.secondaryColor,
//                 //             ),
//                 //           ),
//                 //           child: Padding(
//                 //             padding: const EdgeInsets.only(
//                 //                 left: 18.0, right: 18, top: 8, bottom: 8),
//                 //             child: Text(
//                 //               "Next",
//                 //               style: TextStyle(
//                 //                   color: Constant.white,
//                 //                   fontSize: 13,
//                 //                   fontFamily: 'Poppins-bold',
//                 //                   fontWeight: FontWeight.bold),
//                 //             ),
//                 //           ),
//                 //         ),
//                 //       ),
//                 //     ),
//                 //   ],
//                 // )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
