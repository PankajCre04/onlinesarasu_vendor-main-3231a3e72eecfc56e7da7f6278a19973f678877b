// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:sooooperbusiness/model/order/orderdata.dart';

class GetRestaurantOrderResponse {
  GetRestaurantOrderResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory GetRestaurantOrderResponse.fromJson(Map<String, dynamic> json) => GetRestaurantOrderResponse(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.results,
    this.page,
    this.limit,
    this.totalPages,
    this.totalResults,
  });

  List<OrderData>? results;
  int? page;
  int? limit;
  int? totalPages;
  int? totalResults;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    results: List<OrderData>.from(json["results"].map((x) => OrderData.fromJson(x))),
    page: json["page"],
    limit: json["limit"],
    totalPages: json["totalPages"],
    totalResults: json["totalResults"],
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results!.map((x) => x.toJson())),
    "page": page,
    "limit": limit,
    "totalPages": totalPages,
    "totalResults": totalResults,
  };
}




