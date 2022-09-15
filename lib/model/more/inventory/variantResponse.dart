import 'package:sooooperbusiness/model/more/inventory/variant.dart';

class VariantResponse {
  VariantResponse({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  List<Variant>? data;
  String? message;

  factory VariantResponse.fromJson(Map<String, dynamic> json) => VariantResponse(
    success: json["success"],
    data: List<Variant>.from(json["data"].map((x) => Variant.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}


