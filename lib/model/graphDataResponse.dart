

class GraphDataResponse {
  GraphDataResponse({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  GraphData? data;
  String? message;

  factory GraphDataResponse.fromJson(Map<String, dynamic> json) => GraphDataResponse(
    success: json["success"],
    data: GraphData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data!.toJson(),
    "message": message,
  };
}

class GraphData {
  GraphData({
    this.totalOrders,
    this.totalAmount,
    this.earnings,
    this.chartData,
    this.dataTitle,
  });

  int? totalOrders;
  int? totalAmount;
  double? earnings;
  Map<String, double>? chartData;
  String? dataTitle;

  factory GraphData.fromJson(Map<String, dynamic> json) => GraphData(
    totalOrders: json["total_orders"],
    totalAmount: json["total_amount"],
    earnings: json["earnings"].toDouble(),
    chartData: Map.from(json["chart_data"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
    dataTitle: json["data_title"],
  );

  Map<String, dynamic> toJson() => {
    "total_orders": totalOrders,
    "total_amount": totalAmount,
    "earnings": earnings,
    "chart_data": Map.from(chartData!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "data_title": dataTitle,
  };
}
