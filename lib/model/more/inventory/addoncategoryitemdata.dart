class AddonItemData {
  AddonItemData(
      {this.id,
      this.name,
      this.price,
      this.categoryId,
      this.v,
      this.is_active});

  String? id;
  String? name;
  int? price;
  String? categoryId;
  int? v;
  bool? is_active;

  factory AddonItemData.fromJson(Map<String, dynamic> json) => AddonItemData(
      id: json["_id"],
      name: json["name"],
      price: json["price"],
      categoryId: json["_categoryId"],
      v: json["__v"],
      is_active: json['is_active']!=null?json['is_active']:false);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "_categoryId": categoryId,
        "__v": v,
      };
}
