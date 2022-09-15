

import 'package:sooooperbusiness/model/category.dart';

class GetCategoryResponse {
  GetCategoryResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  CategoryResponse? data;

  factory GetCategoryResponse.fromJson(Map<String, dynamic> json) =>
      GetCategoryResponse(
        status: json["status"],
        message: json["message"],
        data: CategoryResponse.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

