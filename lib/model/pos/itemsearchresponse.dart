
import 'package:sooooperbusiness/model/more/inventory/product.dart';

class ItemSearchResponse {
  ItemSearchResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<Product>? data;

  factory ItemSearchResponse.fromJson(Map<String, dynamic> json) => ItemSearchResponse(
    status: json["status"],
    message: json["message"],
    data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}