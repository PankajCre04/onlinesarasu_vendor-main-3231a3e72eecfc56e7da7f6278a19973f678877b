class OrderAddress {
  OrderAddress({
    this.id,
    this.name,
    this.phone,
    this.fullAddress,
    this.city,
    this.state,
    this.pinCode,
    this.type,
    this.lat,
    this.long,
    this.locality,
    this.floorBuilding,
  });

  String? id;
  // AddressName? name;
  String? name;
  String? phone;
  String? fullAddress;
  // City? city;
  // State? state;
  String? city;
  String? state;
  String? pinCode;
  // Type? type;
  String? type;
  String? lat;
  String? long;
  // Locality? locality;
  // FloorBuilding? floorBuilding;
  String? locality;
  String? floorBuilding;

  factory OrderAddress.fromJson(Map<String, dynamic> json) => OrderAddress(
    id: json["_id"],
    // name: addressNameValues.map![json["name"]],
    name: json["name"],
    phone: json["phone"],
    fullAddress: json["full_address"],
    // city: cityValues.map![json["city"]],
    // state: stateValues.map![json["state"]],
    city: json["city"],
    state: json["state"],
    pinCode: json["pin_code"],
    // type: typeValues.map![json["type"]],
    type: json["type"],
    lat: json["lat"],
    long: json["long"],
    // locality: localityValues.map![json["locality"]],
    // floorBuilding: floorBuildingValues.map![json["floor_building"]],
    locality: json["locality"],
    floorBuilding: json["floor_building"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    // "name": addressNameValues.reverse[name],
    "name": name,
    "phone": phone,
    "full_address": fullAddress,
    // "city": cityValues.reverse[city],
    // "state": stateValues.reverse[state],
    "city": city,
    "state": state,
    "pin_code": pinCode,
    // "type": typeValues.reverse[type],
    "type": type,
    "lat": lat,
    "long": long,
    // "locality": localityValues.reverse[locality],
    // "floor_building": floorBuildingValues.reverse[floorBuilding],
    "locality": locality,
    "floor_building": floorBuilding,
  };
}