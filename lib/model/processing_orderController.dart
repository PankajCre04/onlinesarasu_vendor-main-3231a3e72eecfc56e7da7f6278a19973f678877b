import 'package:flutter/material.dart';

class OrderDetail {

  OrderDetail(
    this.OrderType,
    this.OrderCustomerName,
    this.OrderId,
    this.OrderTime,
      this.Total,
);
  String? OrderType;
  String? OrderCustomerName;
  String? OrderId;
  String? OrderTime;
  String? Total;

  Map toJson() => {
    'OrderType': OrderType,
    'OrderCustomerName': OrderCustomerName,
    'OrderId': OrderId,
    'OrderTime': OrderTime,
    "Total" : Total,
  };
}

class OrderProduct{
  OrderProduct(
    this.quantity,
    this.productName,
    this.price
);
  String? quantity;
  String? productName;
  String? price;

  Map toJson() => {
    'quantity': quantity,
    'productName': productName,
    'price': price,
  };
}

List<OrderDetail> detail = [
  OrderDetail("Take Away","Rehan Patil","100000043986","2:40 PM","576"),
  OrderDetail("Delivery", "Sachin Ghaware", "100000043999", "2:50 PM","190")
];

List<OrderProduct> TakeAway = [
  OrderProduct("1", "Veg Kohapuri", "190"),
  OrderProduct("2", "Masala Papad", "120"),
  OrderProduct("6", "Butter Roti", "150"),
  OrderProduct("3", "Amul Icecream", "90"),
];

List<OrderProduct> Delivery = [
  OrderProduct("2", "Amul Ice Cream", "190")
];