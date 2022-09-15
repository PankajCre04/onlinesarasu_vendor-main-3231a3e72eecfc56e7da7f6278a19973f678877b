// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:sooooperbusiness/model/kycData.dart';

class KycResponse {
  KycResponse({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  KycData? data;
  String? message;

  factory KycResponse.fromJson(Map<String, dynamic> json) => KycResponse(
    success: json["success"],
    data: KycData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data!.toJson(),
    "message": message,
  };
}


