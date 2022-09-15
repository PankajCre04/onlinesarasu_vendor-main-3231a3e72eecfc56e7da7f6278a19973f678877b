

class GetZoneResponse {
  GetZoneResponse({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  List<SelectedZoned>? data;
  String? message;

  factory GetZoneResponse.fromJson(Map<String, dynamic> json) => GetZoneResponse(
    success: json["success"],
    data: List<SelectedZoned>.from(json["data"].map((x) => x == null ? null: SelectedZoned.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class SelectedZoned {
  SelectedZoned({
    this.id,
    this.title,
    this.active,
    this.polygon,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? title;
  bool? active;
  List<Polygon>? polygon;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory SelectedZoned.fromJson(Map<String, dynamic> json) => SelectedZoned(
    id: json["id"],
    title: json["title"],
    polygon: List<Polygon>.from(json["polygon"].map((x) => Polygon.fromJson(x))),
    active: json["active"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "polygon": List<dynamic>.from(polygon!.map((x) => x.toJson())),
    "active": active,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class Polygon {
  double? lat;
  double? lng;

  Polygon({this.lat, this.lng});

  Polygon.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

