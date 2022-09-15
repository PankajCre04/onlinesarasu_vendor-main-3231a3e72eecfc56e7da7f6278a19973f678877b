class Restaurant {
  List<String>? _category;
  List<String>? _galleryImage;
  bool? _isFeatured;
  bool? _vegOnly;
  int? _deliveryRadius;
  String? _deliveryChargeType;
  int? _fixedDeliveryCharge;
  bool? _dineInEnabled;
  bool? _takeAwayEnabled;
  bool? _deliveryEnabled;
  List<String>? _openTime;
  List<String>? _closingTime;
  String? _name;
  String? _description;
  String? _avgDeliveryTime;
  String? _aprxPriceForTwo;
  String? _fullAddress;
  String? _pinCode;
  String? _landmark;
  int? _minOrderPrice;
  String? _baseDeliveryCharge;
  String? _baseDeliveryDistance;
  String? _extraDeliveryCharge;
  String? _extraDeliveryDistance;
  String? _restaurantPhone;
  String? _restaurantPhoneSecondary;
  String? _image;
  String? _id;
  double? _latitude;
  double? _longitude;
  bool? _isOpen;

  List<String>? get category => _category;

  List<String>? get galleryImage => _galleryImage;

  bool? get isFeatured => _isFeatured;

  bool? get vegOnly => _vegOnly;

  int? get deliveryRadius => _deliveryRadius;

  String? get deliveryChargeType => _deliveryChargeType;

  int? get fixedDeliveryCharge => _fixedDeliveryCharge;

  bool? get dineInEnabled => _dineInEnabled;

  bool? get takeAwayEnabled => _takeAwayEnabled;

  bool? get deliveryEnabled => _deliveryEnabled;

  List<String>? get openTime => _openTime;

  List<String>? get closingTime => _closingTime;

  String? get name => _name;

  String? get description => _description;

  String? get avgDeliveryTime => _avgDeliveryTime;

  String? get aprxPriceForTwo => _aprxPriceForTwo;

  String? get fullAddress => _fullAddress;

  String? get pinCode => _pinCode;

  String? get landmark => _landmark;

  int? get minOrderPrice => _minOrderPrice;

  String? get baseDeliveryCharge => _baseDeliveryCharge;

  String? get baseDeliveryDistance => _baseDeliveryDistance;

  String? get extraDeliveryCharge => _extraDeliveryCharge;

  String? get extraDeliveryDistance => _extraDeliveryDistance;

  String? get restaurantPhone => _restaurantPhone;

  String? get restaurantPhoneSecondary => _restaurantPhoneSecondary;

  String? get image => _image;

  String? get id => _id;

  double? get latitude => _latitude;

  double? get longitude => _longitude;

  bool? get isOpen => _isOpen;

  Restaurant({
    List<String>? category,
    List<String>? galleryImage,
    bool? isFeatured,
    bool? vegOnly,
    int? deliveryRadius,
    String? deliveryChargeType,
    int? fixedDeliveryCharge,
    bool? dineInEnabled,
    bool? takeAwayEnabled,
    bool? deliveryEnabled,
    List<String>? openTime,
    List<String>? closingTime,
    String? name,
    String? description,
    String? avgDeliveryTime,
    String? aprxPriceForTwo,
    String? fullAddress,
    String? pinCode,
    String? landmark,
    int? minOrderPrice,
    String? baseDeliveryCharge,
    String? baseDeliveryDistance,
    String? extraDeliveryCharge,
    String? extraDeliveryDistance,
    String? restaurantPhone,
    String? restaurantPhoneSecondary,
    String? image,
    String? id,
    double? latitude,
    double? longitude,
    bool? isOpen,
  }) {
    _category = category;
    _galleryImage = galleryImage;
    _isFeatured = isFeatured;
    _vegOnly = vegOnly;
    _deliveryRadius = deliveryRadius;
    _deliveryChargeType = deliveryChargeType;
    _fixedDeliveryCharge = fixedDeliveryCharge;
    _dineInEnabled = dineInEnabled;
    _takeAwayEnabled = takeAwayEnabled;
    _deliveryEnabled = deliveryEnabled;
    _openTime = openTime;
    _closingTime = closingTime;
    _name = name;
    _description = description;
    _avgDeliveryTime = avgDeliveryTime;
    _aprxPriceForTwo = aprxPriceForTwo;
    _fullAddress = fullAddress;
    _pinCode = pinCode;
    _landmark = landmark;
    _minOrderPrice = minOrderPrice;
    _baseDeliveryCharge = baseDeliveryCharge;
    _baseDeliveryDistance = baseDeliveryDistance;
    _extraDeliveryCharge = extraDeliveryCharge;
    _extraDeliveryDistance = extraDeliveryDistance;
    _restaurantPhone = restaurantPhone;
    _restaurantPhoneSecondary = restaurantPhoneSecondary;
    _image = image;
    _id = id;
    _latitude = latitude;
    _longitude = longitude;
    _isOpen = isOpen;
  }

  Restaurant.fromJson(dynamic json) {
    if (json["category"] == "[]") {
      _category = [];
    } else {
      _category =
          json["category"] != null ? json["category"].cast<String>() : [];
    }
    if (json["category"] == "[]") {
      _galleryImage = [];
    } else {
      _galleryImage = json["gallery_image"] != null
          ? json["gallery_image"].cast<String>()
          : [];
    }

    _isFeatured = json["is_featured"];
    _vegOnly = json["veg_only"];
    _deliveryRadius = json["delivery_radius"];
    _deliveryChargeType = json["delivery_charge_type"];
    _fixedDeliveryCharge = json["fixed_delivery_charge"];
    _dineInEnabled = json["dine_in_enabled"];
    _takeAwayEnabled = json["take_away_enabled"];
    _deliveryEnabled = json["delivery_enabled"];
    _openTime =
        json["open_time"] != null ? json["open_time"].cast<String>() : [];
    _closingTime =
        json["closing_time"] != null ? json["closing_time"].cast<String>() : [];
    _name = json["name"];
    _description = json["description"];
    _avgDeliveryTime = json["avgDeliveryTime"];
    _aprxPriceForTwo = json["aprx_price_for_two"];
    _fullAddress = json["full_address"];
    _pinCode = json["pin_code"];
    _landmark = json["landmark"];
    _minOrderPrice = json["min_order_price"];
    _baseDeliveryCharge = json["base_delivery_charge"];
    _baseDeliveryDistance = json["base_delivery_distance"];
    _extraDeliveryCharge = json["extra_delivery_charge"];
    _extraDeliveryDistance = json["extra_delivery_distance"];
    _restaurantPhone = json["restaurant_phone"];
    _restaurantPhoneSecondary = json["restaurant_phone_secondary"];
    _image = json["image"];
    _id = json["id"].toString();
    // id = json["id"];
    _latitude = double.parse(json["latitude"]);
    _longitude = double.parse(json["longitude"]);
    _isOpen = json["is_open"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["category"] = _category;
    map["gallery_image"] = _galleryImage;
    map["is_featured"] = _isFeatured;
    map["veg_only"] = _vegOnly;
    map["delivery_radius"] = _deliveryRadius;
    map["delivery_charge_type"] = _deliveryChargeType;
    map["fixed_delivery_charge"] = _fixedDeliveryCharge;
    map["dine_in_enabled"] = _dineInEnabled;
    map["take_away_enabled"] = _takeAwayEnabled;
    map["delivery_enabled"] = _deliveryEnabled;
    map["open_time"] = _openTime;
    map["closing_time"] = _closingTime;
    map["name"] = _name;
    map["description"] = _description;
    map["avgDeliveryTime"] = _avgDeliveryTime;
    map["aprx_price_for_two"] = _aprxPriceForTwo;
    map["full_address"] = _fullAddress;
    map["pin_code"] = _pinCode;
    map["landmark"] = _landmark;
    map["min_order_price"] = _minOrderPrice;
    map["base_delivery_charge"] = _baseDeliveryCharge;
    map["base_delivery_distance"] = _baseDeliveryDistance;
    map["extra_delivery_charge"] = _extraDeliveryCharge;
    map["extra_delivery_distance"] = _extraDeliveryDistance;
    map["restaurant_phone"] = _restaurantPhone;
    map["restaurant_phone_secondary"] = _restaurantPhoneSecondary;
    map["image"] = _image;
    map["id"] = _id;
    map["latitude"] = _latitude;
    map["longitude"] = _longitude;
    map["is_open"] = _isOpen;
    return map;
  }
}
