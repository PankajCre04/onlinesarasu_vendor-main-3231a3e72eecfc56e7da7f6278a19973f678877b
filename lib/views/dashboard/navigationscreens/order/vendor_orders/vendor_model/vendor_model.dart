// To parse this JSON data, do
//
//     final vendorOrdModel = vendorOrdModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

VendorOrdModel vendorOrdModelFromJson(String str) => VendorOrdModel.fromJson(json.decode(str));

String vendorOrdModelToJson(VendorOrdModel data) => json.encode(data.toJson());

class VendorOrdModel {
  VendorOrdModel({
    required this.success,
    required this.data,
    required this.message,
  });

  final bool success;
  final List<Datum> data;
  final String message;

  factory VendorOrdModel.fromJson(Map<String, dynamic> json) => VendorOrdModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  Datum({
    required this.id,
    required this.userId,
    required this.storeId,
    required this.serviceCategoryId,
    required this.pickupFromStore,
    required this.couponData,
    required this.orderType,
    required this.totalPrice,
    required this.discountValue,
    required this.deliveryFee,
    required this.tax,
    required this.grandTotal,
    required this.tip,
    required this.pickupAddress,
    required this.deliveryAddress,
    required this.vehicleId,
    required this.distanceTravelled,
    required this.travelTime,
    required this.preparationTime,
    required this.paymentId,
    required this.driverId,
    required this.orderStatus,
    required this.paymentStatus,
    required this.paymentMethod,
    required this.jsonData,
    required this.pickupOtp,
    required this.deliveryOtp,
    required this.adminCommission,
    required this.driverCommission,
    required this.storeCommission,
    required this.seen,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.payment,
    required this.statusTimestamps,
    required this.items,
    required this.review,
    required this.vendorOrders,
  });

  final int id;
  final int userId;
  final int storeId;
  final int serviceCategoryId;
  final bool pickupFromStore;
  final dynamic couponData;
  final int orderType;
  final int totalPrice;
  final int discountValue;
  final double deliveryFee;
  final int tax;
  final double grandTotal;
  final int tip;
  final PickupAddress pickupAddress;
  final DeliveryAddress deliveryAddress;
  final int vehicleId;
  final double distanceTravelled;
  final double travelTime;
  final int preparationTime;
  final int paymentId;
  final dynamic driverId;
  final String orderStatus;
  final String paymentStatus;
  final String paymentMethod;
  final dynamic jsonData;
  final String pickupOtp;
  final String deliveryOtp;
  final int adminCommission;
  final int driverCommission;
  final int storeCommission;
  final int seen;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;
  final Payment payment;
  final List<StatusTimestamp> statusTimestamps;
  final List<Item> items;
  final dynamic review;
  final VendorOrders vendorOrders;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        storeId: json["store_id"],
        serviceCategoryId: json["service_category_id"],
        pickupFromStore: json["pickup_from_store"],
        couponData: json["coupon_data"],
        orderType: json["order_type"],
        totalPrice: json["total_price"],
        discountValue: json["discount_value"],
        deliveryFee: json["delivery_fee"].toDouble(),
        tax: json["tax"],
        grandTotal: json["grand_total"].toDouble(),
        tip: json["tip"],
        pickupAddress: PickupAddress.fromJson(json["pickup_address"]),
        deliveryAddress: DeliveryAddress.fromJson(json["delivery_address"]),
        vehicleId: json["vehicle_id"],
        distanceTravelled: json["distance_travelled"].toDouble(),
        travelTime: json["travel_time"].toDouble(),
        preparationTime: json["preparation_time"],
        paymentId: json["payment_id"],
        driverId: json["driver_id"],
        orderStatus: json["order_status"],
        paymentStatus: json["payment_status"],
        paymentMethod: json["payment_method"],
        jsonData: json["json_data"],
        pickupOtp: json["pickup_otp"],
        deliveryOtp: json["delivery_otp"],
        adminCommission: json["admin_commission"],
        driverCommission: json["driver_commission"],
        storeCommission: json["store_commission"],
        seen: json["seen"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
        payment: Payment.fromJson(json["payment"]),
        statusTimestamps: List<StatusTimestamp>.from(json["status_timestamps"].map((x) => StatusTimestamp.fromJson(x))),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        review: json["review"],
        vendorOrders: VendorOrders.fromJson(json["vendor_orders"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "store_id": storeId,
        "service_category_id": serviceCategoryId,
        "pickup_from_store": pickupFromStore,
        "coupon_data": couponData,
        "order_type": orderType,
        "total_price": totalPrice,
        "discount_value": discountValue,
        "delivery_fee": deliveryFee,
        "tax": tax,
        "grand_total": grandTotal,
        "tip": tip,
        "pickup_address": pickupAddress.toJson(),
        "delivery_address": deliveryAddress.toJson(),
        "vehicle_id": vehicleId,
        "distance_travelled": distanceTravelled,
        "travel_time": travelTime,
        "preparation_time": preparationTime,
        "payment_id": paymentId,
        "driver_id": driverId,
        "order_status": orderStatus,
        "payment_status": paymentStatus,
        "payment_method": paymentMethod,
        "json_data": jsonData,
        "pickup_otp": pickupOtp,
        "delivery_otp": deliveryOtp,
        "admin_commission": adminCommission,
        "driver_commission": driverCommission,
        "store_commission": storeCommission,
        "seen": seen,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
        "payment": payment.toJson(),
        "status_timestamps": List<dynamic>.from(statusTimestamps.map((x) => x.toJson())),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "review": review,
        "vendor_orders": vendorOrders.toJson(),
      };
}

class DeliveryAddress {
  DeliveryAddress({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.houseNo,
    required this.building,
  });

  final int id;
  final String name;
  final String phone;
  final String address;
  final double latitude;
  final double longitude;
  final String houseNo;
  final String building;

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) => DeliveryAddress(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        address: json["address"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        houseNo: json["house_no"],
        building: json["building"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "house_no": houseNo,
        "building": building,
      };
}

class Item {
  Item({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.discountPrice,
    required this.quantity,
    required this.variantNames,
    required this.createdAt,
    required this.updatedAt,
    required this.deliveryStatus,
    required this.variants,
    required this.products,
  });

  final int id;
  final int orderId;
  final int productId;
  final String productName;
  final int productPrice;
  final int discountPrice;
  final int quantity;
  final int variantNames;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String deliveryStatus;
  final List<dynamic> variants;
  final List<Product> products;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        productName: json["product_name"],
        productPrice: json["product_price"],
        discountPrice: json["discount_price"],
        quantity: json["quantity"],
        variantNames: json["variant_names"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deliveryStatus: json["delivery_status"],
        variants: List<dynamic>.from(json["variants"].map((x) => x)),
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "product_name": productName,
        "product_price": productPrice,
        "discount_price": discountPrice,
        "quantity": quantity,
        "variant_names": variantNames,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "delivery_status": deliveryStatus,
        "variants": List<dynamic>.from(variants.map((x) => x)),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.id,
    required this.storeId,
    required this.productType,
    required this.name,
    required this.description,
    required this.image,
    required this.unit,
    required this.price,
    required this.discountPrice,
    required this.categoryId,
    required this.parentCategoryId,
    required this.sku,
    required this.productTags,
    required this.openingTime,
    required this.tax,
    required this.closingTime,
    required this.coupons,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.adminId,
    required this.variants,
  });

  final int id;
  final int storeId;
  final String productType;
  final String name;
  final String description;
  final String image;
  final String unit;
  final int price;
  final int discountPrice;
  final int categoryId;
  final int parentCategoryId;
  final int sku;
  final String productTags;
  final String openingTime;
  final dynamic tax;
  final String closingTime;
  final List<Coupon> coupons;
  final bool active;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int adminId;
  final List<dynamic> variants;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        storeId: json["store_id"],
        productType: json["product_type"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        unit: json["unit"],
        price: json["price"],
        discountPrice: json["discount_price"],
        categoryId: json["category_id"],
        parentCategoryId: json["parent_category_id"],
        sku: json["sku"],
        productTags: json["product_tags"],
        openingTime: json["opening_time"],
        tax: json["tax"],
        closingTime: json["closing_time"],
        coupons: List<Coupon>.from(json["coupons"].map((x) => Coupon.fromJson(x))),
        active: json["active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        adminId: json["admin_id"],
        variants: List<dynamic>.from(json["variants"].map((x) => x)),
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
        "parent_category_id": parentCategoryId,
        "sku": sku,
        "product_tags": productTags,
        "opening_time": openingTime,
        "tax": tax,
        "closing_time": closingTime,
        "coupons": List<dynamic>.from(coupons.map((x) => x.toJson())),
        "active": active,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "admin_id": adminId,
        "variants": List<dynamic>.from(variants.map((x) => x)),
      };
}

class Coupon {
  Coupon({
    required this.id,
    required this.storeId,
    required this.image,
    required this.code,
    required this.description,
    required this.maxUsePerUser,
    required this.minCartValue,
    required this.startDate,
    required this.endDate,
    required this.discountType,
    required this.discountValue,
    required this.maxDiscountValue,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.adminId,
  });

  final int id;
  final String storeId;
  final String image;
  final String code;
  final String description;
  final int maxUsePerUser;
  final int minCartValue;
  final DateTime startDate;
  final DateTime endDate;
  final String discountType;
  final String discountValue;
  final String maxDiscountValue;
  final bool active;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic adminId;

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        id: json["id"],
        storeId: json["store_id"],
        image: json["image"],
        code: json["code"],
        description: json["description"],
        maxUsePerUser: json["max_use_per_user"],
        minCartValue: json["min_cart_value"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        discountType: json["discount_type"],
        discountValue: json["discount_value"],
        maxDiscountValue: json["max_discount_value"],
        active: json["active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        adminId: json["admin_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store_id": storeId,
        "image": image,
        "code": code,
        "description": description,
        "max_use_per_user": maxUsePerUser,
        "min_cart_value": minCartValue,
        "start_date": startDate.toIso8601String(),
        "end_date": endDate.toIso8601String(),
        "discount_type": discountType,
        "discount_value": discountValue,
        "max_discount_value": maxDiscountValue,
        "active": active,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "admin_id": adminId,
      };
}

class Payment {
  Payment({
    required this.id,
    required this.paymentRequestId,
    required this.refNo,
    required this.userId,
    required this.userType,
    required this.orderId,
    required this.remarks,
    required this.paymentMethod,
    required this.amount,
    required this.gatewayResponse,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final dynamic paymentRequestId;
  final String refNo;
  final int userId;
  final String userType;
  final dynamic orderId;
  final String remarks;
  final String paymentMethod;
  final int amount;
  final String gatewayResponse;
  final DateTime createdAt;
  final DateTime updatedAt;

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
        gatewayResponse: json["gateway_response"],
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class PickupAddress {
  PickupAddress({
    required this.name,
    required this.serviceCategoryId,
    required this.mobile,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.isOpen,
  });

  final String name;
  final int serviceCategoryId;
  final String mobile;
  final String address;
  final String latitude;
  final String longitude;
  final bool isOpen;

  factory PickupAddress.fromJson(Map<String, dynamic> json) => PickupAddress(
        name: json["name"],
        serviceCategoryId: json["service_category_id"],
        mobile: json["mobile"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        isOpen: json["is_open"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "service_category_id": serviceCategoryId,
        "mobile": mobile,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "is_open": isOpen,
      };
}

class StatusTimestamp {
  StatusTimestamp({
    required this.id,
    required this.orderId,
    required this.status,
    required this.comment,
    required this.createdAt,
  });

  final int id;
  final int orderId;
  final String status;
  final String comment;
  final DateTime createdAt;

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
        "created_at": createdAt.toIso8601String(),
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.countryCode,
    required this.mobile,
    required this.email,
    required this.walletAmount,
    required this.profileImg,
    required this.fcmToken,
    required this.lat,
    required this.long,
    required this.status,
    required this.rating,
    required this.refCode,
    required this.refBy,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String name;
  final String countryCode;
  final String mobile;
  final String email;
  final int walletAmount;
  final dynamic profileImg;
  final String fcmToken;
  final String lat;
  final String long;
  final bool status;
  final int rating;
  final String refCode;
  final int refBy;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        countryCode: json["country_code"],
        mobile: json["mobile"],
        email: json["email"],
        walletAmount: json["wallet_amount"],
        profileImg: json["profile_img"],
        fcmToken: json["fcm_token"],
        lat: json["lat"],
        long: json["long"],
        status: json["status"],
        rating: json["rating"],
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
        "fcm_token": fcmToken,
        "lat": lat,
        "long": long,
        "status": status,
        "rating": rating,
        "ref_code": refCode,
        "ref_by": refBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class VendorOrders {
  VendorOrders({
    required this.id,
    required this.adminId,
    required this.orderId,
    required this.deliveryStatus,
    required this.productId,
    required this.variantId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final int adminId;
  final int orderId;
  final String deliveryStatus;
  final int productId;
  final int variantId;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory VendorOrders.fromJson(Map<String, dynamic> json) => VendorOrders(
        id: json["id"],
        adminId: json["admin_id"],
        orderId: json["order_id"],
        deliveryStatus: json["delivery_status"],
        productId: json["product_id"],
        variantId: json["variant_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "admin_id": adminId,
        "order_id": orderId,
        "delivery_status": deliveryStatus,
        "product_id": productId,
        "variant_id": variantId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
