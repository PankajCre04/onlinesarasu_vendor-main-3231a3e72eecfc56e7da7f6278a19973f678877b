// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);


import 'package:sooooperbusiness/model/more/inventory/productCategory.dart';

class ProductCategoryResponse {
  ProductCategoryResponse({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  List<ProductCategory>? data;
  String? message;

  factory ProductCategoryResponse.fromJson(Map<String, dynamic> json) => ProductCategoryResponse(
    success: json["success"],
    data: List<ProductCategory>.from(json["data"].map((x) => ProductCategory.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}


