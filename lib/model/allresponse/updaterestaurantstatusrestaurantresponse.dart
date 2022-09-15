import 'package:sooooperbusiness/model/restaurant.dart';

class UpdateRestaurantStatusResponse {
  bool? _status;
  String? _message;
  Restaurant? _data;

  bool? get status => _status;

  String? get message => _message;

  Restaurant? get data => _data;

  UpdateRestaurantStatusResponse({bool? status, String? message, Restaurant? data}) {
    _status = status;
    _message = message;
    _data = data;
  }

  UpdateRestaurantStatusResponse.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"];
    _data = json["data"] != null ? Restaurant.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["message"] = _message;
    if (_data != null) {
      map["data"] = _data?.toJson();
    }
    return map;
  }
}