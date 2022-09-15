// // To parse this JSON data, do
// //
// //     final welcome = welcomeFromJson(jsonString);
//
//
// import 'package:sooooperbusiness/model/StoreCategoryData.dart';
//
// class StoreRealCategoryResponse {
//   StoreRealCategoryResponse({
//     this.success,
//     this.data,
//     this.message,
//   });
//
//   bool? success;
//   StoreRealCategoryData? data;
//   String? message;
//
//   factory StoreRealCategoryResponse.fromJson(Map<String, dynamic> json) => StoreRealCategoryResponse(
//     success: json["success"],
//     data: StoreRealCategoryData.fromJson(json["data"]),
//     message: json["message"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "success": success,
//     "data": data!.toJson(),
//     "message": message,
//   };
// }
//
// class StoreRealCategoryData {
//   StoreRealCategoryData({
//     this.currentPage,
//     this.data,
//     this.firstPageUrl,
//     this.from,
//     this.lastPage,
//     this.lastPageUrl,
//     this.links,
//     this.nextPageUrl,
//     this.path,
//     this.perPage,
//     this.prevPageUrl,
//     this.to,
//     this.total,
//   });
//
//   int? currentPage;
//   List<StoreCategoryData>? data;
//   String? firstPageUrl;
//   int? from;
//   int? lastPage;
//   String? lastPageUrl;
//   List<Link>? links;
//   dynamic nextPageUrl;
//   String? path;
//   int? perPage;
//   dynamic prevPageUrl;
//   int? to;
//   int? total;
//
//   factory StoreRealCategoryData.fromJson(Map<String, dynamic> json) => StoreRealCategoryData(
//     currentPage: json["current_page"],
//     data: List<StoreCategoryData>.from(json["data"].map((x) => StoreCategoryData.fromJson(x))),
//     firstPageUrl: json["first_page_url"],
//     from: json["from"],
//     lastPage: json["last_page"],
//     lastPageUrl: json["last_page_url"],
//     links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
//     nextPageUrl: json["next_page_url"],
//     path: json["path"],
//     perPage: json["per_page"],
//     prevPageUrl: json["prev_page_url"],
//     to: json["to"],
//     total: json["total"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "current_page": currentPage,
//     "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//     "first_page_url": firstPageUrl,
//     "from": from,
//     "last_page": lastPage,
//     "last_page_url": lastPageUrl,
//     "links": List<dynamic>.from(links!.map((x) => x.toJson())),
//     "next_page_url": nextPageUrl,
//     "path": path,
//     "per_page": perPage,
//     "prev_page_url": prevPageUrl,
//     "to": to,
//     "total": total,
//   };
// }
//
// // class StoreCategoryData {
// //   StoreCategoryData({
// //     this.id,
// //     this.name,
// //     this.image,
// //     this.serviceCategoryId,
// //     this.active,
// //     this.createdAt,
// //     this.updatedAt,
// //   });
// //
// //   int? id;
// //   String? name;
// //   String? image;
// //   int? serviceCategoryId;
// //   bool? active;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //
// //   factory StoreCategoryData.fromJson(Map<String, dynamic> json) => StoreCategoryData(
// //     id: json["id"],
// //     name: json["name"],
// //     image: json["image"],
// //     serviceCategoryId: json["service_category_id"],
// //     active: json["active"],
// //     createdAt: DateTime.parse(json["created_at"]),
// //     updatedAt: DateTime.parse(json["updated_at"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "name": name,
// //     "image": image,
// //     "service_category_id": serviceCategoryId,
// //     "active": active,
// //     "created_at": createdAt!.toIso8601String(),
// //     "updated_at": updatedAt!.toIso8601String(),
// //   };
// // }
//
// class Link {
//   Link({
//     this.url,
//     this.label,
//     this.active,
//   });
//
//   String? url;
//   String? label;
//   bool? active;
//
//   factory Link.fromJson(Map<String, dynamic> json) => Link(
//     url: json["url"] == null ? null : json["url"],
//     label: json["label"],
//     active: json["active"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "url": url == null ? null : url,
//     "label": label,
//     "active": active,
//   };
// }
