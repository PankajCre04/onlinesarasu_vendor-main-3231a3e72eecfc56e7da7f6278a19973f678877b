

import 'package:sooooperbusiness/model/Schedule_data.dart';

class ScheduleResponse {
  ScheduleResponse({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  List<ScheduleData>? data;
  String? message;

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) => ScheduleResponse(
    success: json["success"],
    data: List<ScheduleData>.from(json["data"].map((x) => ScheduleData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}


