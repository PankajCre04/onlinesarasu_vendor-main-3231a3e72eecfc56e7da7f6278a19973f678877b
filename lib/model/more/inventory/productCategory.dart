class ProductCategory {
  ProductCategory({
    this.id,
    this.name,
    this.image,
    this.parent,
    this.createdAt,
    this.updatedAt,
    this.storeId,
  });

  int? id;
  String? name;
  String? image;
  int? parent;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? storeId;

  factory ProductCategory.fromJson(Map<String, dynamic> json) => ProductCategory(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    parent: json["parent"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    storeId: json["store_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "parent": parent,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "store_id": storeId,
  };
}