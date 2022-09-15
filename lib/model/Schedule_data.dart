class ScheduleData {
  ScheduleData({
    this.id,
    this.storeId,
    this.day,
    this.open,
    this.close,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? storeId;
  String? day;
  String? open;
  String? close;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ScheduleData.fromJson(Map<String, dynamic> json) => ScheduleData(
    id: json["id"],
    storeId: json["store_id"],
    day: json["day"],
    open: json["open"],
    close: json["close"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "store_id": storeId,
    "day": day,
    "open": open,
    "close": close,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}