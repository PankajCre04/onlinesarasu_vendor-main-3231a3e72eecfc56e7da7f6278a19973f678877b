// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:sooooperbusiness/model/more/inventory/category.dart';

class ImportItemsResponse {
  ImportItemsResponse({
    this.status,
    this.message,
  });

  bool? status;
  String? message;
  // List<Category>? data;

  factory ImportItemsResponse.fromJson(Map<String, dynamic> json) => ImportItemsResponse(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}

