
import 'StoreCategoryData.dart';

class StoreRealCategoryResponse {
  StoreRealCategoryResponse({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  List<StoreCategoryData>? data;
  String? message;

  factory StoreRealCategoryResponse.fromJson(Map<String, dynamic> json) => StoreRealCategoryResponse(
    success: json["success"],
    data: List<StoreCategoryData>.from(json["data"].map((x) => StoreCategoryData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.image,
    this.serviceCategoryId,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? image;
  int? serviceCategoryId;
  bool? active;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    serviceCategoryId: json["service_category_id"],
    active: json["active"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "service_category_id": serviceCategoryId,
    "active": active,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
