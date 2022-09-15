

class CategoryResponse {
  CategoryResponse({
    this.results,
    this.page,
    this.limit,
    this.totalPages,
    this.totalResults,
  });

  List<Category>? results = [];
  int? page;
  int? limit;
  int? totalPages;
  int? totalResults;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => CategoryResponse(
    //results: Result.fromJson(json["results"]),
    results: List<Category>.from(json["results"].map((x) => Category.fromJson(x))),
    page: json["page"],
    limit: json["limit"],
    totalPages: json["totalPages"],
    totalResults: json["totalResults"],
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results!.map((x) => x.toJson())),
    //"data": results!.toJson(),
    "page": page,
    "limit": limit,
    "totalPages": totalPages,
    "totalResults": totalResults,
  };
}

class Category {
  Category({
    this.parent,
    this.name,
    this.isHidden,
    this.restaurantId,
    this.image,
    this.id,
  });

  //dynamic parent;
  String? parent;
  String? name;
  bool? isHidden;
  String? restaurantId;
  String? image;
  String? id;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    parent: json["parent"],
    name: json["name"],
    isHidden: json["is_hidden"],
    restaurantId: json["restaurant_id"],
    image: json["image"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "parent": parent,
    "name": name,
    "is_hidden": isHidden,
    "restaurant_id": restaurantId,
    "image": image,
    "id": id,
  };
}
