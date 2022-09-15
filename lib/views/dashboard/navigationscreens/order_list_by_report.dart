import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/controllers/maincontroller.dart';
import 'package:sooooperbusiness/controllers/order/ordercontroller.dart';
import 'package:sooooperbusiness/controllers/order/processingOrderController.dart';
import 'package:sooooperbusiness/model/order/storeOrderData.dart';
import 'package:sooooperbusiness/views/components/custombutton.dart';

import 'order/orderProcessing/processing_order.dart';
import 'order/orderProcessing/selectTimePopup.dart';

class orderListByReport extends StatefulWidget {
  final status;
  orderListByReport(this.status);

  @override
  State<orderListByReport> createState() => _orderListByReportState();
}

class _orderListByReportState extends State<orderListByReport> {
  List<String> Invoice = [
    "Cash",
    "Card",
    "UPI",
  ];

  OrderController orderController = Get.put(OrderController());

  processingOrderController controller = Get.put(processingOrderController());

  MainController mainController = Get.put(MainController());

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
              (widget.status == "PLACED")
                  ?"Pending Orders"
                  :(widget.status == "CANCELLED")
                  ?"Cancelled Orders"
                  :(widget.status == "DELIVERED")
                  ?"Delivered Orders"
                  :"Ongoing Orders",
              style: TextStyle(
                fontSize: 16.0,
                color: Constant.black,
                fontFamily: 'Poppins_Bold',
              ),
            ),


          ),
        ),
        body: SingleChildScrollView(
          controller: orderController.scrollController2,
          child: Obx(() {
            return (widget.status == "ONGOING")
                ?Column(
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
                ):ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    reverse: false,
                    itemCount: (orderController.orderList.value == null)
                        ? 0 : orderController.orderList.value.length,
                    itemBuilder: (BuildContext context, int index) {
                      List<StoreOrderData> data = orderController.orderList.value;
                      return (data[index].orderStatus != "DELIVERED" && data[index].orderStatus != "CANCELLED" && data[index].orderStatus != "PLACED")
                          ? orderCard(context,data,index)
                          : Container();
                    }),
                Center(child: Obx(
                        () => new Opacity(
                      opacity: orderController.isPageLoading!.value
                          ? 1.0
                          : 00,
                      child: new CircularProgressIndicator(
                        color: Constant.greyBack,
                      ),
                    ),
                  ),),
                SizedBox(
                  height: 10,
                ),
              ],
            ) : Column(
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
                    reverse: false,
                    itemCount:
                    (orderController.orderList.value == null)
                        ? 0
                        : orderController.orderList.length,
                    itemBuilder: (BuildContext context, int index) {
                      List<StoreOrderData> data = orderController.orderList;
                      return (data[index].orderStatus == widget.status)
                          ? orderCard(context,data,index)
                          : Container();
                    }),
                Center(
                  child: Obx(
                        () => new Opacity(
                      opacity: orderController.isPageLoading!.value
                          ? 1.0
                          : 00,
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

  Widget orderCard(context,List<StoreOrderData> data,int index){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width:
        MediaQuery
            .of(context)
            .size
            .width * 0.9,
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
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              (data[index].user == null)?Container():Container(
                                width: MediaQuery.of(context).size.width*0.6,
                                child: Text(
                                  (data[index].user!.name == null)?"":"${data[index].user!.name!}",
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
                                "# "+data[index].id!.toString(),
                                style: TextStyle(
                                  color: Constant
                                      .lightGrey,
                                  fontSize: 15,
                                  fontFamily:
                                  'Poppins',
                                ),
                              ),
                            ],
                          ),

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
                    width: MediaQuery
                        .of(context)
                        .size
                        .width *
                        0.85,
                    decoration: BoxDecoration(
                      color: Constant.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.zero,
                        bottomLeft:
                        Radius.circular(20.0),
                        bottomRight:
                        Radius.circular(20.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                      const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          (index == 0)
                              ? Padding(
                            padding:
                            const EdgeInsets
                                .only(
                                left: 35.0),
                            child: Text(
                              "",
                              style: TextStyle(
                                color: Constant
                                    .black,
                                fontSize: 13,
                                fontFamily:
                                'Poppins',
                              ),
                            ),
                          )
                              : Container(),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: data[index]
                                  .items!
                                  .length,
                              // itemCount: (index == 0)
                              //     ? TakeAway.length
                              //     : Delivery.length,
                              itemBuilder:
                                  (BuildContext
                              context,
                                  int indexx) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                          child:
                                          Container(
                                            width: MediaQuery
                                                .of(
                                                context)
                                                .size
                                                .width *
                                                0.08,
                                            child:
                                            Center(
                                              child:
                                              Text(
                                                data[index]
                                                    .items![indexx]
                                                    .quantity!
                                                    .toString(),
                                                style:
                                                TextStyle(
                                                  color:
                                                  Constant
                                                      .black,
                                                  fontSize:
                                                  15,
                                                  fontFamily:
                                                  'Poppins',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width *
                                              0.52,
                                          child: Text(
                                            data[index]
                                                .items![
                                            indexx]
                                                .productName!,
                                            maxLines:
                                            3,
                                            overflow:
                                            TextOverflow
                                                .ellipsis,
                                            style:
                                            TextStyle(
                                              color: Constant
                                                  .black,
                                              fontSize:
                                              15,
                                              fontFamily:
                                              'Poppins',
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width *
                                              0.15,
                                          child: Text(
                                            "${Constant.currencySign} "+
                                                data[index]
                                                    .items![
                                                indexx]
                                                    .discountPrice!
                                                    .toString(),
                                            style:
                                            TextStyle(
                                              color: Constant
                                                  .black,
                                              fontSize:
                                              15,
                                              fontFamily:
                                              'Poppins',
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
                            color: Constant
                                .blueShadowBackground,
                            thickness: 1,
                            indent: 10,
                            endIndent: 10,
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(
                                left: 8.0,
                                right: 8),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Text(
                                  "Total Bill",
                                ),
                                Text(
                                  "${Constant.currencySign} "+
                                      data[index]
                                          .totalPrice
                                          .toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            color: Constant
                                .blueShadowBackground,
                            thickness: 1,
                            indent: 10,
                            endIndent: 10,
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(
                                left: 8.0,
                                right: 8),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                (data[index].orderStatus == "CANCELLED")
                                    ?Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    color: Constant.blueShadowBackground,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: InkWell(
                                      onTap: () {

                                      },
                                      child: Text(
                                        "Cancelled ",
                                        style: TextStyle(
                                            color: Constant
                                                .errorColor,
                                            fontSize: 13,
                                            fontFamily:
                                            'Poppins-bold',
                                            fontWeight:
                                            FontWeight
                                                .bold),
                                      ),
                                    ),
                                  ),
                                )
                                    :Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    color: Constant.blueShadowBackground,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: InkWell(
                                      onTap: () {
                                        if(data[index].orderStatus != "DELIVERED"){
                                          orderController.modifyOrder[index] =
                                          !orderController.modifyOrder[index];
                                        }

                                      },
                                      child: Text(
                                        (data[index].orderStatus == "DELIVERED")
                                            ?"Delivered"
                                            :"Modify Order ",
                                        style: TextStyle(
                                            color: (data[index].orderStatus == "DELIVERED")
                                                ?Constant.secondaryColor
                                                :Constant.black,
                                            fontSize: 13,
                                            fontFamily:
                                            'Poppins-bold',
                                            fontWeight:
                                            FontWeight
                                                .bold),
                                      ),
                                    ),
                                  ),
                                ),
                                (data[index].orderStatus == "CANCELLED")?Container():Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    color: (data[index].orderStatus == "DELIVERED")?Constant.white:Constant.blueShadowBackground,
                                  ),
                                  child: (data[index].orderStatus == "DELIVERED")?Container():Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: InkWell(
                                      onTap: () {

                                      },
                                      child: Text(
                                        "OTP ${orderController.orderList[index].pickupOtp!}",
                                        style: TextStyle(
                                            color: Constant
                                                .black,
                                            fontSize: 13,
                                            fontFamily:
                                            'Poppins-bold',
                                            fontWeight:
                                            FontWeight
                                                .bold),
                                      ),
                                    ),
                                  ),
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    color: Constant.blueShadowBackground,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: InkWell(
                                      onTap: () {
                                        orderController
                                            .more[
                                        index] =
                                        !orderController
                                            .more[
                                        index];
                                      },
                                      child: Text(
                                        'More',
                                        style: TextStyle(
                                            color: Constant
                                                .black,
                                            fontSize: 13,
                                            fontFamily:
                                            'Poppins-bold',
                                            fontWeight:
                                            FontWeight
                                                .bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                (orderController.more[index])
                    ? SizedBox(
                  height: 20,
                )
                    : Container(),
                (orderController.more[index])
                    ? Container(
                    child: Padding(
                      padding:
                      const EdgeInsets.only(
                          left: 10.0,
                          right: 10),
                      child: (data[index].user == null)?Container():Column(
                        children: [

                          (data[index].driver == null)
                              ?Container()
                              :(!data[index].driver.containsKey("name") && !data[index].driver.containsKey("phone"))
                              ?Container()
                              :driverDetails(data[index].driver["mobile"], data[index].driver["name"]),

                          SizedBox(
                            height: 10,
                          ),

                          (data[index].user !=null)
                              ?customerDetails(context,data[index].user!.name ?? "-", data[index].user!.mobile ?? "", data[index].deliveryAddress!.address ?? "")
                              :Container()
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
                    ? ((data[index].orderStatus == "DELIVERED" || data[index].orderStatus == "CANCELLED"))?Container():Container(
                  child: Padding(
                    padding:
                    const EdgeInsets.only(
                        left: 28.0,
                        right: 28),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment
                          .spaceAround,
                      children: [
                        DropdownButton<String>(
                          value: orderController
                              .status.value,
                          icon: const Icon(Icons
                              .arrow_drop_down),
                          iconSize: 20,
                          elevation: 16,
                          style:
                          const TextStyle(
                              color: Colors
                                  .black),
                          underline: Container(
                            height: 2,
                            color: Constant
                                .greyDark,
                          ),
                          onChanged: (String?
                          newValue) {
                            orderController
                                .status
                                .value =
                            newValue!;
                          },
                          items: <String>[
                            'ACCEPTED',
                            'PREPARED',
                            'CANCEL',
                          ].map<
                              DropdownMenuItem<
                                  String>>((String
                          value) {
                            return DropdownMenuItem<
                                String>(
                              value: value,
                              child:
                              Text(value),
                            );
                          }).toList(),
                        ),
                        Container(
                          width: MediaQuery
                              .of(
                              context)
                              .size
                              .width *
                              0.3,
                          height: 45,
                          child: CustomButton(
                              title:
                              "Modify Order",
                              textColor:
                              Constant
                                  .white,
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  letterSpacing:
                                  1,
                                  fontWeight:
                                  FontWeight
                                      .bold,
                                  color: Constant
                                      .white,
                                  fontFamily:
                                  'Poppins'),
                              borderRadius: 25,
                              //customPadding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                              backgroundColor:
                              Constant
                                  .secondaryColor,
                              onTap: () {
                                if(orderController
                                    .status
                                    .value == "ACCEPTED"){
                                  showDialog(
                                    context: context,
                                    builder: (_) => SelectTimePopUp(orderController.orderList[index].id),
                                  );
                                }else if(orderController.status.value == "PREPARED"){
                                  orderController
                                      .ModifyStoreOrderStatus(
                                    orderController.orderList[index].id!.toString(),
                                    "PREPARED",
                                    "-1",
                                  );
                                }else if(orderController.status.value == "CANCEL"){
                                  orderController
                                      .ModifyStoreOrderStatus(
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
                (data[index].orderStatus ==
                    "FOOD READY")
                    ? (controller.takeAwayVisible ==
                    true)
                    ? Container(
                  child: Column(
                    children: [
                      Container(
                        decoration:
                        BoxDecoration(
                          color: Constant
                              .black,
                          borderRadius:
                          BorderRadius
                              .circular(
                              29),
                          border: Border.all(
                              color: Constant
                                  .black),
                        ),
                        child: Padding(
                          padding:
                          const EdgeInsets
                              .only(
                              left: 8.0,
                              right: 8),
                          child: Text(
                            "Invoice",
                            style: TextStyle(
                                color: Constant
                                    .white,
                                fontSize:
                                13,
                                fontFamily:
                                'Poppins-bold',
                                fontWeight:
                                FontWeight
                                    .bold),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                              child: Wrap(
                                spacing: 5.0,
                                runSpacing: 5.0,
                                children: <
                                    Widget>[
                                  choiceChipWidget(
                                      Invoice),
                                ],
                              )),
                          Container(
                            decoration:
                            BoxDecoration(
                              color: Constant
                                  .secondaryColor,
                              borderRadius:
                              BorderRadius
                                  .circular(
                                  29),
                              border: Border.all(
                                  color: Constant
                                      .secondaryColor),
                            ),
                            child: Padding(
                              padding:
                              const EdgeInsets
                                  .all(5),
                              child: Text(
                                "Settle",
                                style: TextStyle(
                                    color: Constant
                                        .white,
                                    fontSize:
                                    13,
                                    fontFamily:
                                    'Poppins-bold',
                                    fontWeight:
                                    FontWeight.bold),
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
                    : (controller.DeliveryVisible ==
                    true)
                    ? Container(
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                              width: MediaQuery
                                  .of(
                                  context)
                                  .size
                                  .width *
                                  0.6,
                              decoration:
                              BoxDecoration(
                                color: Constant
                                    .white,
                                borderRadius:
                                BorderRadius
                                    .circular(
                                    29),
                                border:
                                Border.all(
                                  color: Constant
                                      .lightGrey,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets
                                        .only(
                                        left:
                                        20.0,
                                        right:
                                        20),
                                    child:
                                    InkWell(
                                      onTap:
                                          () {
                                        print(
                                            "minus");
                                        controller
                                            .decrement();
                                      },
                                      child:
                                      Icon(
                                        CupertinoIcons
                                            .minus,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration:
                                    BoxDecoration(
                                      border:
                                      Border(
                                        right: BorderSide(
                                            width:
                                            1.0,
                                            color:
                                            Constant
                                                .lightGrey),
                                        left: BorderSide(
                                            width:
                                            1.0,
                                            color:
                                            Constant
                                                .lightGrey),
                                      ),
                                      color: Constant
                                          .blueShadowBackground,
                                    ),
                                    child:
                                    Padding(
                                      padding: const EdgeInsets
                                          .only(
                                          left:
                                          20.0,
                                          right:
                                          20),
                                      child: Obx(
                                              () {
                                            return Text(
                                                "${controller
                                                    .minCount
                                                    .value}" +
                                                    " min");
                                          }),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets
                                        .only(
                                        left:
                                        20.0,
                                        right:
                                        20),
                                    child:
                                    InkWell(
                                      onTap:
                                          () {
                                        print(
                                            "plus");
                                        controller
                                            .increment();
                                      },
                                      child:
                                      Icon(
                                        Icons
                                            .add,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child:
                                Container(
                                  decoration:
                                  BoxDecoration(
                                    color: Constant
                                        .secondaryColor,
                                    borderRadius:
                                    BorderRadius.circular(
                                        29),
                                    border:
                                    Border
                                        .all(
                                      color: Constant
                                          .secondaryColor,
                                    ),
                                  ),
                                  child:
                                  Padding(
                                    padding: const EdgeInsets
                                        .only(
                                        left:
                                        18.0,
                                        right:
                                        18,
                                        top: 8,
                                        bottom:
                                        8),
                                    child: Text(
                                      "Accept",
                                      style: TextStyle(
                                          color: Constant
                                              .white,
                                          fontSize:
                                          13,
                                          fontFamily:
                                          'Poppins-bold',
                                          fontWeight:
                                          FontWeight
                                              .bold),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child:
                                Container(
                                  decoration:
                                  BoxDecoration(
                                    color: Constant
                                        .secondaryColor,
                                    borderRadius:
                                    BorderRadius.circular(
                                        29),
                                    border:
                                    Border
                                        .all(
                                      color: Constant
                                          .secondaryColor,
                                    ),
                                  ),
                                  child:
                                  Padding(
                                    padding: const EdgeInsets
                                        .only(
                                        left:
                                        18.0,
                                        right:
                                        18,
                                        top: 8,
                                        bottom:
                                        8),
                                    child: Text(
                                      "Reject",
                                      style: TextStyle(
                                          color: Constant
                                              .white,
                                          fontSize:
                                          13,
                                          fontFamily:
                                          'Poppins-bold',
                                          fontWeight:
                                          FontWeight
                                              .bold),
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
    );
  }

  Widget customerDetails(context, String name, String phone, String address){
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
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Name : ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Text(
                      name,
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Phone : ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Text(
                      phone,
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),
                    ),
                  )
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Address : ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Text(
                      address,
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),
                    ),
                  )
                ],
              )

            ],
          ),
        )
    );
  }

  Widget driverDetails(String phone, String name){
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
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Name : ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Phone : ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),
                  ),
                  Text(
                    phone,
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),
                  )
                ],
              ),


            ],
          ),
        )
    );

  }
}
