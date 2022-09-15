import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sooooperbusiness/commons/utils.dart';
import 'package:sooooperbusiness/controllers/maincontroller.dart';
import 'package:sooooperbusiness/controllers/mainsplashcontroller.dart';
import 'package:sooooperbusiness/controllers/order/ordercontroller.dart';
import 'package:sooooperbusiness/controllers/ownercontrollers.dart';
import 'package:sooooperbusiness/controllers/pos/homecontroller.dart';
import 'package:sooooperbusiness/controllers/pos/poscontroller.dart';
import 'package:sooooperbusiness/controllers/report/reportController.dart';
import 'package:sooooperbusiness/views/components/custombutton.dart';
import 'package:sooooperbusiness/views/components/customcontainer.dart';
import 'package:sooooperbusiness/views/components/my_text_field.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/order_list_by_report.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/pos/DineIn.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/pos/order_creator.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/pos/waitingList.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/reports/OrderingTrendsReport/bar_chart_model.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/reports/report.dart';
import 'package:sooooperbusiness/views/owner/addrestaurant.dart';
import 'package:sooooperbusiness/views/owner/listrestaurants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:pie_chart/pie_chart.dart' as pi;

import '../../../../controllers/authcontrollers.dart';
import '../../../../controllers/getstartedcontroller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());
  // POSController posController=Get.put(POSController());
  OwnerControllers ownercontroller = Get.put(OwnerControllers());
  ReportController reportController = Get.put(ReportController());
  MainController mainController = Get.put(MainController());
  OrderController orderController = Get.put(OrderController());
  AuthControllers authControllers = Get.put(AuthControllers());
  // MainSplashController mainSplashController = Get.put(MainSplashController());

  // HomeScreen(){
  //   if (mainController.selectedStore.value.id != null) {
  //     mainController.getStoreStats(mainController.selectedStore.value.id.toString());
  //   } else {
  //
  //   }
  // }

  Future<void> refreshLocalGallery() async {
    print('refreshing stocks...');
    if (Constant.isEcom == "0") {
      if (mainController.selectedStore.value.id != null) {
        mainController.getStoreStats(mainController.selectedStore.value.id.toString());
      } else {}
    } else {
      print("HereWeAre");
      if (mainController.adminStore.value.id != null) {
        mainController.getStoreStats(mainController.adminStore.value.id.toString());
      } else {}
    }
  }

  @override
  void initState() {
    super.initState();
    print("Flag*****************${Constant.isEcom}");
    refreshLocalGallery();
    // mainSplashController.UploadFCMToken();
  }

  @override
  Widget build(BuildContext context) {
    print("in build->>");
    mainController.UploadFCMToken();
    // mainSplashController.UploadFCMToken();
    // refreshLocalGallery();
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Obx(
        () => RefreshIndicator(
          onRefresh: refreshLocalGallery,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    homeController.mainController.isLoadingRestaurants.value
                        ? SizedBox(
                            width: 15,
                            height: 15,
                            child: CircularProgressIndicator(),
                          )
                        : homeController.mainController.selectedStore.value.id != null || mainController.adminStore.value.id != null
                            ? Column(
                                children: [
                                  Constant.isEcom == "0"
                                      ? Text(
                                          "Hello ,${homeController.mainController.selectedStore.value.name} ",
                                          maxLines: 5,
                                          style: TextStyle(color: Constant.black, fontSize: 20, fontFamily: 'Poppins_Bold', fontWeight: FontWeight.bold),
                                        )
                                      : Text(
                                          "Hello ,${mainController.adminStore.value.name} ",
                                          maxLines: 5,
                                          style: TextStyle(color: Constant.black, fontSize: 20, fontFamily: 'Poppins_Bold', fontWeight: FontWeight.bold),
                                        ),
                                ],
                              )
                            : Row(
                                children: [
                                  Text("Hello, Admin"),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.5,
                                  ),
                                  // CustomButton(
                                  //   width: 80,
                                  //   backgroundColor:
                                  //       Constant.blueShadowBackground,
                                  //   title: "Add Restaurant",
                                  //   textStyle: TextStyle(
                                  //       fontFamily: "Poppins_Bold", fontSize: 18),
                                  //   onTap: () {
                                  //     Get.to(AddEditRestaurant("Add"));
                                  //     clearData();
                                  //   },
                                  //   height: 40,
                                  // )
                                ],
                              ),
                    homeController.mainController.isLoadingRestaurants.value
                        ? Container()
                        : (homeController.mainController.selectedStore.value.id != null || mainController.adminStore.value.id != null)
                            ? Constant.isEcom == "1"
                                ? SizedBox()
                                : CustomButton(
                                    width: 80,
                                    backgroundColor: Constant.secondaryColor,
                                    title: "Change Store",
                                    textStyle: TextStyle(color: Constant.white, fontFamily: "Poppins_Bold", fontSize: 18),
                                    onTap: () {
                                      Get.bottomSheet(AllRestaurants());
                                    },
                                    height: 40,
                                  )
                            : CustomButton(
                                width: 80,
                                backgroundColor: Constant.secondaryColor,
                                title: "Add Storesss",
                                textStyle: TextStyle(color: Constant.white, fontFamily: "Poppins_Bold", fontSize: 18),
                                onTap: () {
                                  Get.to(AddEditRestaurant("Add", ""));
                                },
                                height: 40,
                              ),
                    homeController.mainController.isLoadingRestaurants.value
                        ? Container()
                        : Row(
                            children: [
                              Text("Manage your business from here"),
                            ],
                          ),
                    // Container(
                    //   child: report(),
                    // )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 6,
                thickness: 5,
                color: Constant.blueShadowBackground,
              ),
              // Container(
              //   height: MediaQuery.of(context).size.height*0.8,
              //   child: report(),
              // ),
              SizedBox(
                height: 10,
              ),

              (homeController.mainController.isLoadingRestaurants.value)
                  ? Container()
                  : (homeController.mainController.selectedStore.value.id != null || mainController.adminStore.value.id != null)
                      ? (mainController.isStatsLoading.value)
                          ? Container()
                          : orderTiles()
                      : Container(),

              SizedBox(
                height: 50,
              ),

              (homeController.mainController.isLoadingRestaurants.value)
                  ? Container()
                  : (homeController.mainController.selectedStore.value.id != null || mainController.adminStore.value.id != null)
                      ? (mainController.pieDataMap != null)
                          ? pieChart(context)
                          : Container()
                      : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget pieChart(context) {
    List<Color> colorList = <Color>[Colors.orange, Constant.secondaryColor, Colors.blue, Colors.red];
    return pi.PieChart(
      dataMap: mainController.pieDataMap!.value,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 50,
      chartRadius: MediaQuery.of(context).size.width * 0.4,
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: pi.ChartType.disc,
      ringStrokeWidth: 32,
      centerText: "Order",
      legendOptions: pi.LegendOptions(
        showLegendsInRow: false,
        legendPosition: pi.LegendPosition.right,
        showLegends: true,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: pi.ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
    );
  }

  Widget orderTiles() {
    return Obx(
      () => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  if (mainController.storeStatsData.value.pendingOrders! > 0) {
                    // orderController.orderStatus.value = "PLACED";
                    orderController.nextPage = 1;
                    orderController.GetRestaurantOrderPending(1, "");
                    Get.to(orderListByReport("PLACED"));
                  } else {
                    Utility.showSingleTextToast("No Pending Orders");
                  }
                },
                child: CustomContainer(
                  borderRadius: 10,
                  padding: MediaQuery.of(context).size.aspectRatio * 10,
                  backgroundColor: Colors.orange,
                  child: Column(
                    children: [
                      Text(
                        mainController.storeStatsData.value.pendingOrders != null ? mainController.storeStatsData.value.pendingOrders.toString() : "0",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60, color: Constant.white),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Constant.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Pending Orders",
                            style: TextStyle(color: Constant.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (mainController.storeStatsData.value.deliveredOrders! > 0) {
                    orderController.orderStatus.value = "DELIVERED";
                    orderController.nextPage = 1;
                    orderController.GetRestaurantOrderDelivered(1, "");
                    Get.to(orderListByReport("DELIVERED"));
                  } else {
                    Utility.showSingleTextToast("No Delivered Orders");
                  }
                },
                child: CustomContainer(
                  borderRadius: 10,
                  padding: MediaQuery.of(context).size.aspectRatio * 10,
                  backgroundColor: Constant.secondaryColor,
                  child: Column(
                    children: [
                      Text(
                        mainController.storeStatsData.value.deliveredOrders != null ? mainController.storeStatsData.value.deliveredOrders.toString() : "0",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60, color: Constant.white),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.delivery_dining,
                            color: Constant.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Delivered Orders",
                            style: TextStyle(color: Constant.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  if (mainController.storeStatsData.value.ongoingOrders! > 0) {
                    // mainController.tabIndex.value = 1;
                    // orderController.orderStatus.value = "ONGOING";
                    orderController.nextPage = 1;
                    orderController.GetRestaurantOrderOnoging(1, "");
                    Get.to(orderListByReport("ONGOING"));
                  } else {
                    Utility.showSingleTextToast("No Ongoing Orders");
                  }
                },
                child: CustomContainer(
                  borderRadius: 10,
                  padding: MediaQuery.of(context).size.aspectRatio * 10,
                  backgroundColor: Colors.blue,
                  child: Column(
                    children: [
                      Text(
                        mainController.storeStatsData.value.ongoingOrders != null ? mainController.storeStatsData.value.ongoingOrders.toString() : "0",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60, color: Constant.white),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.timelapse,
                            color: Constant.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Ongoing Orders",
                            style: TextStyle(color: Constant.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (mainController.storeStatsData.value.cancelledOrders! > 0) {
                    orderController.orderStatus.value = "CANCELLED";
                    orderController.nextPage = 1;
                    orderController.GetRestaurantOrderCanceled(1, "");
                    Get.to(orderListByReport("CANCELLED"));
                  } else {
                    Utility.showSingleTextToast("No Cancelled Orders");
                  }
                },
                child: CustomContainer(
                  borderRadius: 10,
                  padding: MediaQuery.of(context).size.aspectRatio * 10,
                  backgroundColor: Constant.errorColor,
                  child: Column(
                    children: [
                      Text(
                        mainController.storeStatsData.value.cancelledOrders != null ? mainController.storeStatsData.value.cancelledOrders.toString() : "0",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60, color: Constant.white),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.cancel_presentation,
                            color: Constant.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Canceled Orders",
                            style: TextStyle(color: Constant.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget earningGraph() {
    return Column(children: [
      //Initialize the chart widget
      SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          // Chart title
          title: ChartTitle(text: 'Order Report'),
          // Enable legend
          legend: Legend(isVisible: true),
          // Enable tooltip
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<BarChartModel, String>>[
            LineSeries<BarChartModel, String>(
                dataSource: reportController.orderGraphData,
                xValueMapper: (BarChartModel sales, _) => sales.dateTime.toString(),
                yValueMapper: (BarChartModel sales, _) => sales.sales,
                name: 'Order',
                width: 1,
                color: Constant.secondaryColor,
                xAxisName: "Orders",
                yAxisName: "Dates",
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: true))
          ]),
      // Expanded(
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     //Initialize the spark charts widget
      //     child: SfSparkLineChart.custom(
      //       //Enable the trackball
      //       trackball: SparkChartTrackball(
      //           activationMode: SparkChartActivationMode.tap),
      //       //Enable marker
      //       marker: SparkChartMarker(
      //           displayMode: SparkChartMarkerDisplayMode.all),
      //       //Enable data label
      //       labelDisplayMode: SparkChartLabelDisplayMode.all,
      //       xValueMapper: (int index) => data[index].year,
      //       yValueMapper: (int index) => data[index].sales,
      //       dataCount: 5,
      //     ),
      //   ),
      // )
    ]);
  }

  clearData() {
    print("dekho");
    ownercontroller.nameEditingController.text = "";
    ownercontroller.descriptionEditingController.text = "";
    ownercontroller.phoneEditingController.text = "";
    ownercontroller.altPhoneEditingController.text = "";
    ownercontroller.fullAddressEditingController.text = "";
    ownercontroller.landMarkEditingController.text = "";
    ownercontroller.isFeatured.value = false;
    ownercontroller.isVegOnly.value = false;
    ownercontroller.isDeliveryEnabled.value = false;
    ownercontroller.deliveryRadiusEditingController.text = "";
    ownercontroller.isFixedDeliveryCharged.value = true;
    ownercontroller.baseDeliveryChargeEditingController.text = "";
    ownercontroller.avgDeliveryTimeEditingController.text = "";
    ownercontroller.minOrderPriceEditingController.text = "";
    ownercontroller.cost2EditingController.text = "";
    ownercontroller.isTakeAwayEnabled.value = false;
    ownercontroller.isDineInEnabled.value = false;
    ownercontroller.openTimeEditingController.text = "";
    ownercontroller.closeTimeEditingController.text = "";
    // ownercontroller.isCategoryLoaded.value = false;
    ownercontroller.isImageSelected.value = false;
    ownercontroller.selectedImage = "" as Rx<File>;
    ownercontroller.selectedGalleryImage = "" as RxList?;
  }
}
