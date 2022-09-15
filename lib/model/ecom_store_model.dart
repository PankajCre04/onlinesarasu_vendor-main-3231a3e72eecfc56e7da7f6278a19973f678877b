import 'package:sooooperbusiness/model/servererror.dart';

class EcomStoreModel {
  bool? success;
  EcomData? data;
  String? message;
  Servererror? error;

  setException(Servererror error) {
    this.error = error;
  }

  EcomStoreModel({this.success, this.data, this.message});

  EcomStoreModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new EcomData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class EcomData {
  int? id;
  String? adminId;
  int? serviceCategoryId;
  String? storeCategories;
  String? name;
  String? description;
  String? image;
  String? latitude;
  String? longitude;
  String? address;
  int? deliveryRange;
  Null? baseDistance;
  Null? basePrice;
  Null? pricePerKm;
  String? mobile;
  String? email;
  int? orderCount;
  Null? gstDoc;
  Null? panDoc;
  Null? foodLicense;
  Null? shopPhoto;
  int? commission;
  int? tax;
  Null? rating;
  bool? isOpen;
  bool? active;
  String? zone;
  int? isEcom;
  String? paymentMethods;
  String? createdAt;
  String? updatedAt;
  ServiceCategory? serviceCategory;

  EcomData(
      {this.id,
      this.adminId,
      this.serviceCategoryId,
      this.storeCategories,
      this.name,
      this.description,
      this.image,
      this.latitude,
      this.longitude,
      this.address,
      this.deliveryRange,
      this.baseDistance,
      this.basePrice,
      this.pricePerKm,
      this.mobile,
      this.email,
      this.orderCount,
      this.gstDoc,
      this.panDoc,
      this.foodLicense,
      this.shopPhoto,
      this.commission,
      this.tax,
      this.rating,
      this.isOpen,
      this.active,
      this.zone,
      this.isEcom,
      this.paymentMethods,
      this.createdAt,
      this.updatedAt,
      this.serviceCategory});

  EcomData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminId = json['admin_id'];
    serviceCategoryId = json['service_category_id'];
    storeCategories = json['store_categories'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    deliveryRange = json['delivery_range'];
    baseDistance = json['base_distance'];
    basePrice = json['base_price'];
    pricePerKm = json['price_per_km'];
    mobile = json['mobile'];
    email = json['email'];
    orderCount = json['order_count'];
    gstDoc = json['gst_doc'];
    panDoc = json['pan_doc'];
    foodLicense = json['food_license'];
    shopPhoto = json['shop_photo'];
    commission = json['commission'];
    tax = json['tax'];
    rating = json['rating'];
    isOpen = json['is_open'];
    active = json['active'];
    zone = json['zone'];
    isEcom = json['is_ecom'];
    paymentMethods = json['payment_methods'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    serviceCategory = json['service_category'] != null ? new ServiceCategory.fromJson(json['service_category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['admin_id'] = this.adminId;
    data['service_category_id'] = this.serviceCategoryId;
    data['store_categories'] = this.storeCategories;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['delivery_range'] = this.deliveryRange;
    data['base_distance'] = this.baseDistance;
    data['base_price'] = this.basePrice;
    data['price_per_km'] = this.pricePerKm;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['order_count'] = this.orderCount;
    data['gst_doc'] = this.gstDoc;
    data['pan_doc'] = this.panDoc;
    data['food_license'] = this.foodLicense;
    data['shop_photo'] = this.shopPhoto;
    data['commission'] = this.commission;
    data['tax'] = this.tax;
    data['rating'] = this.rating;
    data['is_open'] = this.isOpen;
    data['active'] = this.active;
    data['zone'] = this.zone;
    data['is_ecom'] = this.isEcom;
    data['payment_methods'] = this.paymentMethods;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.serviceCategory != null) {
      data['service_category'] = this.serviceCategory!.toJson();
    }
    return data;
  }
}

class ServiceCategory {
  int? id;
  String? icon;
  String? bgImage;
  String? homeView;
  String? name;
  String? description;
  int? serviceTypeId;
  int? discount;
  int? commission;
  String? minPrice;
  String? driverRadius;
  int? baseDistance;
  int? basePrice;
  int? tax;
  int? priceKm;
  int? maxOrderDistance;
  bool? active;
  String? createdAt;
  String? updatedAt;

  ServiceCategory(
      {this.id,
      this.icon,
      this.bgImage,
      this.homeView,
      this.name,
      this.description,
      this.serviceTypeId,
      this.discount,
      this.commission,
      this.minPrice,
      this.driverRadius,
      this.baseDistance,
      this.basePrice,
      this.tax,
      this.priceKm,
      this.maxOrderDistance,
      this.active,
      this.createdAt,
      this.updatedAt});

  ServiceCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    bgImage = json['bg_image'];
    homeView = json['home_view'];
    name = json['name'];
    description = json['description'];
    serviceTypeId = json['service_type_id'];
    discount = json['discount'];
    commission = json['commission'];
    minPrice = json['min_price'];
    driverRadius = json['driver_radius'];
    baseDistance = json['base_distance'];
    basePrice = json['base_price'];
    tax = json['tax'];
    priceKm = json['price_km'];
    maxOrderDistance = json['max_order_distance'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['icon'] = this.icon;
    data['bg_image'] = this.bgImage;
    data['home_view'] = this.homeView;
    data['name'] = this.name;
    data['description'] = this.description;
    data['service_type_id'] = this.serviceTypeId;
    data['discount'] = this.discount;
    data['commission'] = this.commission;
    data['min_price'] = this.minPrice;
    data['driver_radius'] = this.driverRadius;
    data['base_distance'] = this.baseDistance;
    data['base_price'] = this.basePrice;
    data['tax'] = this.tax;
    data['price_km'] = this.priceKm;
    data['max_order_distance'] = this.maxOrderDistance;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
