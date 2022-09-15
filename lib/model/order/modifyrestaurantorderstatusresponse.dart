// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:sooooperbusiness/model/order/orderdata.dart';
import 'package:sooooperbusiness/model/order/storeOrderData.dart';

class ModifyRestaurantOrderStatusResponse {
  ModifyRestaurantOrderStatusResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  StoreOrderData? data;

  factory ModifyRestaurantOrderStatusResponse.fromJson(Map<String, dynamic> json) => ModifyRestaurantOrderStatusResponse(
    status: json["status"],
    message: json["message"],
    data: StoreOrderData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}


