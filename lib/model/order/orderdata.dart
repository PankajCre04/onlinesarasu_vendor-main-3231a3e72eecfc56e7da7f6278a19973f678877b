import 'package:sooooperbusiness/model/order/orderaddress.dart';
import 'package:sooooperbusiness/model/order/orderitem.dart';
import 'package:sooooperbusiness/model/restaurant.dart';

class OrderData {
  OrderData({
    this.driverId,
    this.orderStatus,
    this.paymentStatus,
    this.totalItems,
    this.restaurantId,
    this.itemAmount,
    this.grandTotal,
    this.tip,
    this.offerDiscountAmount,
    this.deliveryCharge,
    this.offerId,
    this.address,
    this.tax,
    this.paymentMethod,
    this.items,
    this.userId,
    this.statusTiming,
    this.id,
    this.cookingInstructions,
    this.remarks,
  });

  dynamic driverId;
  // Status? orderStatus;
  // PaymentStatus? paymentStatus;
  String? orderStatus;
  String? paymentStatus;
  int? totalItems;
  Restaurant? restaurantId;
  // String? restaurantId;
  int? itemAmount;
  int? grandTotal;
  int? tip;
  int? offerDiscountAmount;
  int? deliveryCharge;
  String? offerId;
  OrderAddress? address;
  int? tax;
  //PaymentMethod? paymentMethod;
  String? paymentMethod;
  List<OrderItem>? items;
 // UserId? userId;
  String? userId;
  List<StatusTiming>? statusTiming;
  String? id;
  String? cookingInstructions;
  String? remarks;

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
    driverId: json["driver_id"],
    // orderStatus: statusValues.map![json["orderStatus"]],
    // paymentStatus: paymentStatusValues.map![json["paymentStatus"]],
    orderStatus: json["orderStatus"],
    paymentStatus: json["paymentStatus"],
    totalItems: json["totalItems"],
    // restaurantId: restaurantIdValues.map![json["restaurant_id"]],
    restaurantId: Restaurant.fromJson(json["restaurant_id"]),
    itemAmount: json["itemAmount"],
    grandTotal: json["grandTotal"],
    tip: json["tip"],
    offerDiscountAmount: json["offerDiscountAmount"],
    deliveryCharge: json["deliveryCharge"],
    offerId: json["offerId"] == null ? null : json["offerId"],
    address: OrderAddress.fromJson(json["address"]),
    tax: json["tax"],
    // paymentMethod: paymentMethodValues.map![json["paymentMethod"]],
    paymentMethod: json["paymentMethod"],
    items: List<OrderItem>.from(json["items"].map((x) => OrderItem.fromJson(x))),
    // userId: userIdValues.map![json["user_id"]],
    userId: json["user_id"],
    statusTiming: List<StatusTiming>.from(json["status_timing"].map((x) => StatusTiming.fromJson(x))),
    id: json["id"],
    cookingInstructions: json["cooking_instructions"] == null ? null : json["cooking_instructions"],
    remarks: json["remarks"] == null ? null : json["remarks"],
  );

  Map<String, dynamic> toJson() => {
    "driver_id": driverId,
    // "orderStatus": statusValues.reverse[orderStatus],
    // "paymentStatus": paymentStatusValues.reverse[paymentStatus],
    "orderStatus": orderStatus,
    "paymentStatus": paymentStatus,
    "totalItems": totalItems,
    // "restaurant_id": restaurantIdValues.reverse[restaurantId],
    "restaurant_id": restaurantId,
    "itemAmount": itemAmount,
    "grandTotal": grandTotal,
    "tip": tip,
    "offerDiscountAmount": offerDiscountAmount,
    "deliveryCharge": deliveryCharge,
    "offerId": offerId == null ? null : offerId,
    "address": address!.toJson(),
    "tax": tax,
    // "paymentMethod": paymentMethodValues.reverse[paymentMethod],
    "paymentMethod": paymentMethod,
    "items": List<dynamic>.from(items!.map((x) => x.toJson())),
    // "user_id": userIdValues.reverse[userId],
    "user_id": userId,
    "status_timing": List<dynamic>.from(statusTiming!.map((x) => x.toJson())),
    "id": id,
    "cooking_instructions": cookingInstructions == null ? null : cookingInstructions,
    "remarks": remarks == null ? null : remarks,
  };
}

class StatusTiming {
  StatusTiming({
    this.id,
    this.status,
    this.time,
  });

  String? id;
  //Status? status;
  String? status;
  DateTime? time;

  factory StatusTiming.fromJson(Map<String, dynamic> json) => StatusTiming(
    id: json["_id"],
    //status: statusValues.map![json["status"]],
    status: json["status"],
    time: DateTime.parse(json["time"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    //"status": statusValues.reverse[status],
    "status" : status,
    "time": time!.toIso8601String(),
  };
}
