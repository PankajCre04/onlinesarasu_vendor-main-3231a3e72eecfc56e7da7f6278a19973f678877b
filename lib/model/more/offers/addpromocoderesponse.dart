

import 'package:sooooperbusiness/model/more/offers/promodata.dart';

class AddPromoCodeResponse {
  AddPromoCodeResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  OfferData? data;

  factory AddPromoCodeResponse.fromJson(Map<String, dynamic> json) => AddPromoCodeResponse(
    status: json["status"],
    message: json["message"],
    data: OfferData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}


