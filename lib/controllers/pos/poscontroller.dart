// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:sooooperbusiness/commons/utils.dart';
// import 'package:sooooperbusiness/controllers/AddressController.dart';
// import 'package:sooooperbusiness/controllers/inventory/inventoryController.dart';
// import 'package:sooooperbusiness/model/AddressModel.dart';
// import 'package:sooooperbusiness/model/more/inventory/inventoryModel.dart';
// import 'package:sooooperbusiness/model/more/inventory/product.dart';
// import 'package:sooooperbusiness/model/pos/CartModel.dart';
// import 'package:sooooperbusiness/model/restaurant.dart';
//
// class POSController extends GetxController {
//   TextEditingController searchEditingController = TextEditingController();
//   TextEditingController nameEditingController = TextEditingController();
//
//   TextEditingController mobileEditingController = TextEditingController();
//   RxMap<int, int> quantityMap = {0: 0, 1: 0, 2: 0, 3: 0, 4: 0}.obs;
//   RxList<Product> foodItems = [Product()].obs;
//   RxString currentMerchantId = "".obs;
//   RxMap<String, Product> foodItemsMap = {"0": Product()}.obs;
//   RxDouble itemTotal = 0.0.obs;
//   RxDouble grandTotal = 0.0.obs;
//   RxDouble deliveryCharge = 0.0.obs;
//   RxDouble tip = 0.0.obs;
//   RxDouble tax = 0.0.obs;
//   RxDouble offerDiscount = 0.0.obs;
//   Rx<Restaurant> restaurant = Restaurant(id: null).obs;
//   RxString orderType = "TAKEAWAY".obs;
//   Rx<AddressModel> addressModel = AddressModel().obs;
//   RxString tableNumber = "0".obs;
//   // GlobalKey<FormState> detailKey   = GlobalKey<FormState>();
//
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     foodItems.clear();
//     foodItemsMap.clear();
//     super.onInit();
//   }
//
//   void setItems(Product foodItem) {
//     if (foodItemsMap.isEmpty) {
//       currentMerchantId.value = foodItem.restaurantId!;
//       foodItemsMap[foodItem.id!] = foodItem;
//       foodItems.add(foodItem);
//       Utility.showSingleSuccessToast("Item Added");
//       // print(foodItems);
//       print(foodItemsMap);
//       update();
//       getCart();
//     } else {
//       if (currentMerchantId.value != foodItem.restaurantId!) {
//         Utility.showSingleSuccessToast("Different Market");
//         return;
//       } else {
//         foodItemsMap[foodItem.id!] = foodItem;
//         foodItems.add(foodItem);
//         Utility.showSingleSuccessToast("Item Updated");
//         //print(foodItems);
//         print(foodItemsMap);
//         update();
//         getCart();
//       }
//     }
//   }
//
//   void clearCart() {
//     currentMerchantId.value = "";
//     foodItemsMap.clear();
//     foodItems.clear();
//     getCart();
//   }
//
//   void removeItem(Items foodItem) {
//     foodItemsMap.remove(foodItem.id!);
//     foodItemsMap.refresh();
//     foodItems.removeWhere((item) => item.id == foodItem.id);
//     print(foodItemsMap);
//     Utility.showSingleSuccessToast("Item Removed");
//     getCart();
//   }
//
//   void getCart() {
//     print(foodItemsMap);
//     // print(foodItems);
//     if (foodItemsMap.isNotEmpty) {
//       currentMerchantId.value =
//           foodItemsMap.entries.elementAt(0).value.restaurantId!;
//       itemTotal.value = 0.0;
//       foodItemsMap.forEach((key, value) {
//         itemTotal.value =
//             itemTotal.value + (value.cartQuantity! * value.salePrice!);
//
//       });
//     } else {
//       itemTotal.value=0.0;
//       currentMerchantId.value = "";
//     }
//     updateTotal();
//
//   }
//
//   void createOrder() {
//     // Utility.showLoadingDialog();
//     // List<String> foodItemsString = List.empty(growable: true);
//
//     foodItems.clear();
//     for (int i = 0; i < foodItemsMap.length; i++) {
//       foodItems.value.add(foodItemsMap.values.elementAt(i));
//     }
//     if (orderType.value == "DELIVERY") {
//       if (Get.find<AddressController>().addressModel.value.id != "POS") {
//         Utility.showSingleTextToast("Add Address for delivery order");
//         return;
//       }
//     }
//     CartModel cartModel = CartModel(
//         merchantId: currentMerchantId.value,
//         itemAmount: itemTotal.value,
//         grandTotal: grandTotal.value,
//         deliveryCharge: deliveryCharge.value,
//         tip: tip.value,
//         offerDiscountAmount: offerDiscount.value,
//         offerId: "",
//         addressModel: orderType.value != "DELIVERY"
//             ? AddressModel(
//                 name: nameEditingController.text,
//                 phone: mobileEditingController.text)
//             : Get.find<AddressController>().addressModel.value,
//         tax: tax.value,
//         totalItems: foodItems.length,
//         paymentMethod: "COD",
//         cartItemsList: foodItems,
//         paymentId: "",
//         cooking_instructions: "",
//         orderType: orderType.value);
//     print(cartModel.toJson());
//     //   print(cartModel.toString());
//   }
//
//   void updateTotal() {
//     deliveryCharge.value = 0.0;
//     if (orderType.value != "TAKEAWAY") {
//       if (restaurant.value.deliveryChargeType == "Fixed") {
//         deliveryCharge.value = restaurant.value.fixedDeliveryCharge!.toDouble();
//         grandTotal.value =
//             itemTotal.value + deliveryCharge.value + tip.value + tax.value;
//         update();
//       } else {
//         grandTotal.value =
//             itemTotal.value + deliveryCharge.value + tip.value + tax.value;
//       }
//     } else {
//       deliveryCharge.value = 0.0;
//       grandTotal.value =
//           itemTotal.value + deliveryCharge.value + tip.value + tax.value;
//     }
//     print("GRAND TOTAL = " + grandTotal.value.toString());
//     update();
//   }
//
//   ///Unused -- need to delete
//   void increaseQuantity(int index) {
//     if (quantityMap.value.containsKey(index)) {
//       int? currentQuantity = quantityMap.value[index];
//       currentQuantity = currentQuantity! + 1;
//       quantityMap.value[index] = currentQuantity;
//     } else {
//       quantityMap.value[index] = 1;
//     }
//   }
//
//   ///Unused -- need to delete
//   void decreaseQuantity(int index) {
//     if (quantityMap.value.containsKey(index)) {
//       int? currentQuantity = quantityMap.value[index];
//       currentQuantity = currentQuantity! - 1;
//       quantityMap.value[index] = currentQuantity;
//     } else {
//       quantityMap.value[index] = 0;
//     }
//   }
// }
