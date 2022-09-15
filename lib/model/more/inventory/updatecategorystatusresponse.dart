

import 'package:sooooperbusiness/model/more/inventory/category.dart';
import 'package:sooooperbusiness/model/more/inventory/product.dart';

class UpdateCategoryStatusResponse {
  UpdateCategoryStatusResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Category? data;

  factory UpdateCategoryStatusResponse.fromJson(Map<String, dynamic> json) => UpdateCategoryStatusResponse(
    status: json["status"],
    message: json["message"],
    data: Category.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

