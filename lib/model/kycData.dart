class KycData {
  KycData({
    this.docType,
    this.photo,
    this.adminId,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? docType;
  String? photo;
  String? adminId;
  String? status;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory KycData.fromJson(Map<String, dynamic> json) => KycData(
    docType: json["doc_type"],
    photo: json["photo"],
    adminId: json["admin_id"],
    status: json["status"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "doc_type": docType,
    "photo": photo,
    "admin_id": adminId,
    "status": status,
    "updated_at": updatedAt!.toIso8601String(),
    "created_at": createdAt!.toIso8601String(),
    "id": id,
  };
}