

import 'package:sooooperbusiness/model/more/inventory/product.dart';

class UpdateItemStatusResponse {
  UpdateItemStatusResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Product? data;

  factory UpdateItemStatusResponse.fromJson(Map<String, dynamic> json) => UpdateItemStatusResponse(
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

