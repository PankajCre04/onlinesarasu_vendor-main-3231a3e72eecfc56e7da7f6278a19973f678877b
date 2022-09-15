import 'package:sooooperbusiness/model/category.dart';

class AllCategoryResponse {
  AllCategoryResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Category? data;

  factory AllCategoryResponse.fromJson(Map<String, dynamic> json) =>
      AllCategoryResponse(
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
