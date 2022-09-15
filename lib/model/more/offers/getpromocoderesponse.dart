

import 'package:sooooperbusiness/model/more/offers/promodata.dart';

class GetPromoCodeResponse {
  GetPromoCodeResponse({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  List<OfferData>? data;
  String? message;

  factory GetPromoCodeResponse.fromJson(Map<String, dynamic> json) => GetPromoCodeResponse(
    success: json["success"],
    data: List<OfferData>.from(json["data"].map((x) => OfferData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}
