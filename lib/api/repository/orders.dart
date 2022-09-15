import 'package:dio/dio.dart';
import 'package:sooooperbusiness/api/api_client.dart';
import 'package:sooooperbusiness/model/basemodel.dart';
import 'package:sooooperbusiness/model/more/inventory/getcategoryresponse.dart';
import 'package:sooooperbusiness/model/order/get_store_order_response.dart';
import 'package:sooooperbusiness/model/order/getrestaurantorderresponse.dart';
import 'package:sooooperbusiness/model/order/modifyrestaurantorderstatusresponse.dart';
import 'package:sooooperbusiness/model/servererror.dart';

class Orders {
  Dio? dio;
  ApiClient? apiClient;

  Orders() {
    dio = new Dio();
    apiClient = ApiClient(dio!);
  }

  Future<BaseModel<GetStoreOrderResponse>> GetRestaurantOrder(String accessToken, String restId, int page, String orderStatus) async {
    dio!.options.headers.addAll({
      "Authorization": "Bearer " + accessToken,
    }); //accessToken});
    GetStoreOrderResponse response;

    try {
      response = await apiClient!.GetRestaurantOrder(restId, orderStatus, "createdAt:desc", page, 100);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<GetStoreOrderResponse>> GetRestaurantOrderOngoing(String accessToken, String restId, int page, String orderStatus) async {
    print(restId);
    dio!.options.headers.addAll({
      "Authorization": "Bearer " + accessToken,
    }); //accessToken});
    GetStoreOrderResponse response;

    try {
      response = await apiClient!.getRestaurantOrderOngoing(restId, orderStatus, "createdAt:desc", page, 100);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<GetStoreOrderResponse>> GetRestaurantOrderPending(String accessToken, String restId, int page, String orderStatus) async {
    print("addcatee");
    print(accessToken);
    print("order fetchhh");
    print(restId);
    dio!.options.headers.addAll({
      "Authorization": "Bearer " + accessToken,
    }); //accessToken});
    GetStoreOrderResponse response;

    try {
      response = await apiClient!.getRestaurantOrderPending(restId, orderStatus, "createdAt:desc", page, 100);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<GetStoreOrderResponse>> GetRestaurantOrderCanceled(String accessToken, String restId, int page, String orderStatus) async {
    print("addcatee");
    print(accessToken);
    print("order fetchhh");
    print(restId);
    dio!.options.headers.addAll({
      "Authorization": "Bearer " + accessToken,
    }); //accessToken});
    GetStoreOrderResponse response;

    try {
      response = await apiClient!.getRestaurantOrderCancelled(restId, orderStatus, "createdAt:desc", page, 100);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<GetStoreOrderResponse>> GetRestaurantOrderDelivered(String accessToken, String restId, int page, String orderStatus) async {
    print("addcatee");
    print(accessToken);
    print("order fetchhh");
    print(restId);
    dio!.options.headers.addAll({
      "Authorization": "Bearer " + accessToken,
    }); //accessToken});
    GetStoreOrderResponse response;

    try {
      response = await apiClient!.getRestaurantOrderDelivered(restId, orderStatus, "createdAt:desc", page, 100);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<ModifyRestaurantOrderStatusResponse>> ModifyStoreOrderStatus(String accessToken, String orderId, String status, String preparationTime) async {
    print("addcatee");
    print(accessToken);
    dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
    ModifyRestaurantOrderStatusResponse response;

    try {
      response = await apiClient!.ModifyStoreOrderStatus(orderId, status, preparationTime);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }
}
