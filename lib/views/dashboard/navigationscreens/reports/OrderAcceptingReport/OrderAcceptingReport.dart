import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/reports/OrderAcceptingReport/bar_chart_graph.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/reports/OrderAcceptingReport/bar_chart_model.dart';


class OrderAcceptingBarChartDemo extends StatefulWidget {
  @override
  _OrderAcceptingBarChartDemoState createState() => _OrderAcceptingBarChartDemoState();
}

class _OrderAcceptingBarChartDemoState extends State<OrderAcceptingBarChartDemo> {

  final List<BarChartModel> data = [
    BarChartModel(
      year: "1 Jun",
      financial: 300,
      color: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    BarChartModel(
      year: "2 Jun",
      financial: 100,
      color: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    BarChartModel(
      year: "3 Jun",
      financial: 450,
      color: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    BarChartModel(
      year: "4 JUN",
      financial: 630,
      color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
    ),
    BarChartModel(
      year: "5 Jun",
      financial: 1000,
      color: charts.ColorUtil.fromDartColor(Colors.pink),
    ),
    BarChartModel(
      year: "6 jun",
      financial: 400,
      color: charts.ColorUtil.fromDartColor(Colors.purple),
    ),
    BarChartModel(
      year: "7 jun",
      financial: 600,
      color: charts.ColorUtil.fromDartColor(Colors.grey),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  BarChartGraph(
                    data: data,
                  ),

                ],
              ),

            ),

            Padding(
              padding: const EdgeInsets.only(top: 30.0,left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {

                    },
                    child: Container(
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
                              .secondaryColor,
                        ),
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets
                            .only(
                            left: 18.0,
                            right: 18,
                            top: 8,
                            bottom: 8),
                        child: Text(
                          "Daily",
                          style: TextStyle(
                              color: Constant
                                  .white,
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
                  GestureDetector(
                    onTap: () {

                    },
                    child: Container(
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
                              .secondaryColor,
                        ),
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets
                            .only(
                            left: 18.0,
                            right: 18,
                            top: 8,
                            bottom: 8),
                        child: Text(
                          "Weekly",
                          style: TextStyle(
                              color: Constant
                                  .white,
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
                  GestureDetector(
                    onTap: () {

                    },
                    child: Container(
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
                              .secondaryColor,
                        ),
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets
                            .only(
                            left: 18.0,
                            right: 18,
                            top: 8,
                            bottom: 8),
                        child: Text(
                          "Monthly",
                          style: TextStyle(
                              color: Constant
                                  .white,
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
                  GestureDetector(
                    onTap: () {

                    },
                    child: Container(
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
                              .secondaryColor,
                        ),
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets
                            .only(
                            left: 18.0,
                            right: 18,
                            top: 8,
                            bottom: 8),
                        child: Text(
                          "Custom",
                          style: TextStyle(
                              color: Constant
                                  .white,
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
            )
          ],
        ),
      ),
    );
  }
}