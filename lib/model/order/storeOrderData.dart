class StoreOrderData {
  StoreOrderData({
    this.id,
    this.userId,
    this.storeId,
    this.serviceCategoryId,
    this.couponData,
    this.orderType,
    this.totalPrice,
    this.discountValue,
    this.deliveryFee,
    this.tax,
    this.grandTotal,
    this.pickupAddress,
    this.deliveryAddress,
    this.distanceTravelled,
    this.travelTime,
    this.paymentId,
    this.driverId,
    this.orderStatus,
    this.paymentStatus,
    this.paymentMethod,
    this.jsonData,
    this.createdAt,
    this.updatedAt,
    this.store,
    this.user,
    this.payment,
    this.driver,
    this.serviceCategory,
    this.statusTimestamps,
    this.items,
    this.pickupOtp,
    this.deliveryOtp
  });

  int? id;
  int? userId;
  int? storeId;
  int? serviceCategoryId;
  dynamic couponData;
  OrderType? orderType;
  int? totalPrice;
  double? discountValue;
  int? deliveryFee;
  double? tax;
  double? grandTotal;
  PickupAddress? pickupAddress;
  DeliveryAddress? deliveryAddress;
  dynamic distanceTravelled;
  dynamic travelTime;
  int? paymentId;
  dynamic driverId;
  String? orderStatus;
  String? paymentStatus;
  String? pickupOtp;
  String? deliveryOtp;
  String? paymentMethod;
  dynamic jsonData;
  DateTime? createdAt;
  DateTime? updatedAt;
  Store? store;
  User? user;
  Payment? payment;
  dynamic driver;
  ServiceCategory? serviceCategory;
  List<StatusTimestamp>? statusTimestamps;
  List<Item>? items;

  factory StoreOrderData.fromJson(Map<String, dynamic> json) => StoreOrderData(
    id: json["id"],
    userId: json["user_id"],
    storeId: json["store_id"],
    serviceCategoryId: json["service_category_id"],
    couponData: json["coupon_data"],
    orderType: OrderType.fromJson(json["order_type"]),
    totalPrice: json["total_price"],
    discountValue: json["discount_value"].toDouble(),
    deliveryFee: json["delivery_fee"],
    tax: json["tax"].toDouble(),
    grandTotal: json["grand_total"].toDouble(),
   pickupAddress: (json["pickup_address"] == "null")?null:PickupAddress.fromJson(json["pickup_address"]),
    deliveryAddress: (json["delivery_address"] == "null")?null:DeliveryAddress.fromJson(json["delivery_address"]),
    distanceTravelled: json["distance_travelled"],
    travelTime: json["travel_time"],
    paymentId: json["payment_id"],
    pickupOtp: (json["pickup_otp"] == null)?"":json["pickup_otp"],
    deliveryOtp: (json["delivery_otp"] == null)?"":json["delivery_otp"],
    driverId: json["driver_id"],
    orderStatus: json["order_status"],
    paymentStatus: json["payment_status"],
    paymentMethod: json["payment_method"],
    jsonData: json["json_data"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    store: json["store"]==null?null:Store.fromJson(json["store"]),
    user: (json["user"] == null)?null:User.fromJson(json["user"]),
    payment: (json["payment"] == null)?null:Payment.fromJson(json["payment"]),
    driver: json["driver"],
    serviceCategory: (json["service_category"] == null)?null:ServiceCategory.fromJson(json["service_category"]),
    statusTimestamps: List<StatusTimestamp>.from(json["status_timestamps"].map((x) => StatusTimestamp.fromJson(x))),
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "store_id": storeId,
    "service_category_id": serviceCategoryId,
    "coupon_data": couponData,
    "order_type": orderType!.toJson(),
    "total_price": totalPrice,
    "discount_value": discountValue,
    "delivery_fee": deliveryFee,
    "pickup_otp": pickupOtp,
    "delivery_otp": deliveryOtp,
    "tax": tax,
    "grand_total": grandTotal,
    "pickup_address": pickupAddress!.toJson(),
    "delivery_address": deliveryAddress!.toJson(),
    "distance_travelled": distanceTravelled,
    "travel_time": travelTime,
    "payment_id": paymentId,
    "driver_id": driverId,
    "order_status": orderStatus,
    "payment_status": paymentStatus,
    "payment_method": paymentMethod,
    "json_data": jsonData,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "store": store!.toJson(),
    "user": user!.toJson(),
    "payment": payment!.toJson(),
    "driver": driver,
    "service_category": serviceCategory!.toJson(),
    "status_timestamps": List<dynamic>.from(statusTimestamps!.map((x) => x.toJson())),
    "items": List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    this.id,
    this.orderId,
    this.productName,
    this.productPrice,
    this.discountPrice,
    this.quantity,
    this.variantNames,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? orderId;
  String? productName;
  int? productPrice;
  int? discountPrice;
  int? quantity;
  String? variantNames;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    orderId: json["order_id"],
    productName: json["product_name"],
    productPrice: json["product_price"],
    discountPrice: json["discount_price"],
    quantity: json["quantity"],
    variantNames: json["variant_names"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "product_name": productName,
    "product_price": productPrice,
    "discount_price": discountPrice,
    "quantity": quantity,
    "variant_names": variantNames,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class StatusTimestamp {
  StatusTimestamp({
    this.id,
    this.orderId,
    this.status,
    this.comment,
    this.createdAt,
  });

  int? id;
  int? orderId;
  String? status;
  String? comment;
  DateTime? createdAt;

  factory StatusTimestamp.fromJson(Map<String, dynamic> json) => StatusTimestamp(
    id: json["id"],
    orderId: json["order_id"],
    status: json["status"],
    comment: json["comment"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "status": status,
    "comment": comment,
    "created_at": createdAt!.toIso8601String(),
  };
}

class DeliveryAddress {
  DeliveryAddress({
    this.name,
    this.phone,
    this.address,
    this.latitude,
    this.longitude,
    this.houseNo,
    this.building,
  });

  String? name;
  String? phone;
  String? address;
  double? latitude;
  double? longitude;
  String? houseNo;
  String? building;

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) => DeliveryAddress(
    name: json["name"],
    phone: json["phone"],
    address: json["address"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    houseNo: json["house_no"],
    building: json["building"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "house_no": houseNo,
    "building": building,
  };
}

class OrderType {
  OrderType({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  dynamic createdAt;
  dynamic updatedAt;

  factory OrderType.fromJson(Map<String, dynamic> json) => OrderType(
    id: json["id"],
    name: json["name"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Payment {
  Payment({
    this.id,
    this.paymentRequestId,
    this.refNo,
    this.userId,
    this.userType,
    this.orderId,
    this.remarks,
    this.paymentMethod,
    this.amount,
    this.gatewayResponse,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  dynamic paymentRequestId;
  String? refNo;
  int? userId;
  String? userType;
  dynamic orderId;
  String? remarks;
  String? paymentMethod;
  int? amount;
  String? gatewayResponse;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    id: json["id"],
    paymentRequestId: json["payment_request_id"],
    refNo: json["ref_no"],
    userId: json["user_id"],
    userType: json["user_type"],
    orderId: json["order_id"],
    remarks: json["remarks"],
    paymentMethod: json["payment_method"],
    amount: json["amount"],
    // gatewayResponse: (json["gateway_response"] == "" || )json["gateway_response"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "payment_request_id": paymentRequestId,
    "ref_no": refNo,
    "user_id": userId,
    "user_type": userType,
    "order_id": orderId,
    "remarks": remarks,
    "payment_method": paymentMethod,
    "amount": amount,
    "gateway_response": gatewayResponse,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class PickupAddress {
  PickupAddress({
    this.name,
    this.serviceCategoryId,
    this.mobile,
    this.address,
    this.latitude,
    this.longitude,
  });

  String? name;
  int? serviceCategoryId;
  String? mobile;
  String? address;
  String? latitude;
  String? longitude;

  factory PickupAddress.fromJson(Map<String, dynamic> json) => PickupAddress(
    name: json["name"],
    serviceCategoryId: json["service_category_id"],
    mobile: json["mobile"],
    address: json["address"],
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "service_category_id": serviceCategoryId,
    "mobile": mobile,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
  };
}

class ServiceCategory {
  ServiceCategory({
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
  String? homeView;
  String? name;
  String? description;
  int? serviceTypeId;
  int? discount;
  int? commission;
  String? minPrice;
  String? driverRadius;
  dynamic baseDistance;
  dynamic basePrice;
  dynamic baseKm;
  dynamic priceKm;
  int? maxOrderDistance;
  bool? active;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ServiceCategory.fromJson(Map<String, dynamic> json) => ServiceCategory(
    id: json["id"],
    icon: json["icon"],
    bgImage: json["bg_image"],
    homeView: json["home_view"],
    name: json["name"],
    description: json["description"],
    serviceTypeId: json["service_type_id"],
    discount: json["discount"],
    commission: json["commission"],
    minPrice: json["min_price"],
    driverRadius: json["driver_radius"],
    baseDistance: json["base_distance"],
    basePrice: json["base_price"],
    baseKm: json["base_km"],
    priceKm: json["price_km"],
    maxOrderDistance: json["max_order_distance"],
    active: json["active"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "icon": icon,
    "bg_image": bgImage,
    "home_view": homeView,
    "name": name,
    "description": description,
    "service_type_id": serviceTypeId,
    "discount": discount,
    "commission": commission,
    "min_price": minPrice,
    "driver_radius": driverRadius,
    "base_distance": baseDistance,
    "base_price": basePrice,
    "base_km": baseKm,
    "price_km": priceKm,
    "max_order_distance": maxOrderDistance,
    "active": active,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class Store {
  Store({
    this.id,
    this.adminId,
    this.serviceCategoryId,
    this.storeCategories,
    this.name,
    this.description,
    this.image,
    this.latitude,
    this.longitude,
    this.address,
    this.deliveryRange,
    this.baseDistance,
    this.basePrice,
    this.pricePerKm,
    this.mobile,
    this.email,
    this.orderCount,
    this.gstDoc,
    this.panDoc,
    this.foodLicense,
    this.shopPhoto,
    this.commission,
    this.tax,
    this.isOpen,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? adminId;
  int? serviceCategoryId;
  String? storeCategories;
  String? name;
  String? description;
  String? image;
  String? latitude;
  String? longitude;
  String? address;
  int? deliveryRange;
  int? baseDistance;
  int? basePrice;
  int? pricePerKm;
  String? mobile;
  String? email;
  int? orderCount;
  dynamic gstDoc;
  dynamic panDoc;
  dynamic foodLicense;
  dynamic shopPhoto;
  int? commission;
  int? tax;
  bool? isOpen;
  bool? active;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    adminId: json["admin_id"],
    serviceCategoryId: json["service_category_id"],
    storeCategories: json["store_categories"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    address: json["address"],
    deliveryRange: json["delivery_range"],
    baseDistance: json["base_distance"],
    basePrice: json["base_price"],
    pricePerKm: json["price_per_km"],
    mobile: json["mobile"],
    email: json["email"],
    orderCount: json["order_count"],
    gstDoc: json["gst_doc"],
    panDoc: json["pan_doc"],
    foodLicense: json["food_license"],
    shopPhoto: json["shop_photo"],
    commission: json["commission"],
    tax: json["tax"],
    isOpen: json["is_open"],
    active: json["active"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "admin_id": adminId,
    "service_category_id": serviceCategoryId,
    "store_categories": storeCategories,
    "name": name,
    "description": description,
    "image": image,
    "latitude": latitude,
    "longitude": longitude,
    "address": address,
    "delivery_range": deliveryRange,
    "base_distance": baseDistance,
    "base_price": basePrice,
    "price_per_km": pricePerKm,
    "mobile": mobile,
    "email": email,
    "order_count": orderCount,
    "gst_doc": gstDoc,
    "pan_doc": panDoc,
    "food_license": foodLicense,
    "shop_photo": shopPhoto,
    "commission": commission,
    "tax": tax,
    "is_open": isOpen,
    "active": active,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class User {
  User({
    this.id,
    this.name,
    this.countryCode,
    this.mobile,
    this.email,
    this.walletAmount,
    this.profileImg,
    this.lat,
    this.long,
    this.status,
    this.refCode,
    this.refBy,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? countryCode;
  String? mobile;
  dynamic email;
  dynamic walletAmount;
  dynamic profileImg;
  dynamic lat;
  dynamic long;
  bool? status;
  dynamic refCode;
  dynamic refBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    countryCode: json["country_code"],
    mobile: json["mobile"],
    email: json["email"],
    walletAmount: json["wallet_amount"],
    profileImg: json["profile_img"],
    lat: json["lat"],
    long: json["long"],
    status: json["status"],
    refCode: json["ref_code"],
    refBy: json["ref_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country_code": countryCode,
    "mobile": mobile,
    "email": email,
    "wallet_amount": walletAmount,
    "profile_img": profileImg,
    "lat": lat,
    "long": long,
    "status": status,
    "ref_code": refCode,
    "ref_by": refBy,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}