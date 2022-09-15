// To parse this JSON data, do
//


import 'package:sooooperbusiness/model/more/inventory/addoncategorydata.dart';

class AddEditAddonCategoryResponse {
  AddEditAddonCategoryResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  AddonCategoryData? data;

  factory AddEditAddonCategoryResponse.fromJson(Map<String, dynamic> json) => AddEditAddonCategoryResponse(
    status: json["status"],
    message: json["message"],
    data: AddonCategoryData.fromJson(json["data"]),
    //data: AddonCategoryData.from(json["data"].map((x) => AddonCategoryData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
    //"data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}


