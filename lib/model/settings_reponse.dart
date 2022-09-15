

class SettingsResponse {
  SettingsResponse({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  SettingData? data;
  String? message;

  factory SettingsResponse.fromJson(Map<String, dynamic> json) => SettingsResponse(
    success: json["success"],
    data: SettingData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data!.toJson(),
    "message": message,
  };
}

class SettingData {
  SettingData({
    this.appName,
    this.appDescription,
    this.taxPercentage,
    this.razorpayKey,
    this.aboutUs,
    this.privacyPolicy,
    this.refundPolicy,
    this.referalAmount,
    this.referalOrderCount,
    this.androidVersion,
    this.vendorAndroidForceUpdate,
    this.maintenanceMode,
    this.vendorAndroidVersion
  });

  String? appName;
  String? appDescription;
  String? taxPercentage;
  String? razorpayKey;
  String? aboutUs;
  String? privacyPolicy;
  String? refundPolicy;
  String? referalAmount;
  String? referalOrderCount;
  String? androidVersion;
  String? vendorAndroidVersion;
  String? vendorAndroidForceUpdate;
  String? maintenanceMode;

  factory SettingData.fromJson(Map<String, dynamic> json) => SettingData(
    appName: json["app_name"],
    appDescription: json["app_description"],
    taxPercentage: json["tax_percentage"],
    razorpayKey: json["razorpay_key"],
    aboutUs: json["about_us"],
    privacyPolicy: json["privacy_policy"],
    refundPolicy: json["refund_policy"],
    referalAmount: json["referal_amount"],
    referalOrderCount: json["referal_order_count"],
    androidVersion: json['android_version'],
    vendorAndroidVersion : json['vendor_android_version'],
    vendorAndroidForceUpdate : json['vendor_android_force_update'],
    maintenanceMode : json['maintenance_mode'],
  );

  Map<String, dynamic> toJson() => {
    "app_name": appName,
    "app_description": appDescription,
    "tax_percentage": taxPercentage,
    "razorpay_key": razorpayKey,
    "about_us": aboutUs,
    "privacy_policy": privacyPolicy,
    "refund_policy": refundPolicy,
    "referal_amount": referalAmount,
    "referal_order_count": referalOrderCount,
    "android_version": androidVersion,
    "vendor_android_version": vendorAndroidVersion,
    "vendor_android_force_update": vendorAndroidForceUpdate,
    "maintenance_mode": maintenanceMode,
  };
}
