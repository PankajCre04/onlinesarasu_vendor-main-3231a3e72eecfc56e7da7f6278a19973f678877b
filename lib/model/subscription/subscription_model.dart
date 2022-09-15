class SubscriptionModel {
  bool? success;
  List<Data>? data;
  String? message;

  SubscriptionModel({this.success, this.data, this.message});

  SubscriptionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? products;
  int? annualMembershipFee;
  int? serviceTransactionFee;
  int? closingFee;
  int? otherFee;
  int? introductionOfferAnnum;
  int? introductionOfferQuarter;
  int? introductionOfferHalfyearly;
  int? noOfProductListing;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.products,
      this.annualMembershipFee,
      this.serviceTransactionFee,
      this.closingFee,
      this.otherFee,
      this.introductionOfferAnnum,
      this.introductionOfferQuarter,
      this.introductionOfferHalfyearly,
      this.noOfProductListing,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    products = json['products'];
    annualMembershipFee = json['annual_membership_fee'];
    serviceTransactionFee = json['service_transaction_fee'];
    closingFee = json['closing_fee'];
    otherFee = json['other_fee'];
    introductionOfferAnnum = json['introduction_offer_annum'];
    introductionOfferQuarter = json['introduction_offer_quarter'];
    introductionOfferHalfyearly = json['introduction_offer_halfyearly'];
    noOfProductListing = json['no_of_product_listing'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['products'] = this.products;
    data['annual_membership_fee'] = this.annualMembershipFee;
    data['service_transaction_fee'] = this.serviceTransactionFee;
    data['closing_fee'] = this.closingFee;
    data['other_fee'] = this.otherFee;
    data['introduction_offer_annum'] = this.introductionOfferAnnum;
    data['introduction_offer_quarter'] = this.introductionOfferQuarter;
    data['introduction_offer_halfyearly'] = this.introductionOfferHalfyearly;
    data['no_of_product_listing'] = this.noOfProductListing;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
