class OrderItem {
  OrderItem({
    this.images,
    this.id,
    this.vegNonveg,
    this.name,
    this.itemId,
    this.quantity,
  });

  List<String>? images;
  String? id;
  // VegNonveg? vegNonveg;
  // ItemName? name;
  // Id? itemId;
  String? vegNonveg;
  String? name;
  String? itemId;
  int? quantity;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    images: List<String>.from(json["images"].map((x) => x)),
    id: json["_id"],
    // vegNonveg: vegNonvegValues.map![json["veg_nonveg"]],
    // name: itemNameValues.map![json["name"]],
    // itemId: idValues.map![json["id"]],
    vegNonveg: json["veg_nonveg"],
    name: json["name"],
    itemId: json["id"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "images": List<dynamic>.from(images!.map((x) => x)),
    "_id": id,
    // "veg_nonveg": vegNonvegValues.reverse[vegNonveg],
    // "name": itemNameValues.reverse[name],
    // "id": idValues.reverse[itemId],
    "veg_nonveg": vegNonveg,
    "name" : name,
    "id" : itemId,
    "quantity": quantity,
  };
}