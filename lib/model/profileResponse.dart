// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);


import 'OwnerData.dart';

class ProfileResponse {
  ProfileResponse({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  OwnerData? data;
  String? message;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => ProfileResponse(
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

