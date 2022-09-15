import 'package:charts_flutter/flutter.dart' as charts;

class BarChartModel {
  String? dateTime;
  int? sales;
  final charts.Color? color;

  BarChartModel({this.dateTime, this.sales, this.color,});
}