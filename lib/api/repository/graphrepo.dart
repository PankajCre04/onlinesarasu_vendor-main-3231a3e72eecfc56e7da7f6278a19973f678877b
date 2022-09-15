import 'package:dio/dio.dart';
import 'package:sooooperbusiness/api/api_client.dart';
import 'package:sooooperbusiness/model/basemodel.dart';
import 'package:sooooperbusiness/model/graphDataResponse.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/model/servererror.dart';


class GraphRepo {
  Dio? dio;
  ApiClient? apiClient;

  GraphRepo() {
    dio = new Dio();
    apiClient = ApiClient(dio!);
  }

  Future<BaseModel<GraphDataResponse>> getGraphData(
      String accessToken,
      String startDate,
      String endDate,
      String type,
      String interval,
      ) async {
    print("in get graph repo");
    GraphDataResponse response;
    try {
      dio!.options.headers.addAll({"Authorization": "Bearer " + accessToken});
      response = await apiClient!.getGraphData(
        startDate,
        endDate,
        type,
        interval,
      ).then((value) {
        print("graph data get");
        return value;
      }).catchError((error){
        switch (error.runtimeType) {
          case DioError:
          // Here's the sample to get the failed response error code and message
            final res = (error as DioError).response;
            print("Got error : ${res!.statusCode} -> ${res.statusMessage}");
            if(res.statusCode == 401){
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
}