

import 'package:sooooperbusiness/model/more/inventory/addoncategoryitemdata.dart';

class AddEditAddonCategoryItemResponse {
  AddEditAddonCategoryItemResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  AddonItemData? data;

  factory AddEditAddonCategoryItemResponse.fromJson(Map<String, dynamic> json) => AddEditAddonCategoryItemResponse(
    status: json["status"],
    message: json["message"],
    data: AddonItemData.fromJson(json["data"]),
    //data: AddonCategoryData.from(json["data"].map((x) => AddonCategoryData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
    //"data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}


