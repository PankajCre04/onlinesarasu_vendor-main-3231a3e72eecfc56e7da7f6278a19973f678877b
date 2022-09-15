import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/sessionmanager.dart';
import 'package:sooooperbusiness/controllers/maincontroller.dart';
import 'package:sooooperbusiness/controllers/order/ordercontroller.dart';
import 'package:sooooperbusiness/controllers/order/processingOrderController.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/model/order/storeOrderData.dart';
import 'package:sooooperbusiness/model/processing_orderController.dart';
import 'package:flutter/cupertino.dart';
import 'package:sooooperbusiness/views/components/custombutton.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/order/orderProcessing/selectTimePopup.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:url_launcher/url_launcher.dart';

// class ProcessingOrder extends StatelessWidget {
//   final processingOrderController controller =
//       Get.put(processingOrderController());
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 7,
//       child: Scaffold(
//         // appBar: PreferredSize(
//         //   preferredSize: Size.fromHeight(40),
//         //   child: ListView(
//         //     children: [
//         //       Row(
//         //         children: [
//         //           Expanded(
//         //             flex: 3,
//         //             child: Material(
//         //               color: Constant.white,
//         //               child: TabBar(
//         //                   isScrollable: true,
//         //                   indicatorColor: Constant.greyBack,
//         //                   labelColor: Constant.black,
//         //                   indicatorWeight: 0.5,
//         //                   unselectedLabelColor: Constant.black,
//         //                   labelStyle: TextStyle(fontSize: 10.0),
//         //                   tabs: [
//         //                     new Tab(
//         //                       text: 'All',
//         //                     ),
//         //                     new Tab(text: 'Take Away'),
//         //                     new Tab(text: 'Delivery'),
//         //                     new Tab(text: 'Dine In'),
//         //                     new Tab(text: 'Waiting List'),
//         //                     new Tab(text: 'Reserve Table'),
//         //                     new Tab(icon: new Icon(Icons.search))
//         //                   ]),
//         //             ),
//         //           ),
//         //           Expanded(
//         //             flex: 4,
//         //             child: Row(
//         //               children: [
//         //                 SizedBox(
//         //                   width: 30,
//         //                 ),
//         //                 Container(
//         //                     decoration: BoxDecoration(
//         //                       color: Colors.white,
//         //                       borderRadius: BorderRadius.circular(29),
//         //                       border: Border.all(color: Constant.borderColor),
//         //                     ),
//         //                     child: Obx(() {
//         //                       return Row(
//         //                         mainAxisAlignment:
//         //                             MainAxisAlignment.spaceBetween,
//         //                         children: [
//         //                           GestureDetector(
//         //                             onTap: () {
//         //                               controller.check(0);
//         //                             },
//         //                             child: Container(
//         //                               decoration: BoxDecoration(
//         //                                 color: (controller.orderView.value == 0)
//         //                                     ? Constant.blueShadowBackground
//         //                                     : Colors.white,
//         //                                 borderRadius: BorderRadius.circular(29),
//         //                                 border: Border.all(
//         //                                   color:
//         //                                       (controller.orderView.value == 0)
//         //                                           ? Constant.greyBack
//         //                                           : Constant.white,
//         //                                 ),
//         //                               ),
//         //                               child: Padding(
//         //                                 padding: const EdgeInsets.only(
//         //                                     left: 8.0, right: 4),
//         //                                 child: Text(
//         //                                   "Order View",
//         //                                   style: TextStyle(
//         //                                       fontSize: 10,
//         //                                       fontFamily: "Poppins_Bold"),
//         //                                 ),
//         //                               ),
//         //                             ),
//         //                           ),
//         //                           GestureDetector(
//         //                             onTap: () {
//         //                               controller.check(1);
//         //                             },
//         //                             child: Container(
//         //                               decoration: BoxDecoration(
//         //                                 color: (controller.orderView.value == 1)
//         //                                     ? Constant.blueShadowBackground
//         //                                     : Colors.white,
//         //                                 borderRadius: BorderRadius.circular(29),
//         //                                 border: Border.all(
//         //                                   color:
//         //                                       (controller.orderView.value == 1)
//         //                                           ? Constant.greyBack
//         //                                           : Colors.white,
//         //                                 ),
//         //                               ),
//         //                               child: Padding(
//         //                                 padding: const EdgeInsets.only(
//         //                                     left: 4.0, right: 8),
//         //                                 child: Text(
//         //                                   "KOT View",
//         //                                   style: TextStyle(
//         //                                       fontSize: 10,
//         //                                       fontFamily: "Poppins_Bold"),
//         //                                 ),
//         //                               ),
//         //                             ),
//         //                           )
//         //                         ],
//         //                       );
//         //                     })),
//         //                 SizedBox(
//         //                   width: 10,
//         //                 ),
//         //                 Icon(Icons.close),
//         //               ],
//         //             ),
//         //           )
//         //         ],
//         //       ),
//         //     ],
//         //   ),
//         // ),
//         body: ProcessingOrderAll(),
//         // body: new TabBarView(
//         //   physics: NeverScrollableScrollPhysics(),
//         //   children: [
//         //     ProcessingOrderAll(),
//         //     new Container(),
//         //     new Container(),
//         //     new Container(),
//         //     new Container(),
//         //     new Container(),
//         //     new Container(),
//         //   ],
//         // ),
//       ),
//     );
//   }
// }

class ProcessingOrderAll extends StatelessWidget {
  final status;

  ProcessingOrderAll(this.status);

  final processingOrderController controller = Get.put(processingOrderController());
  OrderController orderController = Get.put(OrderController());
  MainController mainController = Get.put(MainController());

  List<String> Invoice = [
    "Cash",
    "Card",
    "UPI",
  ];

  @override
  Widget build(BuildContext context) {
    orderController.orderStatus.value = status;
    orderController.nextPage = 1;
    Future.delayed(const Duration(seconds: 1), () {
// Here you can write your code
      orderController.GetRestaurantOrder(1, "");
    });

    return Scaffold(
      body: SingleChildScrollView(
        controller: orderController.scrollController,
        child: Obx(() {
          return Column(
            children: [
              // Take Away card
              (orderController.orderList.length == 0)
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "No Data Found!",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: (orderController.orderList.value == null) ? 0 : orderController.orderList.value.length,
                      itemBuilder: (BuildContext context, int index) {
                        List<StoreOrderData> data = orderController.orderList.value;
                        return (data[index].orderStatus == status)
                            ? Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  decoration: BoxDecoration(
                                    color: Constant.blueShadowBackground,
                                    borderRadius: BorderRadius.circular(29),
                                    border: Border.all(
                                      color: Constant.greyBack,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Obx(() {
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        (data[index].user == null)
                                                            ? Container()
                                                            : Container(
                                                                width: MediaQuery.of(context).size.width * 0.6,
                                                                child: Text(
                                                                  (data[index].user!.name == null) ? "" : data[index].user!.name!,
                                                                  style: TextStyle(
                                                                    color: Constant.black,
                                                                    fontSize: 15,
                                                                    fontFamily: 'Poppins_Bold',
                                                                  ),
                                                                ),
                                                              ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          "# " + data[index].id!.toString(),
                                                          style: TextStyle(
                                                            color: Constant.lightGrey,
                                                            fontSize: 15,
                                                            fontFamily: 'Poppins',
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    // Text(
                                                    //   data[index].address!.name ?? "",
                                                    //   style: TextStyle(
                                                    //     color: Constant.lightGrey,
                                                    //     fontSize: 12,
                                                    //     fontFamily: 'Poppins',
                                                    //   ),
                                                    // )
                                                  ],
                                                ),
                                                // Container(
                                                //   width: 50,
                                                //   child: Text(
                                                //     (data[index]
                                                //                 .statusTiming!
                                                //                 .length ==
                                                //             0)
                                                //         ? ""
                                                //         : DateFormat('kk:mm').format(
                                                //             data[index]
                                                //                 .statusTiming![0]
                                                //                 .time!),
                                                //     style: TextStyle(
                                                //       color: Constant.black,
                                                //       fontSize: 13,
                                                //       fontFamily: 'Poppins_Bold',
                                                //     ),
                                                //   ),
                                                // )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: MediaQuery.of(context).size.width * 0.85,
                                              decoration: BoxDecoration(
                                                color: Constant.white,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.zero,
                                                  topRight: Radius.zero,
                                                  bottomLeft: Radius.circular(20.0),
                                                  bottomRight: Radius.circular(20.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    (index == 0)
                                                        ? Padding(
                                                            padding: const EdgeInsets.only(left: 35.0),
                                                            child: Text(
                                                              "",
                                                              style: TextStyle(
                                                                color: Constant.black,
                                                                fontSize: 13,
                                                                fontFamily: 'Poppins',
                                                              ),
                                                            ),
                                                          )
                                                        : Container(),
                                                    ListView.builder(
                                                        shrinkWrap: true,
                                                        physics: NeverScrollableScrollPhysics(),
                                                        itemCount: data[index].items!.length,
                                                        // itemCount: (index == 0)
                                                        //     ? TakeAway.length
                                                        //     : Delivery.length,
                                                        itemBuilder: (BuildContext context, int indexx) {
                                                          return Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  InkWell(
                                                                    child: Container(
                                                                      width: MediaQuery.of(context).size.width * 0.08,
                                                                      child: Center(
                                                                        child: Text(
                                                                          data[index].items![indexx].quantity!.toString(),
                                                                          style: TextStyle(
                                                                            color: Constant.black,
                                                                            fontSize: 15,
                                                                            fontFamily: 'Poppins',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: MediaQuery.of(context).size.width * 0.52,
                                                                    child: Text(
                                                                      data[index].items![indexx].productName!,
                                                                      maxLines: 3,
                                                                      overflow: TextOverflow.ellipsis,
                                                                      style: TextStyle(
                                                                        color: Constant.black,
                                                                        fontSize: 15,
                                                                        fontFamily: 'Poppins',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: MediaQuery.of(context).size.width * 0.15,
                                                                    child: Text(
                                                                      "${Constant.currencySign} " + data[index].items![indexx].discountPrice!.toString(),
                                                                      style: TextStyle(
                                                                        color: Constant.black,
                                                                        fontSize: 15,
                                                                        fontFamily: 'Poppins',
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 8,
                                                              )
                                                            ],
                                                          );
                                                        }),
                                                    SizedBox(
                                                      height: 1,
                                                    ),
                                                    Divider(
                                                      color: Constant.blueShadowBackground,
                                                      thickness: 1,
                                                      indent: 10,
                                                      endIndent: 10,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Total Bill",
                                                          ),
                                                          Text(
                                                            "${Constant.currencySign} " +
                                                                data[index]
                                                                    .totalPrice!
                                                                    // .grandTotal!
                                                                    .toStringAsFixed(0),
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                      color: Constant.blueShadowBackground,
                                                      thickness: 1,
                                                      indent: 10,
                                                      endIndent: 10,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          (data[index].orderStatus == "CANCELLED")
                                                              ? Container(
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                                                    color: Constant.blueShadowBackground,
                                                                  ),
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.all(12.0),
                                                                    child: InkWell(
                                                                      onTap: () {},
                                                                      child: Text(
                                                                        "Cancelled ",
                                                                        style: TextStyle(color: Constant.errorColor, fontSize: 13, fontFamily: 'Poppins-bold', fontWeight: FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              : Container(
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                                                    color: Constant.blueShadowBackground,
                                                                  ),
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.all(12.0),
                                                                    child: InkWell(
                                                                      onTap: () {
                                                                        if (data[index].orderStatus != "DELIVERED") {
                                                                          orderController.modifyOrder[index] = !orderController.modifyOrder[index];
                                                                        }
                                                                      },
                                                                      child: Text(
                                                                        (data[index].orderStatus == "DELIVERED") ? "Delivered" : "Modify Order ",
                                                                        style:
                                                                            TextStyle(color: (data[index].orderStatus == "DELIVERED") ? Constant.secondaryColor : Constant.black, fontSize: 13, fontFamily: 'Poppins-bold', fontWeight: FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                          (data[index].orderStatus == "CANCELLED")
                                                              ? Container()
                                                              : Container(
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                                                    color: (data[index].orderStatus == "DELIVERED") ? Constant.white : Constant.blueShadowBackground,
                                                                  ),
                                                                  child: (data[index].orderStatus == "DELIVERED")
                                                                      ? Container()
                                                                      : Padding(
                                                                          padding: const EdgeInsets.all(12.0),
                                                                          child: InkWell(
                                                                            onTap: () {},
                                                                            child: Text(
                                                                              "OTP ${orderController.orderList[index].pickupOtp!}",
                                                                              style: TextStyle(color: Constant.black, fontSize: 13, fontFamily: 'Poppins-bold', fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                ),
                                                          // Text(
                                                          //   "Order Ready",
                                                          //   style: TextStyle(
                                                          //       color: Constant
                                                          //           .black,
                                                          //       fontSize: 13,
                                                          //       fontFamily:
                                                          //       'Poppins-bold',
                                                          //       fontWeight:
                                                          //       FontWeight
                                                          //           .bold),
                                                          // ),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.all(Radius.circular(20)),
                                                              color: Constant.blueShadowBackground,
                                                            ),
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(12.0),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  orderController.more[index] = !orderController.more[index];
                                                                },
                                                                child: Text(
                                                                  'More',
                                                                  style: TextStyle(color: Constant.black, fontSize: 13, fontFamily: 'Poppins-bold', fontWeight: FontWeight.bold),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    // SizedBox(
                                                    //   height: 10,
                                                    // ),
                                                    // Container(
                                                    //     padding:
                                                    //     EdgeInsets.fromLTRB(
                                                    //         10, 2, 10, 10),
                                                    //     child: Column(
                                                    //         mainAxisAlignment:
                                                    //         MainAxisAlignment
                                                    //             .end,
                                                    //         crossAxisAlignment:
                                                    //         CrossAxisAlignment
                                                    //             .start,
                                                    //         children: [
                                                    //           SizedBox(
                                                    //             height: MediaQuery
                                                    //                 .of(
                                                    //                 context)
                                                    //                 .size
                                                    //                 .height *
                                                    //                 0.02,
                                                    //           ),
                                                    //           (data[index]
                                                    //               .orderStatus.toString() ==
                                                    //               "CANCELLED")
                                                    //               ? Center(
                                                    //             child:
                                                    //             Padding(
                                                    //               padding:
                                                    //               const EdgeInsets
                                                    //                   .only(
                                                    //                   bottom: 12.0),
                                                    //               child:
                                                    //               Text(
                                                    //                 "Order rejected by operator",
                                                    //                 style: TextStyle(
                                                    //                     fontSize: 18,
                                                    //                     color: Colors
                                                    //                         .orange),
                                                    //               ),
                                                    //             ),
                                                    //           )
                                                    //               : Row(
                                                    //             mainAxisAlignment:
                                                    //             MainAxisAlignment
                                                    //                 .spaceBetween,
                                                    //             children: [
                                                    //               Container(
                                                    //                 width:
                                                    //                 MediaQuery
                                                    //                     .of(context)
                                                    //                     .size
                                                    //                     .width *
                                                    //                     0.1,
                                                    //                 height:
                                                    //                 80,
                                                    //                 child:
                                                    //                 Column(
                                                    //                   mainAxisAlignment:
                                                    //                   MainAxisAlignment
                                                    //                       .start,
                                                    //                   children: [
                                                    //                     if (data[index]
                                                    //                         .orderStatus!.toString() ==
                                                    //                         "PLACED" ||
                                                    //                         data[index]
                                                    //                             .orderStatus.toString() ==
                                                    //                             "ACCEPTED" ||
                                                    //                         data[index]
                                                    //                             .orderStatus.toString() ==
                                                    //                             "ASSIGNED" ||
                                                    //                         data[index]
                                                    //                             .orderStatus.toString() ==
                                                    //                             "REACHED" ||
                                                    //                         data[index]
                                                    //                             .orderStatus.toString() ==
                                                    //                             "PICKEDUP" ||
                                                    //                         data[index]
                                                    //                             .orderStatus.toString() ==
                                                    //                             "DELIVERED")
                                                    //                       Container(
                                                    //                         height: 25,
                                                    //                         width: 25,
                                                    //                         child: Icon(
                                                    //                           Icons
                                                    //                               .check,
                                                    //                           color: Colors
                                                    //                               .green,
                                                    //                         ),
                                                    //                       )
                                                    //                     else
                                                    //                       ClipRRect(
                                                    //                           borderRadius: BorderRadius
                                                    //                               .circular(
                                                    //                               20.0),
                                                    //                           child: Container(
                                                    //                             height: 25,
                                                    //                             width: 25,
                                                    //                             color: Constant
                                                    //                                 .lightGrey,
                                                    //                             child: Text(
                                                    //                               "1",
                                                    //                               style: TextStyle(
                                                    //                                   color: Constant
                                                    //                                       .white),
                                                    //                             ),
                                                    //                           )),
                                                    //                     SizedBox(
                                                    //                       height: MediaQuery
                                                    //                           .of(
                                                    //                           context)
                                                    //                           .size
                                                    //                           .height *
                                                    //                           0.01,
                                                    //                     ),
                                                    //                     Container(
                                                    //                       child: Center(
                                                    //                         child: Column(
                                                    //                           children: [
                                                    //                             Text(
                                                    //                               "Placed",
                                                    //                               style: TextStyle(
                                                    //                                   color: Constant
                                                    //                                       .primaryColor,
                                                    //                                   fontSize: 8),
                                                    //                             ),
                                                    //                             Container(
                                                    //                               height: 18,
                                                    //                               child: ListView
                                                    //                                   .builder(
                                                    //                                   padding: const EdgeInsets
                                                    //                                       .all(
                                                    //                                       0),
                                                    //                                   physics: NeverScrollableScrollPhysics(),
                                                    //                                   itemCount: data[index]
                                                    //                                       .statusTiming!
                                                    //                                       .length,
                                                    //                                   itemBuilder: (
                                                    //                                       BuildContext context,
                                                    //                                       int timeindex) {
                                                    //                                     return (data[index]
                                                    //                                         .orderStatus ==
                                                    //                                         "PLACED")
                                                    //                                         ? Column(
                                                    //                                       children: [
                                                    //                                         Text(
                                                    //                                           DateFormat(
                                                    //                                               'yyyy-MM-dd')
                                                    //                                               .format(
                                                    //                                               data[index]
                                                    //                                                   .statusTiming![timeindex]
                                                    //                                                   .time!),
                                                    //                                           style: TextStyle(
                                                    //                                               color: Constant
                                                    //                                                   .primaryColor,
                                                    //                                               fontSize: 5),
                                                    //                                         ),
                                                    //                                         Text(
                                                    //                                           DateFormat(
                                                    //                                               'kk:mm')
                                                    //                                               .format(
                                                    //                                               data[index]
                                                    //                                                   .statusTiming![timeindex]
                                                    //                                                   .time!),
                                                    //                                           style: TextStyle(
                                                    //                                               color: Constant
                                                    //                                                   .primaryColor,
                                                    //                                               fontSize: 5),
                                                    //                                         ),
                                                    //                                       ],
                                                    //                                     )
                                                    //                                         : Container();
                                                    //                                   }),
                                                    //                             ),
                                                    //                           ],
                                                    //                         ),
                                                    //                       ),
                                                    //                     )
                                                    //                   ],
                                                    //                 ),
                                                    //               ),
                                                    //               Container(
                                                    //                 width:
                                                    //                 MediaQuery
                                                    //                     .of(context)
                                                    //                     .size
                                                    //                     .width *
                                                    //                     0.1,
                                                    //                 height:
                                                    //                 80,
                                                    //                 child:
                                                    //                 Column(
                                                    //                   mainAxisAlignment:
                                                    //                   MainAxisAlignment
                                                    //                       .start,
                                                    //                   //crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    //                   children: [
                                                    //                     if (data[index]
                                                    //                         .orderStatus ==
                                                    //                         "ACCEPTED" ||
                                                    //                         data[index]
                                                    //                             .orderStatus ==
                                                    //                             "PREPARING" ||
                                                    //                         data[index]
                                                    //                             .orderStatus ==
                                                    //                             "FOOD READY" ||
                                                    //                         data[index]
                                                    //                             .orderStatus ==
                                                    //                             "PICKEDUP" ||
                                                    //                         data[index]
                                                    //                             .orderStatus ==
                                                    //                             "DELIVERED")
                                                    //                       Container(
                                                    //                         height: 25,
                                                    //                         width: 25,
                                                    //                         child: Icon(
                                                    //                           Icons
                                                    //                               .check,
                                                    //                           color: Colors
                                                    //                               .green,
                                                    //                         ),
                                                    //                       )
                                                    //                     else
                                                    //                       ClipRRect(
                                                    //                           borderRadius: BorderRadius
                                                    //                               .circular(
                                                    //                               20.0),
                                                    //                           child: Container(
                                                    //                             height: 25,
                                                    //                             width: 25,
                                                    //                             color: Constant
                                                    //                                 .lightGrey,
                                                    //                             child: Center(
                                                    //                               child: Text(
                                                    //                                 "2",
                                                    //                                 style: TextStyle(
                                                    //                                     color: Constant
                                                    //                                         .white),
                                                    //                               ),
                                                    //                             ),
                                                    //                           )),
                                                    //                     SizedBox(
                                                    //                       height: MediaQuery
                                                    //                           .of(
                                                    //                           context)
                                                    //                           .size
                                                    //                           .height *
                                                    //                           0.01,
                                                    //                     ),
                                                    //                     Text(
                                                    //                       "Accepted",
                                                    //                       style: TextStyle(
                                                    //                           color: Constant
                                                    //                               .primaryColor,
                                                    //                           fontSize: 8),
                                                    //                     ),
                                                    //                     Container(
                                                    //                       height: 18,
                                                    //                       child: ListView
                                                    //                           .builder(
                                                    //                           physics: NeverScrollableScrollPhysics(),
                                                    //                           padding: const EdgeInsets
                                                    //                               .all(
                                                    //                               0),
                                                    //                           itemCount: data[index]
                                                    //                               .statusTiming!
                                                    //                               .length,
                                                    //                           itemBuilder: (
                                                    //                               BuildContext context,
                                                    //                               int timeindex) {
                                                    //                             return (data[index]
                                                    //                                 .orderStatus ==
                                                    //                                 "ACCEPTED")
                                                    //                                 ? Column(
                                                    //                               children: [
                                                    //                                 Text(
                                                    //                                   DateFormat(
                                                    //                                       'yyyy-MM-dd')
                                                    //                                       .format(
                                                    //                                       data[index]
                                                    //                                           .statusTiming![timeindex]
                                                    //                                           .time!),
                                                    //                                   style: TextStyle(
                                                    //                                       color: Constant
                                                    //                                           .primaryColor,
                                                    //                                       fontSize: 5),
                                                    //                                 ),
                                                    //                                 Text(
                                                    //                                   DateFormat(
                                                    //                                       'kk:mm')
                                                    //                                       .format(
                                                    //                                       data[index]
                                                    //                                           .statusTiming![timeindex]
                                                    //                                           .time!),
                                                    //                                   style: TextStyle(
                                                    //                                       color: Constant
                                                    //                                           .primaryColor,
                                                    //                                       fontSize: 5),
                                                    //                                 ),
                                                    //                               ],
                                                    //                             )
                                                    //                                 : Container();
                                                    //                           }),
                                                    //                     ),
                                                    //                   ],
                                                    //                 ),
                                                    //               ),
                                                    //               Container(
                                                    //                 width:
                                                    //                 MediaQuery
                                                    //                     .of(context)
                                                    //                     .size
                                                    //                     .width *
                                                    //                     0.1,
                                                    //                 height:
                                                    //                 80,
                                                    //                 child:
                                                    //                 Column(
                                                    //                   mainAxisAlignment:
                                                    //                   MainAxisAlignment
                                                    //                       .start,
                                                    //                   children: [
                                                    //                     if (data[index]
                                                    //                         .orderStatus ==
                                                    //                         "PREPARING" ||
                                                    //                         data[index]
                                                    //                             .orderStatus ==
                                                    //                             "FOOD READY" ||
                                                    //                         data[index]
                                                    //                             .orderStatus ==
                                                    //                             "PICKEDUP" ||
                                                    //                         data[index]
                                                    //                             .orderStatus ==
                                                    //                             "DELIVERED")
                                                    //                       Container(
                                                    //                         height: 25,
                                                    //                         width: 25,
                                                    //                         child: Icon(
                                                    //                           Icons
                                                    //                               .check,
                                                    //                           color: Colors
                                                    //                               .green,
                                                    //                         ),
                                                    //                       )
                                                    //                     else
                                                    //                       ClipRRect(
                                                    //                           borderRadius: BorderRadius
                                                    //                               .circular(
                                                    //                               20.0),
                                                    //                           child: Container(
                                                    //                             height: 25,
                                                    //                             width: 25,
                                                    //                             color: Constant
                                                    //                                 .lightGrey,
                                                    //                             child: Center(
                                                    //                               child: Text(
                                                    //                                 "3",
                                                    //                                 style: TextStyle(
                                                    //                                     color: Constant
                                                    //                                         .white),
                                                    //                               ),
                                                    //                             ),
                                                    //                           )),
                                                    //                     SizedBox(
                                                    //                       height: MediaQuery
                                                    //                           .of(
                                                    //                           context)
                                                    //                           .size
                                                    //                           .height *
                                                    //                           0.01,
                                                    //                     ),
                                                    //                     Text(
                                                    //                       "Preparing",
                                                    //                       style: TextStyle(
                                                    //                           color: Constant
                                                    //                               .primaryColor,
                                                    //                           fontSize: 8),
                                                    //                     ),
                                                    //                     Container(
                                                    //                       height: 18,
                                                    //                       child: ListView
                                                    //                           .builder(
                                                    //                           padding: const EdgeInsets
                                                    //                               .all(
                                                    //                               0),
                                                    //                           physics: NeverScrollableScrollPhysics(),
                                                    //                           itemCount: data[index]
                                                    //                               .statusTiming!
                                                    //                               .length,
                                                    //                           itemBuilder: (
                                                    //                               BuildContext context,
                                                    //                               int timeindex) {
                                                    //                             return (data[index]
                                                    //                                 .orderStatus ==
                                                    //                                 "PREPARING")
                                                    //                                 ? Column(
                                                    //                               children: [
                                                    //                                 Text(
                                                    //                                   DateFormat(
                                                    //                                       'yyyy-MM-dd')
                                                    //                                       .format(
                                                    //                                       data[index]
                                                    //                                           .statusTiming![timeindex]
                                                    //                                           .time!),
                                                    //                                   style: TextStyle(
                                                    //                                       color: Constant
                                                    //                                           .primaryColor,
                                                    //                                       fontSize: 5),
                                                    //                                 ),
                                                    //                                 Text(
                                                    //                                   DateFormat(
                                                    //                                       'kk:mm')
                                                    //                                       .format(
                                                    //                                       data[index]
                                                    //                                           .statusTiming![timeindex]
                                                    //                                           .time!),
                                                    //                                   style: TextStyle(
                                                    //                                       color: Constant
                                                    //                                           .primaryColor,
                                                    //                                       fontSize: 5),
                                                    //                                 ),
                                                    //                               ],
                                                    //                             )
                                                    //                                 : Container();
                                                    //                           }),
                                                    //                     ),
                                                    //                   ],
                                                    //                 ),
                                                    //               ),
                                                    //               Container(
                                                    //                 width:
                                                    //                 MediaQuery
                                                    //                     .of(context)
                                                    //                     .size
                                                    //                     .width *
                                                    //                     0.1,
                                                    //                 height:
                                                    //                 80,
                                                    //                 child:
                                                    //                 Column(
                                                    //                   mainAxisAlignment:
                                                    //                   MainAxisAlignment
                                                    //                       .start,
                                                    //                   children: [
                                                    //                     if (data[index]
                                                    //                         .orderStatus ==
                                                    //                         "FOOD READY" ||
                                                    //                         data[index]
                                                    //                             .orderStatus ==
                                                    //                             "PICKEDUP" ||
                                                    //                         data[index]
                                                    //                             .orderStatus ==
                                                    //                             "DELIVERED")
                                                    //                       Container(
                                                    //                         height: 25,
                                                    //                         width: 25,
                                                    //                         child: Icon(
                                                    //                           Icons
                                                    //                               .check,
                                                    //                           color: Colors
                                                    //                               .green,
                                                    //                         ),
                                                    //                       )
                                                    //                     else
                                                    //                       ClipRRect(
                                                    //                           borderRadius: BorderRadius
                                                    //                               .circular(
                                                    //                               20.0),
                                                    //                           child: Container(
                                                    //                             height: 25,
                                                    //                             width: 25,
                                                    //                             color: Constant
                                                    //                                 .lightGrey,
                                                    //                             child: Center(
                                                    //                               child: Text(
                                                    //                                 "4",
                                                    //                                 style: TextStyle(
                                                    //                                     color: Constant
                                                    //                                         .white),
                                                    //                               ),
                                                    //                             ),
                                                    //                           )),
                                                    //                     SizedBox(
                                                    //                       height: MediaQuery
                                                    //                           .of(
                                                    //                           context)
                                                    //                           .size
                                                    //                           .height *
                                                    //                           0.01,
                                                    //                     ),
                                                    //                     Text(
                                                    //                       "Food Ready",
                                                    //                       textAlign: TextAlign
                                                    //                           .center,
                                                    //                       style: TextStyle(
                                                    //                           color: Constant
                                                    //                               .primaryColor,
                                                    //                           fontSize: 8),
                                                    //                     ),
                                                    //                     Container(
                                                    //                       height: 18,
                                                    //                       child: ListView
                                                    //                           .builder(
                                                    //                           padding: const EdgeInsets
                                                    //                               .all(
                                                    //                               0),
                                                    //                           itemCount: data[index]
                                                    //                               .statusTiming!
                                                    //                               .length,
                                                    //                           physics: NeverScrollableScrollPhysics(),
                                                    //                           itemBuilder: (
                                                    //                               BuildContext context,
                                                    //                               int timeindex) {
                                                    //                             return (data[index]
                                                    //                                 .orderStatus ==
                                                    //                                 "FOOD READY")
                                                    //                                 ? Column(
                                                    //                               children: [
                                                    //                                 Text(
                                                    //                                   DateFormat(
                                                    //                                       'yyyy-MM-dd')
                                                    //                                       .format(
                                                    //                                       data[index]
                                                    //                                           .statusTiming![timeindex]
                                                    //                                           .time!),
                                                    //                                   style: TextStyle(
                                                    //                                       color: Constant
                                                    //                                           .primaryColor,
                                                    //                                       fontSize: 5),
                                                    //                                 ),
                                                    //                                 Text(
                                                    //                                   DateFormat(
                                                    //                                       'kk:mm')
                                                    //                                       .format(
                                                    //                                       data[index]
                                                    //                                           .statusTiming![timeindex]
                                                    //                                           .time!),
                                                    //                                   style: TextStyle(
                                                    //                                       color: Constant
                                                    //                                           .primaryColor,
                                                    //                                       fontSize: 5),
                                                    //                                 ),
                                                    //                               ],
                                                    //                             )
                                                    //                                 : Container();
                                                    //                           }),
                                                    //                     ),
                                                    //                   ],
                                                    //                 ),
                                                    //               ),
                                                    //               Container(
                                                    //                 width:
                                                    //                 MediaQuery
                                                    //                     .of(context)
                                                    //                     .size
                                                    //                     .width *
                                                    //                     0.1,
                                                    //                 height:
                                                    //                 80,
                                                    //                 child:
                                                    //                 Column(
                                                    //                   mainAxisAlignment:
                                                    //                   MainAxisAlignment
                                                    //                       .start,
                                                    //                   children: [
                                                    //                     if (data[index]
                                                    //                         .orderStatus ==
                                                    //                         "PICKEDUP" ||
                                                    //                         data[index]
                                                    //                             .orderStatus ==
                                                    //                             "DELIVERED")
                                                    //                       Container(
                                                    //                         height: 25,
                                                    //                         width: 25,
                                                    //                         child: Icon(
                                                    //                           Icons
                                                    //                               .check,
                                                    //                           color: Colors
                                                    //                               .green,
                                                    //                         ),
                                                    //                       )
                                                    //                     else
                                                    //                       ClipRRect(
                                                    //                           borderRadius: BorderRadius
                                                    //                               .circular(
                                                    //                               20.0),
                                                    //                           child: Container(
                                                    //                             height: 25,
                                                    //                             width: 25,
                                                    //                             color: Constant
                                                    //                                 .lightGrey,
                                                    //                             child: Center(
                                                    //                               child: Text(
                                                    //                                 "5",
                                                    //                                 style: TextStyle(
                                                    //                                     color: Constant
                                                    //                                         .white),
                                                    //                               ),
                                                    //                             ),
                                                    //                           )),
                                                    //                     SizedBox(
                                                    //                       height: MediaQuery
                                                    //                           .of(
                                                    //                           context)
                                                    //                           .size
                                                    //                           .height *
                                                    //                           0.01,
                                                    //                     ),
                                                    //                     Text(
                                                    //                       "Pickedup",
                                                    //                       style: TextStyle(
                                                    //                           color: Constant
                                                    //                               .primaryColor,
                                                    //                           fontSize: 8),
                                                    //                     ),
                                                    //                     Container(
                                                    //                       height: 18,
                                                    //                       child: ListView
                                                    //                           .builder(
                                                    //                           padding: const EdgeInsets
                                                    //                               .all(
                                                    //                               0),
                                                    //                           physics: NeverScrollableScrollPhysics(),
                                                    //                           itemCount: data[index]
                                                    //                               .statusTiming!
                                                    //                               .length,
                                                    //                           itemBuilder: (
                                                    //                               BuildContext context,
                                                    //                               int timeindex) {
                                                    //                             return (data[index]
                                                    //                                 .orderStatus ==
                                                    //                                 "PICKEDUP")
                                                    //                                 ? Column(
                                                    //                               children: [
                                                    //                                 Text(
                                                    //                                   DateFormat(
                                                    //                                       'yyyy-MM-dd')
                                                    //                                       .format(
                                                    //                                       data[index]
                                                    //                                           .statusTiming![timeindex]
                                                    //                                           .time!),
                                                    //                                   style: TextStyle(
                                                    //                                       color: Constant
                                                    //                                           .primaryColor,
                                                    //                                       fontSize: 5),
                                                    //                                 ),
                                                    //                                 Text(
                                                    //                                   DateFormat(
                                                    //                                       'kk:mm')
                                                    //                                       .format(
                                                    //                                       data[index]
                                                    //                                           .statusTiming![timeindex]
                                                    //                                           .time!),
                                                    //                                   style: TextStyle(
                                                    //                                       color: Constant
                                                    //                                           .primaryColor,
                                                    //                                       fontSize: 5),
                                                    //                                 ),
                                                    //                               ],
                                                    //                             )
                                                    //                                 : Container();
                                                    //                           }),
                                                    //                     ),
                                                    //                   ],
                                                    //                 ),
                                                    //               ),
                                                    //               Container(
                                                    //                 width:
                                                    //                 MediaQuery
                                                    //                     .of(context)
                                                    //                     .size
                                                    //                     .width *
                                                    //                     0.1,
                                                    //                 height:
                                                    //                 80,
                                                    //                 child:
                                                    //                 Column(
                                                    //                   mainAxisAlignment:
                                                    //                   MainAxisAlignment
                                                    //                       .start,
                                                    //                   children: [
                                                    //                     if (data[index]
                                                    //                         .orderStatus ==
                                                    //                         "DELIVERED")
                                                    //                       Container(
                                                    //                         height: 25,
                                                    //                         width: 25,
                                                    //                         child: Icon(
                                                    //                           Icons
                                                    //                               .check,
                                                    //                           color: Colors
                                                    //                               .green,
                                                    //                         ),
                                                    //                       )
                                                    //                     else
                                                    //                       ClipRRect(
                                                    //                           borderRadius: BorderRadius
                                                    //                               .circular(
                                                    //                               20.0),
                                                    //                           child: Container(
                                                    //                             height: 25,
                                                    //                             width: 25,
                                                    //                             color: Constant
                                                    //                                 .lightGrey,
                                                    //                             child: Center(
                                                    //                               child: Text(
                                                    //                                 "6",
                                                    //                                 style: TextStyle(
                                                    //                                     color: Constant
                                                    //                                         .white),
                                                    //                               ),
                                                    //                             ),
                                                    //                           )),
                                                    //                     SizedBox(
                                                    //                       height: MediaQuery
                                                    //                           .of(
                                                    //                           context)
                                                    //                           .size
                                                    //                           .height *
                                                    //                           0.01,
                                                    //                     ),
                                                    //                     Text(
                                                    //                       "Delivered",
                                                    //                       style: TextStyle(
                                                    //                           color: Constant
                                                    //                               .primaryColor,
                                                    //                           fontSize: 8),
                                                    //                     ),
                                                    //                     Container(
                                                    //                       height: 18,
                                                    //                       child: ListView
                                                    //                           .builder(
                                                    //                           padding: const EdgeInsets
                                                    //                               .all(
                                                    //                               0),
                                                    //                           physics: NeverScrollableScrollPhysics(),
                                                    //                           itemCount: data[index]
                                                    //                               .statusTiming!
                                                    //                               .length,
                                                    //                           itemBuilder: (
                                                    //                               BuildContext context,
                                                    //                               int timeindex) {
                                                    //                             return (data[index]
                                                    //                                 .orderStatus ==
                                                    //                                 "DELIVERED")
                                                    //                                 ? Column(
                                                    //                               children: [
                                                    //                                 Text(
                                                    //                                   DateFormat(
                                                    //                                       'yyyy-MM-dd')
                                                    //                                       .format(
                                                    //                                       data[index]
                                                    //                                           .statusTiming![timeindex]
                                                    //                                           .time!),
                                                    //                                   style: TextStyle(
                                                    //                                       color: Constant
                                                    //                                           .primaryColor,
                                                    //                                       fontSize: 5),
                                                    //                                 ),
                                                    //                                 Text(
                                                    //                                   DateFormat(
                                                    //                                       'kk:mm')
                                                    //                                       .format(
                                                    //                                       data[index]
                                                    //                                           .statusTiming![timeindex]
                                                    //                                           .time!),
                                                    //                                   style: TextStyle(
                                                    //                                       color: Constant
                                                    //                                           .primaryColor,
                                                    //                                       fontSize: 5),
                                                    //                                 ),
                                                    //                               ],
                                                    //                             )
                                                    //                                 : Container();
                                                    //                           }),
                                                    //                     ),
                                                    //                   ],
                                                    //                 ),
                                                    //               ),
                                                    //             ],
                                                    //           )
                                                    //         ])),
                                                    // SizedBox(
                                                    //   height: 5,
                                                    // )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          (data[index].jsonData != null)
                                              ? (data[index].jsonData["any_instruction"] != "")
                                                  ? Padding(
                                                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                                                      child: orderDetials(context, data[index].jsonData["any_instruction"]),
                                                    )
                                                  : Container()
                                              : Container(),
                                          (orderController.more[index])
                                              ? SizedBox(
                                                  height: 20,
                                                )
                                              : Container(),
                                          (orderController.more[index])
                                              ? Container(
                                                  child: Padding(
                                                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                                                  child: (data[index].user == null)
                                                      ? Container()
                                                      : Column(
                                                          children: [
                                                            (data[index].driver == null)
                                                                ? Container()
                                                                : (!data[index].driver.containsKey("name") && !data[index].driver.containsKey("phone"))
                                                                    ? Container()
                                                                    : driverDetails(data[index].driver["mobile"], data[index].driver["name"]),

                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            //
                                                            // (!data[index].driver.containsKey("name"))?Container():Row(
                                                            //   mainAxisAlignment:
                                                            //   MainAxisAlignment
                                                            //       .spaceBetween,
                                                            //   crossAxisAlignment:
                                                            //   CrossAxisAlignment
                                                            //       .start,
                                                            //   children: [
                                                            //     Container(
                                                            //       width: MediaQuery
                                                            //           .of(
                                                            //           context)
                                                            //           .size
                                                            //           .width *
                                                            //           0.25,
                                                            //       child: Text(
                                                            //         "Driver Name : ",
                                                            //         style: TextStyle(
                                                            //           fontWeight:
                                                            //           FontWeight
                                                            //               .bold,
                                                            //         ),
                                                            //       ),
                                                            //     ),
                                                            //     Container(
                                                            //       width: MediaQuery
                                                            //           .of(
                                                            //           context)
                                                            //           .size
                                                            //           .width *
                                                            //           0.5,
                                                            //       child: Text(
                                                            //         (data[index].driver["name"] == null)?"":data[index].driver["name"],
                                                            //       ),
                                                            //     )
                                                            //   ],
                                                            // ),
                                                            // (!data[index].driver.containsKey("phone"))?Container():SizedBox(
                                                            //   height: 5,
                                                            // ),
                                                            //
                                                            // (data[index].driver["mobile"] == null)?Container():Row(
                                                            //   mainAxisAlignment:
                                                            //   MainAxisAlignment
                                                            //       .spaceBetween,
                                                            //   crossAxisAlignment:
                                                            //   CrossAxisAlignment
                                                            //       .start,
                                                            //   children: [
                                                            //     Container(
                                                            //       width: MediaQuery
                                                            //           .of(
                                                            //           context)
                                                            //           .size
                                                            //           .width *
                                                            //           0.25,
                                                            //       child: Text(
                                                            //         "Driver Phone : ",
                                                            //         style: TextStyle(
                                                            //           fontWeight:
                                                            //           FontWeight
                                                            //               .bold,
                                                            //         ),
                                                            //       ),
                                                            //     ),
                                                            //     Container(
                                                            //       width: MediaQuery
                                                            //           .of(
                                                            //           context)
                                                            //           .size
                                                            //           .width *
                                                            //           0.5,
                                                            //       child: Text(
                                                            //         (data[index].driver["mobile"] == null)?"":data[index].driver["mobile"],
                                                            //       ),
                                                            //     )
                                                            //   ],
                                                            // ),
                                                            // (data[index].driver["mobile"] == null)?Container():SizedBox(
                                                            //   height: 5,
                                                            // ),

                                                            (data[index].user != null) ? customerDetails(context, data[index].user!.name ?? "-", data[index].user!.mobile ?? "", data[index].deliveryAddress!.address ?? "") : Container()
                                                          ],
                                                        ),
                                                ))
                                              : Container(),
                                          (orderController.modifyOrder[index])
                                              ? SizedBox(
                                                  height: 20,
                                                )
                                              : Container(),
                                          (orderController.modifyOrder[index])
                                              ? ((data[index].orderStatus == "DELIVERED" || data[index].orderStatus == "CANCELLED"))
                                                  ? Container()
                                                  : Container(
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 28.0, right: 28),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                          children: [
                                                            DropdownButton<String>(
                                                              value: orderController.status.value,
                                                              icon: const Icon(Icons.arrow_drop_down),
                                                              iconSize: 20,
                                                              elevation: 16,
                                                              style: const TextStyle(color: Colors.black),
                                                              underline: Container(
                                                                height: 2,
                                                                color: Constant.greyDark,
                                                              ),
                                                              onChanged: (String? newValue) {
                                                                orderController.status.value = newValue!;
                                                              },
                                                              items: <String>[
                                                                'ACCEPTED',
                                                                'PREPARED',
                                                                'CANCEL',
                                                              ].map<DropdownMenuItem<String>>((String value) {
                                                                return DropdownMenuItem<String>(
                                                                  value: value,
                                                                  child: Text(value),
                                                                );
                                                              }).toList(),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(context).size.width * 0.3,
                                                              height: 45,
                                                              child: CustomButton(
                                                                  title: "Modify Order",
                                                                  textColor: Constant.white,
                                                                  textStyle: TextStyle(fontSize: 20, letterSpacing: 1, fontWeight: FontWeight.bold, color: Constant.white, fontFamily: 'Poppins'),
                                                                  borderRadius: 25,
                                                                  //customPadding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                                                  backgroundColor: Constant.secondaryColor,
                                                                  onTap: () {
                                                                    if (orderController.status.value == "ACCEPTED") {
                                                                      showDialog(
                                                                        context: context,
                                                                        builder: (_) => SelectTimePopUp(orderController.orderList[index].id),
                                                                      );
                                                                    } else if (orderController.status.value == "PREPARED") {
                                                                      orderController.ModifyStoreOrderStatus(
                                                                        orderController.orderList[index].id!.toString(),
                                                                        "PREPARED",
                                                                        "-1",
                                                                      );
                                                                    } else if (orderController.status.value == "CANCEL") {
                                                                      orderController.ModifyStoreOrderStatus(
                                                                        orderController.orderList[index].id!.toString(),
                                                                        // "DELIVERED",
                                                                        "CANCELLED",
                                                                        "-1",
                                                                      );
                                                                    }

                                                                    // orderController
                                                                    //     .ModifyRestaurantOrderStatus(
                                                                    //     data[index]
                                                                    //         .id!,
                                                                    //     orderController
                                                                    //         .status
                                                                    //         .value);
                                                                  }),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                              : Container(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          (data[index].orderStatus == "FOOD READY")
                                              ? (controller.takeAwayVisible == true)
                                                  ? Container(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              color: Constant.black,
                                                              borderRadius: BorderRadius.circular(29),
                                                              border: Border.all(color: Constant.black),
                                                            ),
                                                            child: Padding(
                                                              padding: const EdgeInsets.only(left: 8.0, right: 8),
                                                              child: Text(
                                                                "Invoice",
                                                                style: TextStyle(color: Constant.white, fontSize: 13, fontFamily: 'Poppins-bold', fontWeight: FontWeight.bold),
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                  child: Wrap(
                                                                spacing: 5.0,
                                                                runSpacing: 5.0,
                                                                children: <Widget>[
                                                                  choiceChipWidget(Invoice),
                                                                ],
                                                              )),
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                  color: Constant.secondaryColor,
                                                                  borderRadius: BorderRadius.circular(29),
                                                                  border: Border.all(color: Constant.secondaryColor),
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsets.all(5),
                                                                  child: Text(
                                                                    "Settle",
                                                                    style: TextStyle(color: Constant.white, fontSize: 13, fontFamily: 'Poppins-bold', fontWeight: FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : Container(
                                                      height: 0,
                                                      width: 0,
                                                    )
                                              : (controller.DeliveryVisible == true)
                                                  ? Container(
                                                      child: Center(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                              width: MediaQuery.of(context).size.width * 0.6,
                                                              decoration: BoxDecoration(
                                                                color: Constant.white,
                                                                borderRadius: BorderRadius.circular(29),
                                                                border: Border.all(
                                                                  color: Constant.lightGrey,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                                                                    child: InkWell(
                                                                      onTap: () {
                                                                        print("minus");
                                                                        controller.decrement();
                                                                      },
                                                                      child: Icon(
                                                                        CupertinoIcons.minus,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    decoration: BoxDecoration(
                                                                      border: Border(
                                                                        right: BorderSide(width: 1.0, color: Constant.lightGrey),
                                                                        left: BorderSide(width: 1.0, color: Constant.lightGrey),
                                                                      ),
                                                                      color: Constant.blueShadowBackground,
                                                                    ),
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                                                                      child: Obx(() {
                                                                        return Text("${controller.minCount.value}" + " min");
                                                                      }),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                                                                    child: InkWell(
                                                                      onTap: () {
                                                                        print("plus");
                                                                        controller.increment();
                                                                      },
                                                                      child: Icon(
                                                                        Icons.add,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              )),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {},
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                    color: Constant.secondaryColor,
                                                                    borderRadius: BorderRadius.circular(29),
                                                                    border: Border.all(
                                                                      color: Constant.secondaryColor,
                                                                    ),
                                                                  ),
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.only(left: 18.0, right: 18, top: 8, bottom: 8),
                                                                    child: Text(
                                                                      "Accept",
                                                                      style: TextStyle(color: Constant.white, fontSize: 13, fontFamily: 'Poppins-bold', fontWeight: FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 20,
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {},
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                    color: Constant.secondaryColor,
                                                                    borderRadius: BorderRadius.circular(29),
                                                                    border: Border.all(
                                                                      color: Constant.secondaryColor,
                                                                    ),
                                                                  ),
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.only(left: 18.0, right: 18, top: 8, bottom: 8),
                                                                    child: Text(
                                                                      "Reject",
                                                                      style: TextStyle(color: Constant.white, fontSize: 13, fontFamily: 'Poppins-bold', fontWeight: FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ))
                                                  : Container(
                                                      height: 0,
                                                      width: 0,
                                                    )
                                        ],
                                      );
                                    }),
                                  ),
                                ),
                              )
                            : Container();
                      }),

              Center(
                child: Obx(
                  () => new Opacity(
                    opacity: orderController.isPageLoading!.value ? 1.0 : 00,
                    child: new CircularProgressIndicator(
                      color: Constant.greyBack,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget orderDetials(context, String instruction) {
    return Container(
        color: Constant.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order Instruction",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Instruction : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      instruction,
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  Widget customerDetails(context, String name, String phone, String address) {
    return Container(
        color: Constant.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Customer Detail",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Name : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      name,
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Phone : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      phone,
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Address : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      address,
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Widget driverDetails(String phone, String name) {
    return Container(
        color: Constant.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Driver Detail",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Name : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Phone : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    phone,
                    style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  static Future<void> openMap(String latitude, String longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}

class choiceChipWidget extends StatefulWidget {
  final List<String> reportList;

  choiceChipWidget(this.reportList);

  @override
  _choiceChipWidgetState createState() => new _choiceChipWidgetState();
}

class _choiceChipWidgetState extends State<choiceChipWidget> {
  String selectedChoice = "";

  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10.0, right: 30),
            child: ChoiceChip(
              label: Text(item),
              labelStyle: TextStyle(color: Colors.black, fontSize: 11.0, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              backgroundColor: Constant.white,
              selectedColor: Constant.secondaryColor,
              selected: selectedChoice == item,
              onSelected: (selected) {
                setState(() {
                  selectedChoice = item;
                });
              },
            ),
          ),
        ],
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
