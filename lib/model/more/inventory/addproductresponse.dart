// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:sooooperbusiness/model/more/inventory/product.dart';

import 'inventoryModel.dart';

class AddProductResponse {
  AddProductResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Product? data;

  factory AddProductResponse.fromJson(Map<String, dynamic> json) => AddProductResponse(
    status: json["status"],
    message: json["message"],
    data: Product.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}


