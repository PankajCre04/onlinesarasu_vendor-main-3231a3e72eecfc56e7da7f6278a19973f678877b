// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:get/get.dart';
// import 'package:sooooperbusiness/controllers/report/reportController.dart';
// import 'package:sooooperbusiness/views/dashboard/navigationscreens/reports/OrderingTrendsReport/bar_chart_model.dart';
//
// class BarChartGraph extends StatefulWidget {
//   final List<BarChartModel>? data;
//
//   const BarChartGraph({Key? key, this.data}) : super(key: key);
//
//   @override
//   _BarChartGraphState createState() => _BarChartGraphState();
// }
//
// class _BarChartGraphState extends State<BarChartGraph> {
//   List<BarChartModel>? _barChartList;
//   ReportController reportController = Get.find();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _barChartList = [
//       BarChartModel(dateTime: DateTime(1)),
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<charts.Series<BarChartModel, DateTime>> series = [
//       charts.Series<BarChartModel, DateTime>(
//           id: "Sales",
//           data: reportController.orderGraphData,
//           domainFn: (BarChartModel series, _) => series.dateTime!,
//           measureFn: (BarChartModel series, _) => series.sales,
//           colorFn: (BarChartModel series, _) => series.color!),
//     ];
//
//     return _buildFinancialList(series);
//
//   }
//
//   Widget _buildFinancialList(series) {
//     return _barChartList != null
//         ? ListView.separated(
//       physics: NeverScrollableScrollPhysics(),
//       separatorBuilder: (context, index) => Divider(
//         color: Colors.white,
//         height: 5,
//       ),
//       scrollDirection: Axis.vertical,
//       shrinkWrap: true,
//       itemCount: _barChartList!.length,
//       itemBuilder: (BuildContext context, int index) {
//         return Container(
//           height: MediaQuery.of(context).size.height/ 2.3,
//           padding: EdgeInsets.all(10),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Order Report",
//                       style: TextStyle(
//                           color: Colors.black, fontSize: 22,
//                           fontWeight: FontWeight.bold)
//                   ),
//                 ],
//               ),
//               Container(
//                 height: 200,
//                   child: charts.TimeSeriesChart(
//                 series,
//                 animate: true,
//                 defaultRenderer: new charts.BarRendererConfig<DateTime>(),
//                 defaultInteractions: false,
//                 behaviors: [new charts.SelectNearest(), new charts.DomainHighlighter()]
//               )),
//             ],
//           ),
//         );
//       },
//     )
//         : SizedBox();
//   }
// }