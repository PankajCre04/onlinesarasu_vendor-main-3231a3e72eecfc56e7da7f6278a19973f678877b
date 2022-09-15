// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);



import 'package:sooooperbusiness/model/StoreCategoryData.dart';

class StoreCategoryResponse {
  StoreCategoryResponse({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  List<StoreCategoryData>? data;
  String? message;

  factory StoreCategoryResponse.fromJson(Map<String, dynamic> json) => StoreCategoryResponse(
    success: json["success"],
    data: List<StoreCategoryData>.from(json["data"].map((x) => StoreCategoryData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

