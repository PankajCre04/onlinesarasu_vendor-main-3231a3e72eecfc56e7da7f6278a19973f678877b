

class StoreStatsResponse {
  StoreStatsResponse({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  StoreStatsData? data;
  String? message;

  factory StoreStatsResponse.fromJson(Map<String, dynamic> json) => StoreStatsResponse(
    success: json["success"],
    data: StoreStatsData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data!.toJson(),
    "message": message,
  };
}

class StoreStatsData {
  StoreStatsData({
    this.storeId,
    this.storeName,
    this.storeImage,
    this.reviews,
    this.rating,
    this.coupons,
    this.products,
    this.todayOrders,
    this.totalOrders,
    this.totalEarning,
    this.todayEarnings,
    this.pendingOrders,
    this.deliveredOrders,
    this.ongoingOrders,
    this.cancelledOrders,
  });

  int? storeId;
  String? storeName;
  String? storeImage;
  int? reviews;
  int? rating;
  int? coupons;
  int? products;
  int? todayOrders;
  int? totalOrders;
  double? totalEarning;
  double? todayEarnings;
  int? pendingOrders;
  int? deliveredOrders;
  int? ongoingOrders;
  int? cancelledOrders;

  factory StoreStatsData.fromJson(Map<String, dynamic> json) => StoreStatsData(
    storeId: json["store_id"],
    storeName: json["store_name"],
    storeImage: json["store_image"],
    reviews: json["reviews"],
    rating: json["rating"],
    coupons: json["coupons"],
    products: json["products"],
    todayOrders: json["today_orders"],
    totalOrders: json["total_orders"],
    totalEarning: json["total_earnings"].toDouble(),
    todayEarnings: json["today_earnings"].toDouble(),
    pendingOrders: (json["pending_orders"] == null)?0:json["pending_orders"],
    deliveredOrders: (json["completed_orders"] == null)?0:json["completed_orders"],
    ongoingOrders: (json["ongoing_orders"] == null)?0:json["ongoing_orders"],
    cancelledOrders: (json["cancelled_orders"] == null)?0:json["cancelled_orders"],
  );

  Map<String, dynamic> toJson() => {
    "store_id": storeId,
    "store_name": storeName,
    "store_image": storeImage,
    "reviews": reviews,
    "rating": rating,
    "coupons": coupons,
    "products": products,
    "today_orders": todayOrders,
    "total_orders": totalOrders,
    "total_earnings": totalEarning,
    "today_earnings": todayEarnings,
    "pending_orders": pendingOrders,
    "delivered_orders": deliveredOrders,
    "ongoing_orders": ongoingOrders,
    "cancelled_orders": cancelledOrders,
  };
}
