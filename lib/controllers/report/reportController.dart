import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sooooperbusiness/api/repository/graphrepo.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/sessionmanager.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/reports/OrderingTrendsReport/bar_chart_model.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReportController extends GetxController{
  RxString ChooseReport = "".obs;
  GraphRepo graphRepo = GraphRepo();
  Rx<String> startDate = DateFormat('MMMM dd, yyyy').format(DateTime.now().subtract(Duration(days: 84))).toString().obs;
  Rx<String> endDate = DateFormat('MMMM dd, yyyy').format(DateTime.now()).toString().obs;
  Rx<String> type = "orders".obs;
  Rx<String> interval = "month".obs;
  RxList<BarChartModel> orderGraphData = [BarChartModel()].obs;
  RxList<BarChartModel> saleGraphData = [BarChartModel()].obs;
  RxString totalOrder = "".obs;
  RxString totalEarnings = "".obs;
  RxString orderPerDay = "".obs;
  RxString earningPerDay = "".obs;
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  // Map<String, double>? orderGraphData;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit

    getOrderGraphData();
    getSalesGraphData();
    getEarningsPerDayGraphData();
    getOrderPerDayGraphData();
    super.onInit();
  }

  reportChange(RxString report){
    ChooseReport = report;
  }

  void getOrderGraphData() async{
    print("in get graph data");
    String? accessToken = await SessionManager.getAccessToken();
    graphRepo.getGraphData(
    accessToken!,
        startDate.value,
        DateFormat('MMMM ${DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day}, yyyy').format(DateTime.now()).toString(),
        // endDate.value,
        type.value,
        interval.value,).then((value){
          if(value.data != null){
            totalOrder.value = value.data!.data!.totalOrders.toString();
            orderGraphData.clear();
            for(int i=0;i<value.data!.data!.chartData!.length;i++){
              orderGraphData.add(BarChartModel(
                dateTime: value.data!.data!.chartData!.keys.elementAt(i),
                sales: value.data!.data!.chartData!.values.elementAt(i).toInt(),
                color: charts.ColorUtil.fromDartColor(Constant.secondaryColor),
              ));
            }
            print(orderGraphData.length);
          }

    });

  }

  void getOrderPerDayGraphData() async{
    print("in get price graph data");
    String? accessToken = await SessionManager.getAccessToken();
    graphRepo.getGraphData(
      accessToken!,
      startDate.value,
      endDate.value,
      "earnings",
      "day",).then((value){
      if(value.data != null){
        // orderPerDay.value = value.data!.data!.chartData!.values.elementAt(value.data!.data!.chartData!.length-1).toInt().toString();
        // totalEarnings.value = value.data!.data!.earnings!.toInt().toString();
        // saleGraphData.clear();
        // for(int i=0;i<value.data!.data!.chartData!.length;i++){
        //   saleGraphData.add(BarChartModel(
        //     dateTime: value.data!.data!.chartData!.keys.elementAt(i),
        //     sales: value.data!.data!.chartData!.values.elementAt(i).toInt(),
        //     color: charts.ColorUtil.fromDartColor(Constant.secondaryColor),
        //   ));
        // }
        print(saleGraphData.length);
      }

    });

  }

  void getEarningsPerDayGraphData() async{
    print("in get price graph data");
    String? accessToken = await SessionManager.getAccessToken();
    graphRepo.getGraphData(
      accessToken!,
      startDate.value,
      endDate.value,
      "orders",
      "day",).then((value){
      if(value.data != null){
        print("are bhai bahi");
        print(value.data!.data!.chartData!.length);
        print(value.data!.data!.chartData!.values.elementAt(value.data!.data!.chartData!.length-2).toInt().toString());
        // earningPerDay.value = value.data!.data!.chartData!.values.elementAt(value.data!.data!.chartData!.length-2).toInt().toString();
        // totalEarnings.value = value.data!.data!.earnings!.toInt().toString();
        // saleGraphData.clear();
        // for(int i=0;i<value.data!.data!.chartData!.length;i++){
        //   saleGraphData.add(BarChartModel(
        //     dateTime: value.data!.data!.chartData!.keys.elementAt(i),
        //     sales: value.data!.data!.chartData!.values.elementAt(i).toInt(),
        //     color: charts.ColorUtil.fromDartColor(Constant.secondaryColor),
        //   ));
        // }
        print(saleGraphData.length);
      }

    });

  }

  void getSalesGraphData() async{
    print("in get price graph data");
    String? accessToken = await SessionManager.getAccessToken();
    graphRepo.getGraphData(
      accessToken!,
      startDate.value,
      DateFormat('MMMM ${DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day}, yyyy').format(DateTime.now()).toString(),
      // endDate.value,
      "earnings",
      interval.value,).then((value){
      if(value.data != null){
        totalEarnings.value = value.data!.data!.earnings!.toInt().toString();
        saleGraphData.clear();
        for(int i=0;i<value.data!.data!.chartData!.length;i++){
          saleGraphData.add(BarChartModel(
            dateTime: value.data!.data!.chartData!.keys.elementAt(i),
            sales: value.data!.data!.chartData!.values.elementAt(i).toInt(),
            color: charts.ColorUtil.fromDartColor(Constant.secondaryColor),
          ));
        }
        print(saleGraphData.length);
      }

    });

  }

  Future<Null> selectDate(int type, BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) if (type == 0) {
      startDate.value = DateFormat('yyyy-MM-dd').format(picked);
      startDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      //ownerControllers.openTime.value = picked.hour.toString();
    } else {
      endDate.value = DateFormat('yyyy-MM-dd').format(picked);
      endDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      //ownerControllers.closeTime.value = picked.hour.toString();
    }
    // setState(() {
    //   selectedDate = picked;
    //   _dateController.text = DateFormat.yMd().format(selectedDate);
    // });
  }
}


