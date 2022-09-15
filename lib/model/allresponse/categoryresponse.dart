/// status : true
/// message : "All categories fetched successfully"
/// data : ["Indian","Italian","South Indian"]

class Categoryresponse {
  bool? _status;
  String? _message;
  List<String>? _data;

  bool? get status => _status;
  String? get message => _message;
  List<String>? get data => _data;

  Categoryresponse({
      bool? status, 
      String? message, 
      List<String>? data}){
    _status = status;
    _message = message;
    _data = data;
}

  Categoryresponse.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"];
    _data = json["data"] != null ? json["data"].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["message"] = _message;
    map["data"] = _data;
    return map;
  }

}