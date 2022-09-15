class Category {
  Category({
    this.parent,
    this.name,
    this.isHidden,
    this.restaurantId,
    this.image,
    this.id,
  });

  String? parent;
  String? name;
  bool? isHidden;
  String? restaurantId;
  //RestaurantId? restaurantId;
  String? image;
  String? id;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    parent: json["parent"] == null ? null : json["parent"],
    name: json["name"],
    isHidden: json["is_hidden"],
    restaurantId: json["restaurant_id"],
    //restaurantId: restaurantIdValues.map![json["restaurant_id"]],
    image: json["image"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "parent": parent == null ? null : parent,
    "name": name,
    "is_hidden": isHidden,
    //"restaurant_id": restaurantIdValues.reverse![restaurantId],
    "image": image,
    "id": id,
  };
}

