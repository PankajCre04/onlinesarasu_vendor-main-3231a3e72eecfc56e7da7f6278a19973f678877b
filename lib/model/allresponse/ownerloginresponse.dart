import 'package:sooooperbusiness/model/owner.dart';

/// owner : {"business_type":["RESTAURANT"],"approved":false,"blocked":false,"role":"owner","name":"TestOwner","phone":"98765432101","email":"testowner1@gmail.com","latitude":"12.23231231","longitude":"78.092132","cf1":"CF1","cf2":"CF2","cf3":"CF3","bank_name":"SBI","ac_no":"1234567890123456","ifsc_code":"LOKEJ12903","address":"Test Address","pan_no":"BWLWQ1234F","address_proof_img":"uploads/owners/address_proof_img-1625815067818logo.png","cancel_cheque_img":"uploads/owners/cancel_cheque_img-1625815067819rocketchat.png","gst_certificate_img":"uploads/owners/gst_certificate_img-1625815067820Screenshot 2021-07-06 at 11.26.34 AM.png","profile_img":"uploads/owners/profile_img-1625815067817rocketchat.png","aadhar_card_img":"uploads/owners/aadhar_card_img-1625815067812logo.png","pan_card_img":"uploads/owners/pan_card_img-1625815067816Screenshot 2021-07-07 at 11.14.35 AM.png","id":"60e7f81cc3b89005d376a974"}
/// tokens : {"access":{"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGU3ZjgxY2MzYjg5MDA1ZDM3NmE5NzQiLCJpYXQiOjE2MjU4NTc3NzYsImV4cCI6MTY4NTg1NzcxNiwidHlwZSI6ImFjY2VzcyJ9.KSNrFUbO5IhBl6K0LlqnVOvRGpsySzErpa1ZrLpyU2k","expires":"2023-06-04T05:48:36.459Z"},"refresh":{"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGU3ZjgxY2MzYjg5MDA1ZDM3NmE5NzQiLCJpYXQiOjE2MjU4NTc3NzYsImV4cCI6MTYyODQ0OTc3NiwidHlwZSI6InJlZnJlc2gifQ.73HBSm-Ej5IOjn0ttKZAwSDAna3vsXRUtTt6PpZ0sC4","expires":"2021-08-08T19:09:36.464Z"}}

class Ownerloginresponse {
  bool? status;
  String? message;
  int? statusCode;
  Owner? _owner;
  Tokens? _tokens;

  Owner? get owner => _owner;

  // bool? get status => _owner;

  Tokens? get tokens => _tokens;

  Ownerloginresponse({Owner? owner,
    Tokens? tokens,
    bool? status,
    String? message,
    int? statusCode}) {
    _owner = owner;
    _tokens = tokens;
    this.status = status;
    this.message = message;
    this.statusCode = statusCode;
  }

  Ownerloginresponse.fromJson(dynamic json) {
    if (json["data"] != null) {
      _owner = json["data"]['owner'] != null
          ? Owner.fromJson(json["data"]['owner'])
          : null;
      _tokens = json['data']["tokens"] != null
          ? Tokens.fromJson(json['data']["tokens"])
          : null;
    } else {
      _owner = null;
      _tokens = null;
    }


    status = json['status'] != null ? json['status'] : true;
    message = json['message'] != null ? json['message'] : "";
    statusCode = json['code'] != null ? json['code'] : 200;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_owner != null) {
      map["data"] = _owner?.toJson();
    }
    if (_tokens != null) {
      map["tokens"] = _tokens?.toJson();
    }
    return map;
  }
}

/// access : {"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGU3ZjgxY2MzYjg5MDA1ZDM3NmE5NzQiLCJpYXQiOjE2MjU4NTc3NzYsImV4cCI6MTY4NTg1NzcxNiwidHlwZSI6ImFjY2VzcyJ9.KSNrFUbO5IhBl6K0LlqnVOvRGpsySzErpa1ZrLpyU2k","expires":"2023-06-04T05:48:36.459Z"}
/// refresh : {"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGU3ZjgxY2MzYjg5MDA1ZDM3NmE5NzQiLCJpYXQiOjE2MjU4NTc3NzYsImV4cCI6MTYyODQ0OTc3NiwidHlwZSI6InJlZnJlc2gifQ.73HBSm-Ej5IOjn0ttKZAwSDAna3vsXRUtTt6PpZ0sC4","expires":"2021-08-08T19:09:36.464Z"}

class Tokens {
  Access? _access;
  Refresh? _refresh;

  Access? get access => _access;

  Refresh? get refresh => _refresh;

  Tokens({Access? access, Refresh? refresh}) {
    _access = access;
    _refresh = refresh;
  }

  Tokens.fromJson(dynamic json) {
    _access = json["access"] != null ? Access.fromJson(json["access"]) : null;
    _refresh =
    json["refresh"] != null ? Refresh.fromJson(json["refresh"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_access != null) {
      map["access"] = _access?.toJson();
    }
    if (_refresh != null) {
      map["refresh"] = _refresh?.toJson();
    }
    return map;
  }
}

/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGU3ZjgxY2MzYjg5MDA1ZDM3NmE5NzQiLCJpYXQiOjE2MjU4NTc3NzYsImV4cCI6MTYyODQ0OTc3NiwidHlwZSI6InJlZnJlc2gifQ.73HBSm-Ej5IOjn0ttKZAwSDAna3vsXRUtTt6PpZ0sC4"
/// expires : "2021-08-08T19:09:36.464Z"

class Refresh {
  String? _token;
  String? _expires;

  String? get token => _token;

  String? get expires => _expires;

  Refresh({String? token, String? expires}) {
    _token = token;
    _expires = expires;
  }

  Refresh.fromJson(dynamic json) {
    _token = json["token"];
    _expires = json["expires"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["token"] = _token;
    map["expires"] = _expires;
    return map;
  }
}

/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGU3ZjgxY2MzYjg5MDA1ZDM3NmE5NzQiLCJpYXQiOjE2MjU4NTc3NzYsImV4cCI6MTY4NTg1NzcxNiwidHlwZSI6ImFjY2VzcyJ9.KSNrFUbO5IhBl6K0LlqnVOvRGpsySzErpa1ZrLpyU2k"
/// expires : "2023-06-04T05:48:36.459Z"

class Access {
  String? _token;
  String? _expires;

  String? get token => _token;

  String? get expires => _expires;

  Access({String? token, String? expires}) {
    _token = token;
    _expires = expires;
  }

  Access.fromJson(dynamic json) {
    _token = json["token"];
    _expires = json["expires"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["token"] = _token;
    map["expires"] = _expires;
    return map;
  }
}

/// business_type : ["RESTAURANT"]
/// approved : false
/// blocked : false
/// role : "owner"
/// name : "TestOwner"
/// phone : "98765432101"
/// email : "testowner1@gmail.com"
/// latitude : "12.23231231"
/// longitude : "78.092132"
/// cf1 : "CF1"
/// cf2 : "CF2"
/// cf3 : "CF3"
/// bank_name : "SBI"
/// ac_no : "1234567890123456"
/// ifsc_code : "LOKEJ12903"
/// address : "Test Address"
/// pan_no : "BWLWQ1234F"
/// address_proof_img : "uploads/owners/address_proof_img-1625815067818logo.png"
/// cancel_cheque_img : "uploads/owners/cancel_cheque_img-1625815067819rocketchat.png"
/// gst_certificate_img : "uploads/owners/gst_certificate_img-1625815067820Screenshot 2021-07-06 at 11.26.34 AM.png"
/// profile_img : "uploads/owners/profile_img-1625815067817rocketchat.png"
/// aadhar_card_img : "uploads/owners/aadhar_card_img-1625815067812logo.png"
/// pan_card_img : "uploads/owners/pan_card_img-1625815067816Screenshot 2021-07-07 at 11.14.35 AM.png"
/// id : "60e7f81cc3b89005d376a974"
