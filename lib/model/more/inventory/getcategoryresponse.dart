// // To parse this JSON data, do
// //
// //     final welcome = welcomeFromJson(jsonString);
//
// import 'dart:convert';
//
// import 'category.dart';
//
// class GetCategoryResponse {
//   GetCategoryResponse({
//     this.status,
//     this.message,
//     this.data,
//   });
//
//   bool? status;
//   String? message;
//   Data? data;
//
//   factory GetCategoryResponse.fromJson(Map<String, dynamic> json) => GetCategoryResponse(
//     status: json["status"],
//     message: json["message"],
//     data: Data.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "data": data!.toJson(),
//   };
// }
//
// class Data {
//   Data({
//     this.results,
//     this.page,
//     this.limit,
//     this.totalPages,
//     this.totalResults,
//   });
//
//   List<Category>? results;
//   int? page;
//   int? limit;
//   int? totalPages;
//   int? totalResults;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     results: List<Category>.from(json["results"].map((x) => Category.fromJson(x))),
//     page: json["page"],
//     limit: json["limit"],
//     totalPages: json["totalPages"],
//     totalResults: json["totalResults"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "results": List<dynamic>.from(results!.map((x) => x.toJson())),
//     "page": page,
//     "limit": limit,
//     "totalPages": totalPages,
//     "totalResults": totalResults,
//   };
// }
//
//
