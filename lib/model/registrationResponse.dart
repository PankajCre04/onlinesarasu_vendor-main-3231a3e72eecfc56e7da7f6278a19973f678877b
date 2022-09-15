// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);


import 'package:sooooperbusiness/model/OwnerData.dart';

class RegistrationResponse {
  RegistrationResponse({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  OwnerData? data;
  String? message;

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) => RegistrationResponse(
    success: json["success"],
    data: OwnerData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data!.toJson(),
    "message": message,
  };
}


