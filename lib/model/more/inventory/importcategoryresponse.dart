// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:sooooperbusiness/model/more/inventory/category.dart';

class ImportCategoryResponse {
  ImportCategoryResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<Category>? data;

  factory ImportCategoryResponse.fromJson(Map<String, dynamic> json) => ImportCategoryResponse(
    status: json["status"],
    message: json["message"],
    data: List<Category>.from(json["data"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

