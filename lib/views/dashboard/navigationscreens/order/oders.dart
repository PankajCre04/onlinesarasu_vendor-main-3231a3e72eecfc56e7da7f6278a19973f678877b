import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/controllers/order/ordercontroller.dart';
import 'package:sooooperbusiness/controllers/ownercontrollers.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/order/orderProcessing/processing_order.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/order/vendor_orders/vendor_orders.dart';

class orders extends StatelessWidget {
  OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      onRefresh: orderController.onRefresh,
      controller: orderController.refreshController,

      //scrollController: orderController.scrollController,
      enableTwoLevel: true,
      child: DefaultTabController(
        length: Constant.isEcom == "0" ? 7 : 4,
        child: Scaffold(
          appBar: TabBar(
            isScrollable: true, indicatorColor: Constant.greyBack, labelColor: Constant.black, indicatorWeight: 0.6, unselectedLabelColor: Constant.greyDark,
            //labelStyle: TextStyle(fontSize: 10.0),
            tabs: Constant.isEcom == "0"
                ? [
                    new Tab(text: 'Placed'),
                    new Tab(text: 'Accepted'),
                    new Tab(text: 'Assigned'),
                    new Tab(text: 'Prepared'),
                    new Tab(text: 'Reached'),
                    new Tab(text: 'Delivered'),
                    new Tab(text: "Cancelled"),
                  ]
                : [
                    new Tab(text: 'Placed'),
                    new Tab(text: 'In Progress'),
                    new Tab(text: 'Completed'),
                    new Tab(text: 'Cancelled'),
                  ],
          ),
          body: Constant.isEcom == "0"
              ? new TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    ProcessingOrderAll("PLACED"),
                    ProcessingOrderAll("ACCEPTED"),
                    ProcessingOrderAll("ASSIGNED"),
                    ProcessingOrderAll("PREPARED"),
                    ProcessingOrderAll("REACHED"),
                    ProcessingOrderAll("DELIVERED"),
                    ProcessingOrderAll("CANCELLED"),
                  ],
                )
              : VendorOrders(),
        ),
      ),
    );
  }
}
