
class StoreCategoryData {
  StoreCategoryData({
    this.id,
    this.icon,
    this.bgImage,
    this.homeView,
    this.name,
    this.description,
    this.serviceTypeId,
    this.discount,
    this.commission,
    this.minPrice,
    this.driverRadius,
    this.baseDistance,
    this.basePrice,
    this.baseKm,
    this.priceKm,
    this.maxOrderDistance,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? icon;
  String? bgImage;
  HomeView? homeView;
  String? name;
  String? description;
  int? serviceTypeId;
  int? discount;
  int? commission;
  String? minPrice;
  String? driverRadius;
  int? baseDistance;
  int? basePrice;
  int? baseKm;
  int? priceKm;
  int? maxOrderDistance;
  bool? active;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory StoreCategoryData.fromJson(Map<String, dynamic> json) => StoreCategoryData(
    id: json["id"],
    icon: json["icon"],
    bgImage: json["bg_image"],
    homeView: homeViewValues.map![json["home_view"]],
    name: json["name"],
    description: json["description"],
    serviceTypeId: json["service_type_id"],
    discount: json["discount"],
    commission: json["commission"],
    minPrice: json["min_price"],
    driverRadius: json["driver_radius"],
    baseDistance: json["base_distance"] == null ? null : json["base_distance"],
    basePrice: json["base_price"] == null ? null : json["base_price"],
    baseKm: json["base_km"] == null ? null : json["base_km"],
    priceKm: json["price_km"] == null ? null : json["price_km"],
    maxOrderDistance: json["max_order_distance"],
    active: json["active"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "icon": icon,
    "bg_image": bgImage,
    "home_view": homeViewValues.reverse[homeView],
    "name": name,
    "description": description,
    "service_type_id": serviceTypeId,
    "discount": discount,
    "commission": commission,
    "min_price": minPrice,
    "driver_radius": driverRadius,
    "base_distance": baseDistance == null ? null : baseDistance,
    "base_price": basePrice == null ? null : basePrice,
    "base_km": baseKm == null ? null : baseKm,
    "price_km": priceKm == null ? null : priceKm,
    "max_order_distance": maxOrderDistance,
    "active": active,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

enum HomeView { BANNER, BACKGROUND, CARD }

final homeViewValues = EnumValues({
  "BACKGROUND": HomeView.BACKGROUND,
  "BANNER": HomeView.BANNER,
  "CARD": HomeView.CARD
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}