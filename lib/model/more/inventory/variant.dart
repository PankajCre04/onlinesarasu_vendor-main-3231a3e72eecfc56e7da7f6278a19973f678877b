class Variant {
  Variant({
    this.id,
    this.productId,
    this.name,
    this.price,
    this.discountPrice,
    this.sku,
    this.image,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? productId;
  String? name;
  int? price;
  int? discountPrice;
  int? sku;
  String? image;
  int? active;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
    id: json["id"],
    productId: json["product_id"],
    name: json["name"],
    price: json["price"],
    discountPrice: json["discount_price"],
    sku: json["sku"],
    image: (json["image"] == null)?"":json["image"],
    active: (json["active"]!=null)?(json['active'])?1:0:0,
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "name": name,
    "price": price,
    "discount_price": discountPrice,
    "sku": sku,
    "image": image,
    "active": active,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}