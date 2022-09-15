import 'package:sooooperbusiness/model/more/inventory/variant.dart';

class AddVariantResponse {
  AddVariantResponse({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Variant? data;
  String? message;

  factory AddVariantResponse.fromJson(Map<String, dynamic> json) => AddVariantResponse(
    success: json["success"],
    data: (json["data"] ==null)?null:Variant.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data!.toJson(),
    "message": message,
  };
}
