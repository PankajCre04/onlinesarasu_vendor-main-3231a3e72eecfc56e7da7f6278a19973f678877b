// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:sooooperbusiness/model/more/inventory/productCategory.dart';

import 'category.dart';

class AddProductCategoryResponse {
  AddProductCategoryResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  ProductCategory? data;

  factory AddProductCategoryResponse.fromJson(Map<String, dynamic> json) => AddProductCategoryResponse(
    status: json["status"],
    message: json["message"],
    data: ProductCategory.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

