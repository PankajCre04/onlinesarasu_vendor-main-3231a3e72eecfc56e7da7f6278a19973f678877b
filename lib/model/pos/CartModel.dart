//
// import 'package:sooooperbusiness/model/more/inventory/inventoryModel.dart';
// import 'package:sooooperbusiness/model/more/inventory/product.dart';
//
// import '../AddressModel.dart';
//
// class CartModel {
//   String? merchantId;
//   double? itemAmount;
//   double? grandTotal;
//   double? deliveryCharge;
//   double? tip;
//   double? tax;
//   double? offerDiscountAmount;
//   String? offerId;
//   AddressModel? addressModel;
//   List<Items>? cartItemsList;
//   int? totalItems;
//   String? paymentMethod;
//   String? paymentId;
//   String? orderId;
//   String? signature;
//   String? cooking_instructions;
//   String? orderType;
//
//   CartModel(
//       {this.merchantId,
//       this.itemAmount,
//       this.grandTotal,
//       this.deliveryCharge,
//       this.tip,
//       this.offerDiscountAmount,
//       this.offerId,
//       this.addressModel,
//       this.cartItemsList,
//       this.tax,
//       this.totalItems,
//       this.paymentMethod,
//       this.cooking_instructions,
//       this.paymentId,
//       this.orderId,
//       this.signature,this.orderType});
//
//   Map<String, dynamic> toJson() => {
//         "totalItems": totalItems,
//         "restaurant_id": merchantId,
//         "itemAmount": itemAmount,
//         "grandTotal": grandTotal,
//         "tip": tip,
//         "offerDiscountAmount": offerDiscountAmount,
//         "deliveryCharge": deliveryCharge,
//         "offerId": offerId!.isEmpty ? Null : offerId,
//         "address": addressModel!.toOrderJson(),
//         "tax": tax,
//         "paymentMethod": paymentMethod,
//         "items": List<dynamic>.from(cartItemsList!.map((x) => x.toOrderJson())),
//         "payment_id": Null,
//         "cooking_instructions":
//             cooking_instructions!.isEmpty ? Null : cooking_instructions,
//         "order_type": orderType
//       };
//
//   Map<String, dynamic> toPaymentJson() => {
//         "totalItems": totalItems,
//         "restaurant_id": merchantId,
//         "itemAmount": itemAmount,
//         "grandTotal": grandTotal,
//         "tip": tip,
//         "offerDiscountAmount": offerDiscountAmount,
//         "deliveryCharge": deliveryCharge,
//         "offerId": offerId!.isEmpty ? Null : offerId,
//         "address": addressModel!.toOrderJson(),
//         "tax": tax,
//         "paymentMethod": paymentMethod,
//         "items": List<dynamic>.from(cartItemsList!.map((x) => x.toOrderJson())),
//         "cooking_instructions":
//             cooking_instructions!.isEmpty ? Null : cooking_instructions,
//         "payment_id": paymentId,
//         "order_type": orderType
//       };
//
//   @override
//   String toString() {
//     return 'CartModel{merchantId: $merchantId, itemAmount: $itemAmount, grandTotal: $grandTotal, deliveryCharge: $deliveryCharge, tip: $tip, tax: $tax, offerDiscountAmount: $offerDiscountAmount, offerId: $offerId, addressModel: $addressModel, cartItemsList: ${cartItemsList}, totalItems: $totalItems, paymentMethod: $paymentMethod}';
//   }
// }
