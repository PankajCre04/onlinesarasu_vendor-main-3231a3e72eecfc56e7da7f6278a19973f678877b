import 'package:dio/dio.dart';
import 'package:sooooperbusiness/model/basemodel.dart';
import 'package:sooooperbusiness/model/pos/itemsearchresponse.dart';
import 'package:sooooperbusiness/model/servererror.dart';

import '../api_client.dart';

class POSRepo {
  Dio? dio;
  ApiClient? apiClient;

  POSRepo() {
    if (dio != null) {
      return;
    }
    if (apiClient != null) {
      return;
    }
    dio = new Dio();
    apiClient = ApiClient(dio!);
  }

  Future<BaseModel<ItemSearchResponse>> searchItems(
      String restID, String searchKeyWord) async {
    ItemSearchResponse response;

    try {
      response = await apiClient!.searchFoodItem(restID, searchKeyWord);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }
}
