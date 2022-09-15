/// is_default : false
/// user_id : "60f17aa02fca9c0020474d53"
/// name : "Anubhav Anand"
/// phone : "1234567890"
/// full_address : "ABCD, EDFG, Gurugram, Haryana"
/// city : "Gurugram"
/// state : "Haryana"
/// pin_code : "122001"
/// type : "aaa"
/// lat : "22.15"
/// long : "78.33"
/// id : "60f999d52765a9002046d433"

class AddressModel {
  bool? _isDefault;
  String? _userId;
  String? _name;
  String? _phone;
  String? _fullAddress;
  String? _city;
  String? _state;
  String? _pinCode;
  String? _type;
  double? _lat;
  double? _long;
  String? _id;
  String? _locality;
  String? _floor_building;

  bool? get isDefault => _isDefault;

  String? get userId => _userId;

  String? get name => _name;

  String? get phone => _phone;

  String? get fullAddress => _fullAddress;

  String? get city => _city;

  String? get state => _state;

  String? get pinCode => _pinCode;

  String? get type => _type;

  double? get lat => _lat;

  double? get long => _long;

  String? get id => _id;

  String? get locality => _locality;

  String? get floor_building => _floor_building;

  void changeDefault(bool status) {
    this._isDefault = status;
  }

  AddressModel(
      {bool? isDefault,
      String? userId,
      String? name,
      String? phone,
      String? fullAddress,
      String? city,
      String? state,
      String? pinCode,
      String? type,
      double? lat,
      double? long,
      String? id,
      String? locality,
      String? floor_building}) {
    _isDefault = isDefault;
    _userId = userId;
    _name = name;
    _phone = phone;
    _fullAddress = fullAddress;
    _city = city;
    _state = state;
    _pinCode = pinCode;
    _type = type;
    _lat = lat;
    _long = long;
    _id = id;
    _locality = locality;
    _floor_building = floor_building;
  }

  AddressModel.fromJson(dynamic json) {
    if (json["is_default"] != null) {
      _isDefault = json["is_default"];
    } else {
      _isDefault = true;
    }
    if (json["user_id"] != null) {
      _userId = json["user_id"];
    }

    _name = json["name"];
    _phone = json["phone"];
    _fullAddress = json["full_address"];
    _city = json["city"];
    _state = json["state"];
    _pinCode = json["pin_code"];
    _type = json["type"];
    _lat = double.parse(json["lat"].toString());
    _long = double.parse(json["long"].toString());
    if(json["id"]!=null){
      _id = json["id"];
    }
    else{
      _id = json["_id"];
    }

    _locality = json["locality"];
    _floor_building = json['floor_building'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};

    map["is_default"] = _isDefault;
    // map["user_id"] = _userId;
    map["name"] = _name;
    map["phone"] = _phone;
    map["full_address"] = _fullAddress;
    map["city"] = _city;
    map["state"] = _state;
    map["pin_code"] = _pinCode;
    map["type"] = _type;
    map["lat"] = _lat;
    map["long"] = _long;
    map['locality'] = _locality;
    map['floor_building'] = _floor_building;
    return map;
  }

  Map<String, dynamic> toOrderJson() {
    var map = <String, dynamic>{};
    // map["is_default"] = _isDefault;
    // map["user_id"] = _userId;
    map["name"] = _name;
    map["phone"] = _phone;
    map["full_address"] = _fullAddress;
    map["city"] = _city;
    map["state"] = _state;
    map["pin_code"] = _pinCode;
    map["type"] = _type;
    map["lat"] = _lat;
    map["long"] = _long;
    map['locality'] = _locality;
    map['floor_building'] = _floor_building;
    return map;
  }
}
