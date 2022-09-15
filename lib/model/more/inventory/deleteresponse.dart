class DeleteResponse {
  DeleteResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  dynamic data;

  factory DeleteResponse.fromJson(Map<String, dynamic> json) => DeleteResponse(
    status: json["status"],
    message: json["message"],
    data: (json["data"] != null)?json["data"]:null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}
