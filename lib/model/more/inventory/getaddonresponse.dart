// To parse this JSON data, do
//


import 'package:sooooperbusiness/model/more/inventory/addoncategorydata.dart';

class GetAddonCategoryResponse {
  GetAddonCategoryResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<AddonCategoryData>? data;

  factory GetAddonCategoryResponse.fromJson(Map<String, dynamic> json) => GetAddonCategoryResponse(
    status: json["status"],
    message: json["message"],
    data: List<AddonCategoryData>.from(json["data"].map((x) => AddonCategoryData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}


