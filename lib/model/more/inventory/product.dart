import 'package:sooooperbusiness/model/more/inventory/variant.dart';

class Product {
  Product({
    this.id,
    this.storeId,
    this.productType,
    this.name,
    this.description,
    this.image,
    this.unit,
    this.price,
    this.discountPrice,
    this.categoryId,
    this.opening_Time,
    this.closing_Time,
    this.sku,
    this.productTags,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.variants,
  });

  int? id;
  int? storeId;
  String? productType;
  String? name;
  String? description;
  String? image;
  String? unit;
  int? price;
  int? discountPrice;
  int? categoryId;
  String? opening_Time;
  String? closing_Time;
  int? sku;
  String? productTags;
  bool? active;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Variant>? variants;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    storeId: json["store_id"],
    productType: json["product_type"],
    name: json["name"],
    description: json["description"],
    image: (json["image"]==null)?'':json["image"],
    unit: json["unit"],
    price: json["price"],
    discountPrice: json["discount_price"],
    categoryId: json["category_id"],
    opening_Time: json["opening_time"],
    closing_Time: json["closing_time"],
    sku: json["sku"],
    productTags: json["product_tags"],
    active: json["active"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    variants: (json["variants"] == null)?null:List<Variant>.from(json["variants"].map((x) => Variant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "store_id": storeId,
    "product_type": productType,
    "name": name,
    "description": description,
    "image": image,
    "unit": unit,
    "price": price,
    "discount_price": discountPrice,
    "category_id": categoryId,
    "opening_time": opening_Time,
    "closing_time": closing_Time,
    "sku": sku,
    "product_tags": productTags,
    "active": active,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "variants": List<dynamic>.from(variants!.map((x) => x.toJson())),
  };
}