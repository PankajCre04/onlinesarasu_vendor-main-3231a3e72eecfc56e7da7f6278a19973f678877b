class OfferData {
  OfferData({
    this.id,
    this.storeId,
    this.image,
    this.code,
    this.description,
    this.maxUsePerUser,
    this.minCartValue,
    this.startDate,
    this.endDate,
    this.discountType,
    this.discountValue,
    this.maxDiscountValue,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? storeId;
  String? image;
  String? code;
  String? description;
  int? maxUsePerUser;
  int? minCartValue;
  DateTime? startDate;
  DateTime? endDate;
  String? discountType;
  String? discountValue;
  String? maxDiscountValue;
  bool? active;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory OfferData.fromJson(Map<String, dynamic> json) => OfferData(
    id: json["id"],
    storeId: json["store_id"],
    image: (json["image"] == null)?"":json["image"],
    code: json["code"],
    description: json["description"],
    maxUsePerUser: json["max_use_per_user"],
    minCartValue: json["min_cart_value"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    discountType: json["discount_type"],
    discountValue: json["discount_value"],
    maxDiscountValue: json["max_discount_value"],
    active: json["active"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "store_id": storeId,
    "image": image,
    "code": code,
    "description": description,
    "max_use_per_user": maxUsePerUser,
    "min_cart_value": minCartValue,
    "start_date": startDate!.toIso8601String(),
    "end_date": endDate!.toIso8601String(),
    "discount_type": discountType,
    "discount_value": discountValue,
    "max_discount_value": maxDiscountValue,
    "active": active,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}