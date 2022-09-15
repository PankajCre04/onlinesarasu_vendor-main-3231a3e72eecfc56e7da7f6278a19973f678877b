import 'package:sooooperbusiness/model/restaurant.dart';

/// status : true
/// message : "Restaurant created successfully"
/// data : {"category":["Indian"],"gallery_image":["uploads/restaurants/gallery_image-1626507828755tfd-1606307415909.jpg"],"is_featured":false,"veg_only":false,"delivery_radius":5,"delivery_charge_type":"Fixed","fixed_delivery_charge":40,"dine_in_enabled":true,"take_away_enabled":true,"delivery_enabled":true,"open_time":["9"],"closing_time":["21"],"name":"Test Restaurant","description":"Restaurant Description","avgDeliveryTime":"30","aprx_price_for_two":"500","full_address":"ABCD","pin_code":"123456","landmark":"Landmark","min_order_price":300,"base_delivery_charge":"10","base_delivery_distance":"10","extra_delivery_charge":"10","extra_delivery_distance":"10","restaurant_phone":"+91 9837318313","restaurant_phone_secondary":"+91 9837318313","image":"uploads/restaurants/image-1626507829838tfd-1606307415909 (1).jpg","id":"60f28a362a03eb0020325daa"}

class AllRestaurantResponse {
  bool? _status;
  String? _message;
  List<Restaurant>? _data;

  bool? get status => _status;

  String? get message => _message;

  List<Restaurant>? get data => _data;

  AllRestaurantResponse(
      {bool? status, String? message, List<Restaurant>? data}) {
    _status = status;
    _message = message;
    _data = data;
  }

  AllRestaurantResponse.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"];
    _data = new List<Restaurant>.empty(growable: true);
    if (json["data"] != null) {
      if (json["data"]['results'] != null) {
        json["data"]['results'].forEach((v) {
          _data!.add(new Restaurant.fromJson(v));
        });
      }
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["message"] = _message;
    if (_data != null) {
      map["data"] = _data?.map((e) => e.toJson());
    }
    return map;
  }
}

/// category : ["Indian"]
/// gallery_image : ["uploads/restaurants/gallery_image-1626507828755tfd-1606307415909.jpg"]
/// is_featured : false
/// veg_only : false
/// delivery_radius : 5
/// delivery_charge_type : "Fixed"
/// fixed_delivery_charge : 40
/// dine_in_enabled : true
/// take_away_enabled : true
/// delivery_enabled : true
/// open_time : ["9"]
/// closing_time : ["21"]
/// name : "Test Restaurant"
/// description : "Restaurant Description"
/// avgDeliveryTime : "30"
/// aprx_price_for_two : "500"
/// full_address : "ABCD"
/// pin_code : "123456"
/// landmark : "Landmark"
/// min_order_price : 300
/// base_delivery_charge : "10"
/// base_delivery_distance : "10"
/// extra_delivery_charge : "10"
/// extra_delivery_distance : "10"
/// restaurant_phone : "+91 9837318313"
/// restaurant_phone_secondary : "+91 9837318313"
/// image : "uploads/restaurants/image-1626507829838tfd-1606307415909 (1).jpg"
/// id : "60f28a362a03eb0020325daa"
