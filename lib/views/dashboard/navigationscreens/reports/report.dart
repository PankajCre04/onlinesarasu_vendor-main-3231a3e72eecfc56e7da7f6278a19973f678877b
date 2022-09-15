import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/controllers/maincontroller.dart';
import 'package:sooooperbusiness/controllers/pos/homecontroller.dart';
import 'package:sooooperbusiness/controllers/report/reportController.dart';
import 'package:sooooperbusiness/model/report/reportModel.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/reports/RevenueReport/RevenueReport.dart';

import 'CustomerComplaintsReport/CustomerComplaintsReport.dart';
import 'DeliveryTimeReport/DeliveryTimeReport.dart';
import 'OrderAcceptingReport/OrderAcceptingReport.dart';
import 'OrderRejectionReport/OrderRejectionReport.dart';
import 'OrderingTrendsReport/OrderingTrendsReport.dart';
import 'PaymentsReport/PaymentReport.dart';
import 'ProcessingTimeReport/ProcessingTimeReport.dart';

class report extends StatefulWidget {
  @override
  _reportState createState() => _reportState();
}

class _reportState extends State<report> {
  final ReportController controller = Get.put(ReportController());
  MainController mainController = Get.put(MainController());

  String? ChooseReport = "Ordering Trends Report";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (mainController.selectedStore.value.id == null)?Center(
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
      ):Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              height: 40,
              padding: EdgeInsets.only(left: 18, right: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Constant.blueShadowBackground,
                // boxShadow: [BoxShadow(
                //   color: Colors.grey,
                //   blurRadius: 5.0,
                // ),]
              ),
              child: DropdownButton<String>(
                  focusColor: Colors.white,
                  underline: SizedBox(),
                  value: ChooseReport,
                 // value: controller.ChooseReport,
                  //elevation: 5,
                  isExpanded: true,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  items: reportModel.report
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  hint: Text(
                    "Select Report",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Constant.black,
                  ),
                  iconSize: 20,
                  onChanged: (value) {
                    //controller.reportChange(value);
                    setState((){
                      ChooseReport = value;
                    });

                  },
                ),
            ),
          ),
          (ChooseReport == "Revenue Report")?SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              child: RevenueBarChartDemo()):
          (ChooseReport == "Payments Report")?SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              child: PaymentsBarChartDemo()):
          (ChooseReport == "Ordering Trends Report")?SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              child: OrderingTrendsBarChartDemo()):
          (ChooseReport == "Delivery Time Report")?SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              child: DeliveryTimeBarChartDemo()):
          (ChooseReport == "Processing Time Report")?SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              child: ProcessingTimeBarChartDemo()):
          (ChooseReport == "Order Accepting Report")?SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              child: OrderAcceptingBarChartDemo()):
          (ChooseReport == "Order Rejection Report")?SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              child: OrderRejectionBarChartDemo()):
          (ChooseReport == "Customer Complaints Report")?SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              child: CustomerComplaintsBarChartDemo()):
              Container(
                child: Text(
                  "Select Report",
                  style: TextStyle(
                    fontSize: 20,

                  ),
                ),
              )
        ],
      ),
    );
  }
}
