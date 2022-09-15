import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/controllers/inventory/ItemController.dart';
import 'package:sooooperbusiness/controllers/inventory/inventoryController.dart';
import 'package:sooooperbusiness/controllers/maincontroller.dart';
import 'package:sooooperbusiness/controllers/order/ordercontroller.dart';
import 'package:sooooperbusiness/model/StoreData.dart';
import 'package:sooooperbusiness/model/ecom_store_model.dart';
import 'package:sooooperbusiness/model/restaurant.dart';

class SessionManager {
  static final String ACCESS_TOKEN = "ACCESS_TOKEN";
  static final String FCM_TOKEN = "FCM_TOKEN";
  static final String Owner_Name = "Owner_Name";
  static final String Ecom_STORE_ID = "Ecom_STORE_ID";
  static final String Owner_ID = "Owner_ID";
  static final String address = "address";
  static final String lat = "lat";
  static final String lng = "lng";
  static final String Selected_Restaurant = "Selected_Restaurant";
  static final String userName = "userName";
  static final String userEmail = "userEmail";

  static Future<void> saveAccessToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(ACCESS_TOKEN, value);
  }

  static Future<void> saveUserData(String name, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userName, name);
    prefs.setString(userEmail, email);
  }

  static Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userName);
  }

  static Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmail);
  }

  static Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(ACCESS_TOKEN) != null) {
      Constant.AccessToken = prefs.getString(ACCESS_TOKEN)!;
      print("accesstoken " + Constant.AccessToken);
    }

    return prefs.getString(ACCESS_TOKEN);
  }

  static Future<void> setOwnerName(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Owner_Name, value);
  }

  static Future<String?> getOwnerName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(Owner_Name);
  }

  static Future<void> saveEcomStoreId(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Ecom_STORE_ID", value);
  }

  static Future<String?> getEcomStroeId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("Ecom_STORE_ID");
  }

  static Future<void> setOwnerID(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Owner_ID, value);
  }

  static Future<String?> getOwnerID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(Owner_ID);
  }

  static Future<void> saveFCMToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(FCM_TOKEN, value);
  }

  static Future<String?> getFCMToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(FCM_TOKEN);
  }

  static Future<void> saveAddress(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(address, value);
  }

  static Future<String?> getAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(address);
  }

  static Future<void> saveLat(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(lat, value);
  }

  static Future<double?> getLat() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(lat);
  }

  static Future<void> saveLng(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(lng, value);
  }

  static Future<double?> getLng() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(lng);
  }

  static Future<void> storeEcomAdmin(EcomData value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("ADMIN", jsonEncode(value));
  }

  static Future<EcomData?> getEcomAdminStore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('ADMIN') != null && prefs.getString('ADMIN') != '') {
      try {
        Map<String, dynamic> datat = jsonDecode(prefs.getString('ADMIN')!);
        print("JSON jsonDecode" + datat.toString());
        return EcomData.fromJson(datat);
      } catch (e) {
        print("GETTING RESTAURANT" + e.toString());
        return null;
      }
    }
    return null;
  }

  static Future<void> saveRestaurant(StoreData value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(jsonEncode(value));
    prefs.setString(Selected_Restaurant, jsonEncode(value));
    String? accToken = prefs.getString(ACCESS_TOKEN);
    // InventoryController controller = Get.put(InventoryController());
    // controller.GetProductCategory(accToken!);
    // // controller.GetAllCategory(accToken);
    // // controller.GetItem("All", 1);
    // OrderController orderController = Get.put(OrderController());
    // orderController.GetRestaurantOrder(1, accToken);
    // ItemController itemController = Get.put(ItemController(), permanent: true);
    // itemController.getAllFoodItems();
  }

  static Future<StoreData?> getRestaurant() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("GETTING RESTAURANT");
    print(prefs.getString(Selected_Restaurant));
    if (prefs.getString(Selected_Restaurant) != null && prefs.getString(Selected_Restaurant) != '') {
      print(prefs.getString(Selected_Restaurant));
      try {
        Map<String, dynamic> datat = jsonDecode(prefs.getString(Selected_Restaurant)!);
        print("JSON jsonDecode" + datat.toString());
        return StoreData.fromJson(datat);
      } catch (e) {
        print("GETTING RESTAURANT" + e.toString());
        return null;
      }
    }
    return null;
  }
}
