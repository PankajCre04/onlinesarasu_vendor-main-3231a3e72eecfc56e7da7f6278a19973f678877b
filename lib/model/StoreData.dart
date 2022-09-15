import 'package:sooooperbusiness/model/Schedule_data.dart';
import 'package:sooooperbusiness/model/zone_response.dart';

class StoreData {
  StoreData({
    // this.distance,
    this.id,
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
    this.isOpen,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.rating,
    this.storeTimings,
    this.selectedZoneID,
    // this.categories,
    // this.coupons,
  });

  // double? distance;
  int? id;
  String? adminId;
  int? serviceCategoryId;
  List<StoreCategory>? storeCategories;
  List<SelectedZoned>? selectedZoneID;
  String? name;
  String? description;
  String? image;
  String? latitude;
  String? longitude;
  String? address;
  int? deliveryRange;
  int? baseDistance;
  int? basePrice;
  int? pricePerKm;
  String? mobile;
  String? email;
  int? orderCount;
  dynamic gstDoc;
  dynamic panDoc;
  dynamic foodLicense;
  dynamic shopPhoto;
  int? commission;
  int? tax;
  bool? isOpen;
  bool? active;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic rating;
  List<ScheduleData>? storeTimings;


  // List<Category>? categories;
  // List<Coupon>? coupons;

  factory StoreData.fromJson(dynamic json) => StoreData(
        // distance: json["distance"].toDouble(),
        id: json["id"]!=null?json["id"]:null,
        adminId: json["admin_id"],
        serviceCategoryId: json["service_category_id"],
        // storeCategories: json["store_categories"],
        storeCategories: List<StoreCategory>.from(json["store_categories"].map((x) => StoreCategory.fromJson(x))),
        selectedZoneID: List<SelectedZoned>.from(json['zone'].map((x)=> x == [] ? null : SelectedZoned.fromJson(x))),
        name: json["name"],
        description: json["description"],
        image: (json["image"] == null)?"":json["image"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        address: json["address"],
        deliveryRange: json["delivery_range"],
        baseDistance: json["base_distance"],
        basePrice: json["base_price"],
        pricePerKm: json["price_per_km"],
        mobile: json["mobile"],
        email: json["email"],
        orderCount: json["order_count"],
        gstDoc: (json["gst_doc"] == null) ? "" : json["gst_doc"],
        panDoc: (json["pan_doc"] == null) ? "" : json["pan_doc"],
        foodLicense: (json["food_license"] == null) ? "" : json["food_license"],
        shopPhoto: (json["shop_photo"] == null) ? "" : json["shop_photo"],
        commission: json["commission"],
        tax: json["tax"],
        isOpen: json["is_open"],
        active: json["active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        rating: json["rating"],
        storeTimings: (json["store_timings"] == null)
            ? null
            : List<ScheduleData>.from(
                json["store_timings"].map((x) => ScheduleData.fromJson(x))),
        // categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        // coupons: List<Coupon>.from(json["coupons"].map((x) => Coupon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        // "distance": distance,
        "id": id,
        "admin_id": adminId,
        "service_category_id": serviceCategoryId,
        "store_categories": storeCategories != null ? List<dynamic>.from(storeCategories!.map((x) => x.toJson())) : [],
        "zone":selectedZoneID!=null? List<dynamic>.from(selectedZoneID!.map((x)=>x.toJson())):[],
        "name": name,
        "description": description,
        "image": image,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "delivery_range": deliveryRange,
        "base_distance": baseDistance,
        "base_price": basePrice,
        "price_per_km": pricePerKm,
        "mobile": mobile,
        "email": email,
        "order_count": orderCount,
        "gst_doc": gstDoc,
        "pan_doc": panDoc,
        "food_license": foodLicense,
        "shop_photo": shopPhoto,
        "commission": commission,
        "tax": tax,
        "is_open": isOpen,
        "active": active,
        "created_at": createdAt != null ? createdAt!.toIso8601String() :DateTime.now(),
        "updated_at": updatedAt != null ? updatedAt!.toIso8601String() : DateTime.now(),
        "rating": rating != null ? rating : 0,
        "store_timings": storeTimings != null
            ? List<dynamic>.from(storeTimings!.map((x) => x.toJson()))
            : [],
        // "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
        // "coupons": List<dynamic>.from(coupons!.map((x) => x.toJson())),
      };
  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}



class StoreCategory {
  StoreCategory({
    this.id,
    // this.storeId,
    this.storeCategoryId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;

  // int? storeId;
  int? storeCategoryId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory StoreCategory.fromJson(Map<String, dynamic> json) => StoreCategory(
        id: json["id"],
        // storeId: json["store_id"],
        storeCategoryId: json["service_category_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        // "store_id": storeId,
        "store_category_id": storeCategoryId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.image,
    this.parent,
    this.createdAt,
    this.updatedAt,
    this.storeId,
    this.children,
    this.products,
  });

  int? id;
  String? name;
  String? image;
  int? parent;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? storeId;
  List<Category>? children;
  List<Product>? products;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        parent: json["parent"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        storeId: json["store_id"],
        children: json["children"] == null
            ? null
            : List<Category>.from(
                json["children"].map((x) => Category.fromJson(x))),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "parent": parent,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "store_id": storeId,
        "children": children == null
            ? null
            : List<dynamic>.from(children!.map((x) => x.toJson())),
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.id,
    this.storeId,
    this.productType,
    this.name,
    this.description,
    this.image,
    this.unit,
    this.price,
    this.discountPrice,
    this.categoryId,
    this.sku,
    this.productTags,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.variants,
  });

  int? id;
  int? storeId;
  String? productType;
  String? name;
  String? description;
  String? image;
  String? unit;
  int? price;
  int? discountPrice;
  int? categoryId;
  int? sku;
  String? productTags;
  bool? active;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Variant>? variants;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        storeId: json["store_id"],
        productType: json["product_type"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        unit: json["unit"],
        price: json["price"],
        discountPrice: json["discount_price"],
        categoryId: json["category_id"],
        sku: json["sku"],
        productTags: json["product_tags"],
        active: json["active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        variants: List<Variant>.from(
            json["variants"].map((x) => Variant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store_id": storeId,
        "product_type": productType,
        "name": name,
        "description": description,
        "image": image,
        "unit": unit,
        "price": price,
        "discount_price": discountPrice,
        "category_id": categoryId,
        "sku": sku,
        "product_tags": productTags,
        "active": active,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "variants": List<dynamic>.from(variants!.map((x) => x.toJson())),
      };
}

class Variant {
  Variant({
    this.id,
    this.productId,
    this.name,
    this.price,
    this.discountPrice,
    this.sku,
    this.image,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? productId;
  String? name;
  int? price;
  int? discountPrice;
  int? sku;
  String? image;
  int? active;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["id"],
        productId: json["product_id"],
        name: json["name"],
        price: json["price"],
        discountPrice: json["discount_price"],
        sku: json["sku"],
        image: json["image"],
        active: json["active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "name": name,
        "price": price,
        "discount_price": discountPrice,
        "sku": sku,
        "image": image,
        "active": active,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class Coupon {
  Coupon({
    this.id,
    this.storeId,
    this.image,
    this.code,
    this.description,
    this.maxUsePerUser,
    this.minCartValue,
    this.startDate,
    this.endDate,
    this.discountType,
    this.discountValue,
    this.maxDiscountValue,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? storeId;
  String? image;
  String? code;
  String? description;
  int? maxUsePerUser;
  int? minCartValue;
  DateTime? startDate;
  DateTime? endDate;
  String? discountType;
  String? discountValue;
  String? maxDiscountValue;
  bool? active;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        id: json["id"],
        storeId: json["store_id"],
        image: json["image"],
        code: json["code"],
        description: json["description"],
        maxUsePerUser: json["max_use_per_user"],
        minCartValue: json["min_cart_value"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        discountType: json["discount_type"],
        discountValue: json["discount_value"],
        maxDiscountValue: json["max_discount_value"],
        active: json["active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store_id": storeId,
        "image": image,
        "code": code,
        "description": description,
        "max_use_per_user": maxUsePerUser,
        "min_cart_value": minCartValue,
        "start_date": startDate!.toIso8601String(),
        "end_date": endDate!.toIso8601String(),
        "discount_type": discountType,
        "discount_value": discountValue,
        "max_discount_value": maxDiscountValue,
        "active": active,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}


//class Datum {
//     Datum({
//         this.id,
//         this.adminId,
//         this.serviceCategoryId,
//         this.storeCategories,
//         this.name,
//         this.description,
//         this.image,
//         this.latitude,
//         this.longitude,
//         this.zone,
//         this.address,
//         this.deliveryRange,
//         this.baseDistance,
//         this.basePrice,
//         this.pricePerKm,
//         this.mobile,
//         this.email,
//         this.orderCount,
//         this.gstDoc,
//         this.panDoc,
//         this.foodLicense,
//         this.shopPhoto,
//         this.commission,
//         this.tax,
//         this.rating,
//         this.isOpen,
//         this.active,
//         this.paymentMethods,
//         this.createdAt,
//         this.updatedAt,
//         this.storeTimings,
//     });
//
//     int id;
//     String adminId;
//     int serviceCategoryId;
//     List<StoreCategory> storeCategories;
//     String name;
//     String description;
//     String image;
//     String latitude;
//     String longitude;
//     List<Zone> zone;
//     String address;
//     int deliveryRange;
//     dynamic baseDistance;
//     dynamic basePrice;
//     dynamic pricePerKm;
//     String mobile;
//     String email;
//     int orderCount;
//     dynamic gstDoc;
//     dynamic panDoc;
//     dynamic foodLicense;
//     dynamic shopPhoto;
//     int commission;
//     int tax;
//     dynamic rating;
//     bool isOpen;
//     bool active;
//     String paymentMethods;
//     DateTime createdAt;
//     DateTime updatedAt;
//     List<StoreTiming> storeTimings;
//
//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         adminId: json["admin_id"],
//         serviceCategoryId: json["service_category_id"],
//         storeCategories: List<StoreCategory>.from(json["store_categories"].map((x) => StoreCategory.fromJson(x))),
//         name: json["name"],
//         description: json["description"],
//         image: json["image"],
//         latitude: json["latitude"],
//         longitude: json["longitude"],
//         zone: List<Zone>.from(json["zone"].map((x) => x == null ? null : Zone.fromJson(x))),
//         address: json["address"],
//         deliveryRange: json["delivery_range"],
//         baseDistance: json["base_distance"],
//         basePrice: json["base_price"],
//         pricePerKm: json["price_per_km"],
//         mobile: json["mobile"],
//         email: json["email"],
//         orderCount: json["order_count"],
//         gstDoc: json["gst_doc"],
//         panDoc: json["pan_doc"],
//         foodLicense: json["food_license"],
//         shopPhoto: json["shop_photo"],
//         commission: json["commission"],
//         tax: json["tax"],
//         rating: json["rating"],
//         isOpen: json["is_open"],
//         active: json["active"],
//         paymentMethods: json["payment_methods"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         storeTimings: List<StoreTiming>.from(json["store_timings"].map((x) => StoreTiming.fromJson(x))),
//     );
//
//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "admin_id": adminId,
//         "service_category_id": serviceCategoryId,
//         "store_categories": List<dynamic>.from(storeCategories.map((x) => x.toJson())),
//         "name": name,
//         "description": description,
//         "image": image,
//         "latitude": latitude,
//         "longitude": longitude,
//         "zone": List<dynamic>.from(zone.map((x) => x == null ? null : x.toJson())),
//         "address": address,
//         "delivery_range": deliveryRange,
//         "base_distance": baseDistance,
//         "base_price": basePrice,
//         "price_per_km": pricePerKm,
//         "mobile": mobile,
//         "email": email,
//         "order_count": orderCount,
//         "gst_doc": gstDoc,
//         "pan_doc": panDoc,
//         "food_license": foodLicense,
//         "shop_photo": shopPhoto,
//         "commission": commission,
//         "tax": tax,
//         "rating": rating,
//         "is_open": isOpen,
//         "active": active,
//         "payment_methods": paymentMethods,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "store_timings": List<dynamic>.from(storeTimings.map((x) => x.toJson())),
//     };
// }
//
// class StoreCategory {
//     StoreCategory({
//         this.id,
//         this.name,
//         this.image,
//         this.serviceCategoryId,
//         this.active,
//         this.createdAt,
//         this.updatedAt,
//         this.pivot,
//     });
//
//     int id;
//     String name;
//     String image;
//     int serviceCategoryId;
//     bool active;
//     DateTime createdAt;
//     DateTime updatedAt;
//     Pivot pivot;
//
//     factory StoreCategory.fromJson(Map<String, dynamic> json) => StoreCategory(
//         id: json["id"],
//         name: json["name"],
//         image: json["image"],
//         serviceCategoryId: json["service_category_id"],
//         active: json["active"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         pivot: Pivot.fromJson(json["pivot"]),
//     );
//
//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "image": image,
//         "service_category_id": serviceCategoryId,
//         "active": active,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "pivot": pivot.toJson(),
//     };
// }
//
// class Pivot {
//     Pivot({
//         this.storeId,
//         this.storeCategoryId,
//     });
//
//     int storeId;
//     int storeCategoryId;
//
//     factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
//         storeId: json["store_id"],
//         storeCategoryId: json["store_category_id"],
//     );
//
//     Map<String, dynamic> toJson() => {
//         "store_id": storeId,
//         "store_category_id": storeCategoryId,
//     };
// }
//
// class StoreTiming {
//     StoreTiming({
//         this.id,
//         this.storeId,
//         this.day,
//         this.open,
//         this.close,
//         this.createdAt,
//         this.updatedAt,
//     });
//
//     int id;
//     int storeId;
//     String day;
//     String open;
//     String close;
//     DateTime createdAt;
//     DateTime updatedAt;
//
//     factory StoreTiming.fromJson(Map<String, dynamic> json) => StoreTiming(
//         id: json["id"],
//         storeId: json["store_id"],
//         day: json["day"],
//         open: json["open"],
//         close: json["close"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//     );
//
//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "store_id": storeId,
//         "day": day,
//         "open": open,
//         "close": close,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//     };
// }
//
// class Zone {
//     Zone({
//         this.id,
//         this.title,
//         this.polygon,
//         this.active,
//         this.createdAt,
//         this.updatedAt,
//     });
//
//     String id;
//     String title;
//     List<Polygon> polygon;
//     bool active;
//     DateTime createdAt;
//     DateTime updatedAt;
//
//     factory Zone.fromJson(Map<String, dynamic> json) => Zone(
//         id: json["id"],
//         title: json["title"],
//         polygon: List<Polygon>.from(json["polygon"].map((x) => Polygon.fromJson(x))),
//         active: json["active"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//     );
//
//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "polygon": List<dynamic>.from(polygon.map((x) => x.toJson())),
//         "active": active,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//     };
// }
//
// class Polygon {
//     Polygon({
//         this.lat,
//         this.lng,
//     });
//
//     double lat;
//     double lng;
//
//     factory Polygon.fromJson(Map<String, dynamic> json) => Polygon(
//         lat: json["lat"].toDouble(),
//         lng: json["lng"].toDouble(),
//     );
//
//     Map<String, dynamic> toJson() => {
//         "lat": lat,
//         "lng": lng,
//     };
// }
//
// class Link {
//     Link({
//         this.url,
//         this.label,
//         this.active,
//     });
//
//     String url;
//     String label;
//     bool active;
//
//     factory Link.fromJson(Map<String, dynamic> json) => Link(
//         url: json["url"] == null ? null : json["url"],
//         label: json["label"],
//         active: json["active"],
//     );
//
//     Map<String, dynamic> toJson() => {
//         "url": url == null ? null : url,
//         "label": label,
//         "active": active,
//     };
// }