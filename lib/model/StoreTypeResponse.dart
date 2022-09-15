// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);


import 'package:sooooperbusiness/model/StoreTypeData.dart';

class StoreServiceTypeResponse {
  StoreServiceTypeResponse({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  List<StoreTypeData>? data;
  String? message;

  factory StoreServiceTypeResponse.fromJson(Map<String, dynamic> json) => StoreServiceTypeResponse(
    success: json["success"],
    data: List<StoreTypeData>.from(json["data"].map((x) => StoreTypeData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}


