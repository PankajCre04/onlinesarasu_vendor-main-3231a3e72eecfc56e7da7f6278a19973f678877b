import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/api/api_client.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/utils.dart';
import 'package:sooooperbusiness/controllers/authcontrollers.dart';
import 'package:sooooperbusiness/model/AddStoreResponse.dart';
import 'package:sooooperbusiness/model/StoreResponse.dart';
import 'package:sooooperbusiness/model/StoreTypeResponse.dart';
import 'package:sooooperbusiness/model/allresponse/addrestaurantresponse.dart';
import 'package:sooooperbusiness/model/allresponse/allrestaurantresponse.dart';
import 'package:sooooperbusiness/model/allresponse/categoryresponse.dart';
import 'package:sooooperbusiness/model/allresponse/ownerloginresponse.dart';
import 'package:sooooperbusiness/model/allresponse/updaterestaurantstatusrestaurantresponse.dart';
import 'package:sooooperbusiness/model/basemodel.dart';
import 'package:sooooperbusiness/model/ecom_store_model.dart';
import 'package:sooooperbusiness/model/kycResponce.dart';
import 'package:sooooperbusiness/model/more/inventory/getaddonresponse.dart';
import 'package:sooooperbusiness/model/profileResponse.dart';
import 'package:sooooperbusiness/model/registrationResponse.dart';
import 'package:sooooperbusiness/model/schedule_response.dart';
import 'package:sooooperbusiness/model/send_email_response.dart';
import 'package:sooooperbusiness/model/servererror.dart';
import 'package:sooooperbusiness/model/settings_reponse.dart';
import 'dart:io';

import 'package:sooooperbusiness/model/storeCategoryModel.dart';
import 'package:sooooperbusiness/model/storeRealCategoryResponse.dart';
import 'package:sooooperbusiness/model/store_stats_response.dart';
import 'package:sooooperbusiness/model/zone_response.dart';

import '../../model/store_category_response.dart';

class OwnerRepo {
  Dio? dio;
  ApiClient? apiClient;

  OwnerRepo() {
    dio = new Dio();
    apiClient = ApiClient(dio!);
  }

  Future<BaseModel<RegistrationResponse>> loginOwner(String email, String password) async {
    RegistrationResponse response;
    try {
      print('---->@');
      response = await apiClient!.loginOwner(email, password);
    } on DioError catch (e) {
      // print(e.response!.data!);
      print("e.response");
      print(Servererror.fromJson(e.response!.data));
      return BaseModel()..setException(Servererror.fromJson(e.response!.data));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<SendEmailResponse>> sendEmail(String email) async {
    SendEmailResponse response;
    response = await apiClient!.sendForgotPasswordEmail(email);
    try {} on DioError catch (e) {
      print(e.response!.data);
      print("e.response");
      print(Servererror.fromJson(e.response!.data).message);
      return BaseModel()..setException(Servererror.fromJson(e.response!.data));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<SendEmailResponse>> setNewPassword(String otp, String password, String confirmPassword) async {
    SendEmailResponse response;
    try {
      response = await apiClient!.setNewPassword(otp, password, confirmPassword);
    } on DioError catch (e) {
      print(e.response!.data);
      print("e.response");
      print(Servererror.fromJson(e.response!.data).message);
      return BaseModel()..setException(Servererror.fromJson(e.response!.data));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<Ownerloginresponse>> loginOwnerPhone(String mobile, bool isPasswordLess) async {
    Ownerloginresponse response;
    try {
      response = await apiClient!.loginOwnerByPhone(mobile, isPasswordLess);
    } on DioError catch (e) {
      print(e.response!.data);
      print("e.response");
      print(Servererror.fromJson(e.response!.data).message);
      return BaseModel()..setException(Servererror.fromJson(e.response!.data));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<Ownerloginresponse>> registerOwner(String name, String phone, String email, String password, String businessType, String latitude, String longitude, String cf1, String cf2, String cf3, String bankName, String acNumber,
      String ifscCode, String address, String panNo, File aadharCardImg, File panCardImg, File addressProofImg, File cancelChequeImg, File gstCertificateImg, File profileImg) async {
    Ownerloginresponse response;
    try {
      response = await apiClient!.registerOwner(
        name,
        phone,
        email,
        password,
        businessType,
        latitude,
        longitude,
        cf1,
        cf2,
        cf3,
        bankName,
        acNumber,
        ifscCode,
        address,
        panNo,
        aadharCardImg,
        aadharCardImg,
        addressProofImg,
        cancelChequeImg,
        gstCertificateImg,
        profileImg,
      );
    } on DioError catch (e) {
      print(e.response!.data);
      print("e.response");
      return BaseModel()..setException(Servererror.fromJson(e.response!.data));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<AddStoreResponse>> addStore(
    String accessToken,
    String adminId,
    String serviceCategoryId,
    List<String> storeCategories,
    String name,
    String description,
    File image,
    String lat,
    String long,
    String address,
    String deliveryRange,
    String mobile,
    String email,
    List<String> selectedZoneID,
  ) async {
    AddStoreResponse response;
    try {
      dio!.options.headers.addAll({"Authorization": "Bearer " + accessToken});
      response = await apiClient!.addStore("multipart/form-data", adminId, storeCategories, serviceCategoryId, name, description, image, lat, long, address, deliveryRange, mobile, email, selectedZoneID).then((value) {
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
    } on DioError catch (e) {
      print(e.response!.data);
      print("e.response");
      print(Servererror.fromJson(e.response!.data).message);
      return BaseModel()..setException(Servererror.fromJson(e.response!.data));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel2<dynamic>> editStore(
    String storeId,
    String accessToken,
    String adminId,
    String serviceCategoryId,
    List<String> storeCategories,
    String name,
    String description,
    File image,
    String lat,
    String long,
    String address,
    String deliveryRange,
    String mobile,
    String email,
    List<String> selectedZoneID,
  ) async {
    print("addcateedsf");
    print(storeCategories);
    dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
    dynamic response;
    try {
      response = await apiClient!
          .editStore(
        storeId,
        "PUT",
        adminId,
        storeCategories,
        serviceCategoryId,
        name,
        description,
        image,
        lat,
        long,
        address,
        deliveryRange,
        mobile,
        email,
        selectedZoneID,
      )
          .then((value) {
        print(value.toJson());
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
      return BaseModel2()..setException(Servererror2.fromJson(error));
    }
    return BaseModel2()..data = response;
  }

  Future<BaseModel<ScheduleResponse>> addStoreTimeSchedule(
    String accessToken,
    String storeId,
    List<String> dayList,
    List<String> openTimeList,
    List<String> closeTimeList,
  ) async {
    ScheduleResponse response;
    dio!.options.headers.addAll({"Authorization": "Bearer " + accessToken});
    response = await apiClient!
        .addStoreSchedulTime(
      storeId,
      dayList,
      openTimeList,
      closeTimeList,
    )
        .then((value) {
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
    try {} on DioError catch (e) {
      print(e.response!.data);
      print("e.response");
      print(Servererror.fromJson(e.response!.data).message);
      return BaseModel()..setException(Servererror.fromJson(e.response!.data));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<Addrestaurantresponse>> EditRestaurants(
      String restaurantId,
      String accessToken,
      String ownerId,
      String name,
      String description,
      String avgDeliveryTime,
      String aprx_price_for_two,
      String full_address,
      String pin_code,
      String landmark,
      // double latitude,
      // double longitude,
      List<String> coordinates,
      bool is_featured,
      bool veg_only,
      String min_order_price,
      String delivery_radius,
      String delivery_charge_type,
      String fixed_delivery_charge,
      String base_delivery_charge,
      String base_delivery_distance,
      String extra_delivery_charge,
      String extra_delivery_distance,
      bool dine_in_enabled,
      bool take_away_enabled,
      bool delivery_enabled,
      String open_time,
      String closing_time,
      List<File> gallery_image,
      List<String> category,
      File image,
      String restaurant_phone,
      String restaurant_phone_secondary) async {
    Addrestaurantresponse response;
    try {
      dio!.options.headers.addAll({"Authorization": "Bearer " + accessToken});
      response = await apiClient!.EditRestaurant(
          restaurantId,
          ownerId,
          name,
          description,
          avgDeliveryTime,
          aprx_price_for_two,
          full_address,
          pin_code,
          landmark,
          // latitude.toString(),
          // longitude.toString(),
          coordinates,
          is_featured.toString(),
          veg_only.toString(),
          min_order_price,
          delivery_radius,
          delivery_charge_type,
          fixed_delivery_charge,
          base_delivery_charge,
          base_delivery_distance,
          extra_delivery_charge,
          extra_delivery_distance,
          dine_in_enabled.toString(),
          take_away_enabled.toString(),
          delivery_enabled.toString(),
          open_time,
          closing_time,
          gallery_image,
          category,
          image,
          restaurant_phone,
          restaurant_phone_secondary);
    } on DioError catch (e) {
      print(e.response!.data);
      print("e.response");
      print(Servererror.fromJson(e.response!.data).message);
      return BaseModel()..setException(Servererror.fromJson(e.response!.data));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<GetZoneResponse>> GetZone(String accessToken, double lat, double long) async {
    GetZoneResponse response;
    dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
    try {
      response = await apiClient!.GetZone(lat, long);
    } on DioError catch (e) {
      print(e.response!.data);
      print("e.response");
      return BaseModel()..setException(Servererror.fromJson(e.response!.data));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<StoreRealCategoryResponse>> getStoreRealCategory() async {
    StoreRealCategoryResponse categoryresponse;
    try {
      categoryresponse = await apiClient!.getStoreRealCategory();
      print(categoryresponse.toJson());
    } on DioError catch (e) {
      print(e.response!.data);
      return BaseModel()..setException(Servererror.fromJson(e.response!.data));
    }

    return BaseModel()..data = categoryresponse;
  }

  Future<EcomStoreModel> getEcomStore() async {
    EcomStoreModel ecom_store_model;
    try {
      ecom_store_model = await apiClient!.getEcomStore();
      print(ecom_store_model.toJson());
      return ecom_store_model;
    } on DioError catch (error) {
      print(error.response!.data);
      return EcomStoreModel()..setException(Servererror.fromJson(error.response!.data));
    }
  }

  Future<BaseModel<StoreCategoryResponse>> getStoreCategory() async {
    StoreCategoryResponse categoryresponse;
    try {
      categoryresponse = await apiClient!.getStoreCategory();
      print(categoryresponse.toJson());
    } on DioError catch (e) {
      print(e.response!.data);
      return BaseModel()..setException(Servererror.fromJson(e.response!.data));
    }

    return BaseModel()..data = categoryresponse;
  }

  Future<BaseModel<StoreServiceTypeResponse>> getStoreServiceType() async {
    StoreServiceTypeResponse typeresponse;

    try {
      typeresponse = await apiClient!.getStoreServiceType();
      print(typeresponse.toJson());
    } on DioError catch (e) {
      print(e.response!.data);
      return BaseModel()..setException(Servererror.fromJson(e.response!.data));
    }

    return BaseModel()..data = typeresponse;
  }

  Future<BaseModel<SettingsResponse>> getSettings(
    String accessToken,
  ) async {
    dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
    SettingsResponse settingResponse;
    try {
      settingResponse = await apiClient!.getSettings();
      print(settingResponse.toJson());
    } on DioError catch (e) {
      print(e.response!.data);
      return BaseModel()..setException(Servererror.fromJson(e.response!.data));
    }
    return BaseModel()..data = settingResponse;
  }

  Future<BaseModel<StoreResponse>> getAllRestaurant(String accessToken, String ownerId) async {
    dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
    StoreResponse allStoreResponse;
    try {
      allStoreResponse = await apiClient!.getAllStore();
      print(allStoreResponse.toJson());
    } on DioError catch (e) {
      print(e.response!.data);
      return BaseModel()..setException(Servererror.fromJson(e.response!.data));
    }

    return BaseModel()..data = allStoreResponse;
  }

  Future<BaseModel<Addrestaurantresponse>> UpdateStoreStatus(
    String accessToken,
    String isOpen,
    String restaurantId,
  ) async {
    print(accessToken);
    dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
    Addrestaurantresponse response;

    try {
      response = await apiClient!.UpdateStoreStatus(
        restaurantId,
        "PUT",
        isOpen,
      );
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  //dunzo code start from here

  Future<BaseModel<RegistrationResponse>> register(String name, String phone, String email, String password, String fcm_token, double latitude, double longitude, int valueType, int sub_id) async {
    RegistrationResponse response;
    print("theSub ${sub_id}");
    try {
      response = await apiClient!.register(
        name,
        phone,
        email,
        password,
        fcm_token,
        longitude,
        latitude,
        valueType,
        sub_id,
        // subscription field
      );
    } on DioError catch (e) {
      print(e.response!.data);
      print("e.response");
      return BaseModel()..setException(Servererror.fromJson(e.response!.data));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<ProfileResponse>> GetProfile(
    String token,
  ) async {
    ProfileResponse response;
    try {
      print("jsdljf");
      response = await apiClient!.GetProfile("Bearer " + token);
      print("after print");
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<ProfileResponse>> UploadBankDetails(String accessToken, String bankName, String accountNumber, String accountName, String ifscCode, String branchName) async {
    ProfileResponse response;
    try {
      dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
      response = await apiClient!.uploadBankDetails(
        // "Bearer "+Constant.AccessToken,
        "application/json",
        bankName,
        accountNumber,
        accountName,
        ifscCode,
        branchName,
      );
    } on DioError catch (e) {
      print(e.response!.data);
      print("e.response");
      return BaseModel()..setException(Servererror.fromJson(e.response!.data));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<KycResponse>> UploadKyc(
    String type,
    File images,
  ) async {
    print("addcatee");
    //dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
    KycResponse response;
    try {
      response = await apiClient!.uploadKyc(
        "Bearer " + Constant.AccessToken,
        type,
        images,
      );
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<dynamic>> UploadFcmToken(
    String accessToken,
    String FcmToken,
  ) async {
    print("addcatee");
    //dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
    dynamic response;
    try {
      response = await apiClient!.uploadFcmToken("Bearer " + Constant.AccessToken, FcmToken);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<StoreStatsResponse>> getStoreStats(String accessToken, String storeId) async {
    dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
    StoreStatsResponse storeStatsResponse;
    try {
      storeStatsResponse = Constant.isEcom == "0" ? await apiClient!.getStoreStats(storeId) : await apiClient!.getEomStoreStats(storeId);
      print(storeStatsResponse.toJson());
    } on DioError catch (e) {
      print(e.response!.data);
      return BaseModel()..setException(Servererror.fromJson(e.response!.data));
    }

    return BaseModel()..data = storeStatsResponse;
  }
}
