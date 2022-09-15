import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/api/api_client.dart';
import 'package:sooooperbusiness/model/basemodel.dart';
import 'package:sooooperbusiness/model/more/inventory/deleteresponse.dart';
import 'package:sooooperbusiness/model/more/offers/addpromocoderesponse.dart';
import 'package:sooooperbusiness/model/more/offers/getpromocoderesponse.dart';
import 'package:sooooperbusiness/model/servererror.dart';

class Promo {
  Dio? dio;
  ApiClient? apiClient;

  Promo() {
    dio = new Dio();
    apiClient = ApiClient(dio!);
  }

  Future<BaseModel<GetPromoCodeResponse>> GetPromos(
    String accessToken,
    String restId,
  ) async {
    print("addcatee");
    print(accessToken);
    dio!.options.headers.addAll({
      "Authorization": "Bearer " + accessToken //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGYyNmM2ZjQ0YjBmODAwMjAwZjMwZmIiLCJpYXQiOjE2MjY1MDAyMjAsImV4cCI6MTY4NjUwMDE2MCwidHlwZSI6ImFjY2VzcyJ9.xVIuSiuyhx2FkSwq7xPjsHQCt0gUtoLu6L1ouOqJkHw",
    }); //accessToken});
    GetPromoCodeResponse response;
    try {
      print("@@@ ${restId}");
      response = await apiClient!.GetPromoCode(restId);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<GetPromoCodeResponse>> GetEcomPromo(
    String accessToken,
  ) async {
    print("EcomPromo");
    print(accessToken);
    dio!.options.headers.addAll({
      "Authorization": "Bearer " + accessToken //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGYyNmM2ZjQ0YjBmODAwMjAwZjMwZmIiLCJpYXQiOjE2MjY1MDAyMjAsImV4cCI6MTY4NjUwMDE2MCwidHlwZSI6ImFjY2VzcyJ9.xVIuSiuyhx2FkSwq7xPjsHQCt0gUtoLu6L1ouOqJkHw",
    }); //accessToken});
    GetPromoCodeResponse response;
    try {
      response = await apiClient!.GetEcomPromoCode();
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<AddPromoCodeResponse>> AddOffer(
    String accessToken,
    String storeId,
    File couponImage,
    String code,
    String couponDescription,
    String couponMaxUsePerUser,
    String couponMinCartValue,
    String couponStartDate,
    String couponEndDate,
    String couponDiscountType,
    String couponDiscountValue,
    String couponMaxDiscountValue,
    String isActive,
  ) async {
    print("addcatee");
    print(accessToken);
    dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
    AddPromoCodeResponse response;
    try {
      response = await apiClient!
          .AddOffer(
        storeId,
        couponImage,
        code,
        couponDescription,
        couponMaxUsePerUser,
        couponMinCartValue,
        couponStartDate,
        couponEndDate,
        couponDiscountType,
        couponDiscountValue,
        couponMaxDiscountValue,
        isActive,
      )
          .then((value) {
        print("graph data get");
        return value;
      }).catchError((error) {
        switch (error.runtimeType) {
          case DioError:
            // Here's the sample to get the failed response error code and message
            final res = (error as DioError).response;
            print("Got error : ${res!.statusCode} -> ${res.statusMessage}");
            if (res.statusCode == 401) {
              Get.offAllNamed('/splash');
            }
            break;
          default:
            break;
        }
      });
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<DeleteResponse>> DeleteOffer(String accessToken, String offerId) async {
    dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
    DeleteResponse response;

    try {
      response = await apiClient!.DeleteOffer(offerId).then((value) {
        print("graph data get");
        return value;
      }).catchError((error) {
        switch (error.runtimeType) {
          case DioError:
            // Here's the sample to get the failed response error code and message
            final res = (error as DioError).response;
            print("Got error : ${res!.statusCode} -> ${res.statusMessage}");
            if (res.statusCode == 401) {
              Get.offAllNamed('/splash');
            }
            break;
          default:
            break;
        }
      });
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<AddPromoCodeResponse>> EditOffer(
    String offerId,
    String accessToken,
    String storeId,
    File couponImage,
    String code,
    String couponDescription,
    String couponMaxUsePerUser,
    String couponMinCartValue,
    String couponStartDate,
    String couponEndDate,
    String couponDiscountType,
    String couponDiscountValue,
    String couponMaxDiscountValue,
    String isActive,
  ) async {
    print("addcatee");
    print(accessToken);
    dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
    AddPromoCodeResponse response;

    try {
      response = await apiClient!
          .EditOffer(
        offerId,
        "PUT",
        storeId,
        couponImage,
        code,
        couponDescription,
        couponMaxUsePerUser,
        couponMinCartValue,
        couponStartDate,
        couponEndDate,
        couponDiscountType,
        couponDiscountValue,
        couponMaxDiscountValue,
        isActive,
      )
          .then((value) {
        print("graph data get");
        return value;
      }).catchError((error) {
        switch (error.runtimeType) {
          case DioError:
            // Here's the sample to get the failed response error code and message
            final res = (error as DioError).response;
            print("Got error : ${res!.statusCode} -> ${res.statusMessage}");
            if (res.statusCode == 401) {
              Get.offAllNamed('/splash');
            }
            break;
          default:
            break;
        }
      });
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<AddPromoCodeResponse>> UpdateOfferStatus(
    String offerId,
    String accessToken,
    String isActive,
  ) async {
    print("addcatee");
    print(accessToken);
    dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
    AddPromoCodeResponse response;

    try {
      response = await apiClient!
          .UpdateOfferStatus(
        offerId,
        "PUT",
        isActive,
      )
          .then((value) {
        print("graph data get");
        return value;
      }).catchError((error) {
        switch (error.runtimeType) {
          case DioError:
            // Here's the sample to get the failed response error code and message
            final res = (error as DioError).response;
            print("Got error : ${res!.statusCode} -> ${res.statusMessage}");
            if (res.statusCode == 401) {
              Get.offAllNamed('/splash');
            }
            break;
          default:
            break;
        }
      });
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }
}
