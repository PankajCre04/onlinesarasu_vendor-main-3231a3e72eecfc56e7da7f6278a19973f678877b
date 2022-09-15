import 'package:sooooperbusiness/model/kycData.dart';

class OwnerData {
  OwnerData({
    this.id,
    this.name,
    this.countryCode,
    this.mobile,
    this.email,
    this.password,
    this.type,
    this.fcmToken,
    this.bankName,
    this.accountName,
    this.accountNo,
    this.ifscCode,
    this.branchName,
    this.zones,
    this.active,
    this.verified,
    this.createdAt,
    this.updatedAt,
    this.token,
    this.tokenType,
    this.roles,
    this.kyc,
    this.latitude,
    this.longitude,
    this.isEcom,
  });

  int? id;
  int? isEcom;
  String? name;
  String? countryCode;
  String? mobile;
  String? email;
  String? password;
  dynamic type;
  String? fcmToken;
  dynamic bankName;
  dynamic accountName;
  dynamic accountNo;
  dynamic ifscCode;
  dynamic branchName;
  String? zones;
  int? active;
  int? verified;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? token;
  String? tokenType;
  List<Role>? roles;
  List<KycData>? kyc;
  double? latitude;
  double? longitude;

  factory OwnerData.fromJson(Map<String, dynamic> json) => OwnerData(
    id: json["id"],
    name: json["name"],
    countryCode: json["country_code"],
    mobile: json["mobile"],
    email: json["email"],
    password: json["password"],
    type: json["type"],
    fcmToken: json["fcm_token"],
    bankName: json["bank_name"],
    accountName: json["account_name"],
    zones: json["zones"],
    accountNo: json["account_no"],
    ifscCode: json["ifsc_code"],
    branchName: json["branch_name"],
    isEcom: json['is_ecom'],
    active: json["active"],
    verified: json["verified"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    token: json["token"],
    tokenType: json["token_type"],
    roles: (json["roles"] == null)?null:List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
    kyc: (json["kyc"] == null)?[]:List<KycData>.from(json["kyc"].map((x) => KycData.fromJson(x))),
    latitude: json['lat'],
    longitude: json['long'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country_code": countryCode,
    "mobile": mobile,
    "email": email,
    "password": password,
    "type": type,
    "fcm_token": fcmToken,
    "bank_name": bankName,
    "account_name": accountName,
    "account_no": accountNo,
    "zones":zones,
    "ifsc_code": ifscCode,
    "branch_name": branchName,
    "is_ecom":isEcom,
    "active": active,
    "verified": verified,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "token": token,
    "token_type": tokenType,
    "roles": List<dynamic>.from(roles!.map((x) => x.toJson())),
    "kyc": List<dynamic>.from(kyc!.map((x) => x.toJson())),
    'lat':latitude,
    'long':longitude,
  };
}

class Role {
  Role({
    this.id,
    this.name,
    this.guardName,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  int? id;
  String? name;
  String? guardName;
  DateTime? createdAt;
  DateTime? updatedAt;
  Pivot? pivot;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
    guardName: json["guard_name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "guard_name": guardName,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "pivot": pivot!.toJson(),
  };
}

class Pivot {
  Pivot({
    this.modelId,
    this.roleId,
    this.modelType,
  });

  int? modelId;
  int? roleId;
  String? modelType;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    modelId: json["model_id"],
    roleId: json["role_id"],
    modelType: json["model_type"],
  );

  Map<String, dynamic> toJson() => {
    "model_id": modelId,
    "role_id": roleId,
    "model_type": modelType,
  };
}