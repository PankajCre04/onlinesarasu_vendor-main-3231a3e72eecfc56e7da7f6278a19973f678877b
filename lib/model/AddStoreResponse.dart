import 'package:sooooperbusiness/model/StoreData.dart';

class AddStoreResponse {
  AddStoreResponse({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  StoreData? data;
  String? message;

  factory AddStoreResponse.fromJson(Map<String, dynamic> json) => AddStoreResponse(
    success: json["success"],
    data: StoreData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data!.toJson(),
    "message": message,
  };
}