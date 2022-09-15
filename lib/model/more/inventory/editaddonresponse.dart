

import 'package:sooooperbusiness/model/more/inventory/addoncategoryitemdata.dart';

class EditAddonResponse {
  EditAddonResponse({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory EditAddonResponse.fromJson(Map<String, dynamic> json) => EditAddonResponse(
    status: json["status"],
    message: json["message"],
    //data: AddonCategoryData.from(json["data"].map((x) => AddonCategoryData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    //"data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}


