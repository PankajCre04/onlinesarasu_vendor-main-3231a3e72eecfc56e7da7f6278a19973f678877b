import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/controllers/maincontroller.dart';
import 'package:sooooperbusiness/controllers/report/reportController.dart';
import 'package:sooooperbusiness/views/components/custombutton.dart';
import 'package:sooooperbusiness/views/components/customcontainer.dart';
import 'package:sooooperbusiness/views/components/my_text_field.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/reports/OrderingTrendsReport/bar_chart_model.dart';

// import 'package:charts_flutter/flutter.dart' as charts;
import 'package:auto_size_text/auto_size_text.dart';

class Reports extends StatelessWidget {
  ReportController reportController = Get.put(ReportController());
  MainController mainController = Get.put(MainController());

  Future<Null> refreshLocalReport() async {
    print('refreshing stocks...');
    mainController.getStoreStats(mainController.selectedStore.value.id.toString());
    reportController.getOrderGraphData();
    reportController.getSalesGraphData();
    reportController.getEarningsPerDayGraphData();
    reportController.getOrderPerDayGraphData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (mainController.selectedStore.value.id == null)
          ? Container(
              child: Center(
                child: Text(
                  "Please add Store",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            )
          : RefreshIndicator(
              onRefresh: refreshLocalReport,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),

                    orderTiles(context),

                    SizedBox(height: 20),

                    // datePick(context),

                    // SizedBox(
                    //   height: 20,
                    // ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: orderReportGraph(),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: saleReportGraph(),
                    ),

                    // Container(
                    //   height: MediaQuery.of(context).size.height*0.4,
                    //   child: barChart(),
                    // ),
                  ],
                ),
              ),
            ),
    );
  }

  // Widget datePick(context){
  //   return Padding(
  //     padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
  //     child: Row(
  //       children: [
  //         Expanded(
  //           child: InkWell(
  //             onTap: () {
  //               reportController.selectDate(0, context);
  //             },
  //             child: MyTextField(
  //               controller: reportController.startDateController,
  //               borderRadius: 10,
  //               contentPadding:
  //               const EdgeInsets.fromLTRB(20, 15, 20, 15),
  //               onChanged: (value) {},
  //               isEnabled: false,
  //               labelText: 'Start Date',
  //               borderColor: Constant.borderColor,
  //               focusedBorderColor: Constant.black,
  //               borderWidth: 2,
  //               keyboardType: TextInputType.number,
  //               showTrailingWidget: true,
  //               overrideHintText: true,
  //               hintText: "Start",
  //               textStyle: TextStyle(
  //                   fontSize: 10,
  //                   fontWeight: FontWeight.bold
  //               ),
  //               validator: (value) {
  //                 if (value!.isEmpty) {
  //                   return 'Enter Start Date';
  //                 }
  //                 return null;
  //               },
  //             ),
  //           ),
  //         ),
  //         SizedBox(
  //           width: 10,
  //         ),
  //         Expanded(
  //           child: InkWell(
  //             onTap: () {
  //               reportController.selectDate(1, context);
  //             },
  //             child: MyTextField(
  //               controller: reportController.endDateController,
  //               borderRadius: 10,
  //               contentPadding:
  //               const EdgeInsets.fromLTRB(20, 15, 20, 15),
  //               textStyle: TextStyle(
  //                   fontSize: 10,
  //                   fontWeight: FontWeight.bold
  //               ),
  //               onChanged: (value) {},
  //               labelText: 'End Date',
  //               isEnabled: false,
  //               borderColor: Constant.borderColor,
  //               focusedBorderColor: Constant.black,
  //               borderWidth: 2,
  //               overrideHintText: true,
  //               hintText: "End Date",
  //               keyboardType: TextInputType.number,
  //               showTrailingWidget: true,
  //               validator: (value) {
  //                 if (value!.isEmpty) {
  //                   return 'Enter End Date';
  //                 }
  //                 return null;
  //               },
  //             ),
  //           ),
  //         ),
  //
  //         SizedBox(
  //           width: 10,
  //         ),
  //
  //         CustomButton(
  //           width: 80,
  //           backgroundColor: Constant.blueShadowBackground,
  //           title:
  //           "Get Report",
  //           textStyle: TextStyle(
  //               fontFamily: "Poppins_Bold", fontSize: 18),
  //           onTap: () {
  //             // Get.bottomSheet(AllRestaurants());
  //             reportController.getOrderGraphData();
  //             reportController.getSalesGraphData();
  //           },
  //           height: 50,
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget orderReportGraph() {
    return Column(children: [
      //Initialize the chart widget
      Obx(
        () => Expanded(
          flex: 1,
          child: SfCartesianChart(
              enableSideBySideSeriesPlacement: false,
              backgroundColor: Constant.blueShadowBackground,
              // isTransposed: true,
              // plotAreaBorderWidth: 2,
              // plotAreaBorderColor: Constant.secondaryColor,
              primaryXAxis: CategoryAxis(
                labelStyle: TextStyle(color: Constant.secondaryColor),
                borderColor: Constant.secondaryColor,
                axisLine: AxisLine(width: 0),
                majorGridLines: MajorGridLines(width: 0),
              ),
              // primaryXAxis: NumericAxis(
              //   //Hide the gridlines of x-axis
              //   majorGridLines: MajorGridLines(width: 0),
              //   //Hide the axis line of x-axis
              //   axisLine: AxisLine(width: 0),
              // ),

              primaryYAxis: NumericAxis(
                //Hide the gridlines of y-axis
                //   majorGridLines: MajorGridLines(width: 0),
                borderColor: Constant.secondaryColor,
                labelStyle: TextStyle(color: Constant.secondaryColor),
                //Hide the axis line of y-axis
                // axisLine: AxisLine(width: 0)
              ),
              // Chart title
              title: ChartTitle(
                  text:
                      'Order Report\n (${reportController.totalOrder} orders)\n',
                  textStyle: TextStyle(
                    color: Constant.secondaryColor,
                  )),
              // Enable legend

              legend: Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<BarChartModel, String>>[
                ColumnSeries<BarChartModel, String>(
                    // dashArray: ,
                    isTrackVisible: false,
                    // markerSettings: MarkerSettings(
                    //   color: Colors.transparent,
                    //   width: 0,
                    //   height: 0
                    // ),
                    // borderWidth: 2,
                    // borderColor: Constant.secondaryColor,
                    // emptyPointSettings: EmptyPointSettings(mode: EmptyPointMode.zero),
                    //   spacing: 50,
                    dataSource: reportController.orderGraphData,
                    xValueMapper: (BarChartModel sales, _) =>
                        sales.dateTime.toString(),
                    yValueMapper: (BarChartModel sales, _) => sales.sales,
                    isVisibleInLegend: false,
                    name: 'Order',
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                    // emptyPointSettings: EmptyPointSettings(
                    //   color: Colors.white
                    // ),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Constant.secondaryColor,
                        Colors.blue,
                      ],
                    ),
                    width: 0.6,
                    spacing: 0.3,
                    color: Constant.secondaryColor,
                    xAxisName: "Orders",
                    yAxisName: "Dates",
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        textStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Constant.secondaryColor)))
              ]),
        ),
      ),
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

  Widget orderTiles(context) {
    return Obx(
      () => Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text("Orders Reports",
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomContainer(
                borderRadius: 10,
                padding: MediaQuery.of(context).size.aspectRatio * 30.0,
                backgroundColor: Colors.orange,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            reportController.orderPerDay.value != null
                                ? "${reportController.orderPerDay.value}"
                                : "0",
                            // reportController.orderGraphData[reportController.orderGraphData.length - 1].sales.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Constant.white),
                          ),
                        ),
                      ),
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
                          "Today's Orders",
                          style: TextStyle(color: Constant.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CustomContainer(
                borderRadius: 10,
                padding: MediaQuery.of(context).size.aspectRatio * 30.0,
                backgroundColor: Constant.secondaryColor,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: FittedBox(
                        // fit: BoxFit.fitWidth,
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            mainController.storeStatsData.value.totalOrders != null
                                ? mainController.storeStatsData.value.totalOrders
                                    .toString()
                                : "0",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 60,
                                color: Constant.white),
                          ),
                        ),
                      ),
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
                          "Total Orders",
                          style: TextStyle(color: Constant.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text("Earnings",
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomContainer(
                borderRadius: 10,
                padding: MediaQuery.of(context).size.aspectRatio * 30.0,
                backgroundColor: Colors.blue,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            mainController.storeStatsData.value.todayEarnings != null
                                ? mainController.storeStatsData.value.todayEarnings!.toString()
                                : "0",
                            // reportController.saleGraphData[reportController.orderGraphData.length - 1].sales.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 60,
                                color: Constant.white),
                          ),
                        ),
                      ),
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
                          "Today's Earning",
                          style: TextStyle(color: Constant.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CustomContainer(
                borderRadius: 10,
                padding:  MediaQuery.of(context).size.aspectRatio * 30.0,
                backgroundColor: Constant.secondaryColor,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: FittedBox(
                        // fit: BoxFit.fitWidth,
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            mainController.storeStatsData.value.totalEarning != null
                                ? mainController.storeStatsData.value.totalEarning!
                                    .toInt()
                                    .toString()
                                : "0",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 60,
                                color: Constant.white),
                          ),
                        ),
                      ),
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
                          "Total Earning",
                          style: TextStyle(color: Constant.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget saleReportGraph() {
    return Column(children: [
      //Initialize the chart widget
      Obx(
        () => Expanded(
          flex: 1,
          child: SfCartesianChart(
              enableSideBySideSeriesPlacement: false,
              backgroundColor: Constant.blueShadowBackground,
              // isTransposed: true,
              // plotAreaBorderWidth: 2,
              // plotAreaBorderColor: Constant.secondaryColor,
              primaryXAxis: CategoryAxis(
                labelStyle: TextStyle(color: Constant.secondaryColor),
                borderColor: Constant.secondaryColor,
                axisLine: AxisLine(width: 0),
                majorGridLines: MajorGridLines(width: 0),
              ),
              // primaryXAxis: NumericAxis(
              //   //Hide the gridlines of x-axis
              //   majorGridLines: MajorGridLines(width: 0),
              //   //Hide the axis line of x-axis
              //   axisLine: AxisLine(width: 0),
              // ),

              primaryYAxis: NumericAxis(
                //Hide the gridlines of y-axis
                //   majorGridLines: MajorGridLines(width: 0),
                borderColor: Constant.secondaryColor,
                labelStyle: TextStyle(color: Constant.secondaryColor),
                //Hide the axis line of y-axis
                // axisLine: AxisLine(width: 0)
              ),
              // Chart title
              title: ChartTitle(
                  text:
                      'Earning Report\n (${reportController.totalEarnings} Rs.)\n',
                  textStyle: TextStyle(
                    color: Constant.secondaryColor,
                  )),
              // Enable legend

              legend: Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<BarChartModel, String>>[
                ColumnSeries<BarChartModel, String>(
                    // dashArray: ,

                    isTrackVisible: false,
                    // markerSettings: MarkerSettings(
                    //   color: Colors.transparent,
                    //   width: 0,
                    //   height: 0
                    // ),
                    // borderWidth: 2,
                    // borderColor: Constant.secondaryColor,
                    // emptyPointSettings: EmptyPointSettings(mode: EmptyPointMode.zero),
                    //   spacing: 50,
                    dataSource: reportController.saleGraphData,
                    xValueMapper: (BarChartModel sales, _) =>
                        sales.dateTime.toString(),
                    yValueMapper: (BarChartModel sales, _) => sales.sales,
                    isVisibleInLegend: false,
                    name: 'Order',
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                    // emptyPointSettings: EmptyPointSettings(
                    //   color: Colors.white
                    // ),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Constant.secondaryColor,
                        Colors.blue,
                      ],
                    ),
                    width: 0.6,
                    spacing: 0.3,
                    color: Constant.secondaryColor,
                    xAxisName: "Orders",
                    yAxisName: "Dates",
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        textStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Constant.secondaryColor)))
              ]),
          // child: SfCartesianChart(
          //     primaryXAxis: CategoryAxis(),
          //     // Chart title
          //     title: ChartTitle(text: 'Earning Report\n (${reportController.totalEarnings} Rs.)'),
          //     // Enable legend
          //     legend: Legend(isVisible: true),
          //     // Enable tooltip
          //     tooltipBehavior: TooltipBehavior(enable: true),
          //     series: <ChartSeries<BarChartModel, String>>[
          //       ColumnSeries<BarChartModel, String>(
          //           dataSource: reportController.saleGraphData,
          //           xValueMapper: (BarChartModel sales, _) => sales.dateTime.toString(),
          //           yValueMapper: (BarChartModel sales, _) => sales.sales,
          //           name: 'Earnings',
          //
          //           width: 1,
          //           color: Constant.secondaryColor,
          //           gradient: LinearGradient(
          //             begin: Alignment.topRight,
          //             end: Alignment.bottomLeft,
          //             colors: [
          //               Constant.secondaryColor,
          //               Colors.blue,
          //             ],
          //           ),
          //           xAxisName: "Sale",
          //           yAxisName: "Dates",
          //           // Enable data label
          //           dataLabelSettings: DataLabelSettings(isVisible: true))
          //     ]),
        ),
      ),
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
// List<charts.Series<BarChartModel, String>>? series;

// Widget earningGraph() {
//   return Column(children: [
//     //Initialize the chart widget
//     SfCartesianChart(
//         primaryXAxis: CategoryAxis(),
//         // Chart title
//         title: ChartTitle(text: 'Order Report'),
//         // Enable legend
//         legend: Legend(isVisible: true),
//         // Enable tooltip
//         tooltipBehavior: TooltipBehavior(enable: true),
//         series: <ChartSeries<BarChartModel, String>>[
//           BarSeries<BarChartModel, String>(
//               dataSource: reportController.orderGraphData,
//               xValueMapper: (BarChartModel sales, _) => sales.dateTime.toString(),
//               yValueMapper: (BarChartModel sales, _) => sales.sales,
//               name: 'Order',
//
//               width: 1,
//               color: Constant.secondaryColor,
//               xAxisName: "Orders",
//               yAxisName: "Dates",
//               // Enable data label
//               dataLabelSettings: DataLabelSettings(isVisible: true))
//         ]),
//     // Expanded(
//     //   child: Padding(
//     //     padding: const EdgeInsets.all(8.0),
//     //     //Initialize the spark charts widget
//     //     child: SfSparkLineChart.custom(
//     //       //Enable the trackball
//     //       trackball: SparkChartTrackball(
//     //           activationMode: SparkChartActivationMode.tap),
//     //       //Enable marker
//     //       marker: SparkChartMarker(
//     //           displayMode: SparkChartMarkerDisplayMode.all),
//     //       //Enable data label
//     //       labelDisplayMode: SparkChartLabelDisplayMode.all,
//     //       xValueMapper: (int index) => data[index].year,
//     //       yValueMapper: (int index) => data[index].sales,
//     //       dataCount: 5,
//     //     ),
//     //   ),
//     // )
//   ]);
// }

// Widget barChart() {
//   series = [
//     charts.Series(
//
//       displayName: "Sales",
//         id: "Earning",
//         data: reportController.saleGraphData,
//         domainFn: (BarChartModel series, _) => series.dateTime!,
//         measureFn: (BarChartModel series, _) => series.sales!,
//         colorFn: (BarChartModel series, _) => series.color!),
//   ];
//   return Column(
//     children: [
//       Text(
//         "Earning Report",
//         style: TextStyle(
//           fontSize: 12
//         ),
//       ),
//       charts.BarChart(
//
//           series!,
//           animate: true
//       ),
//     ],
//   );
// }
}
