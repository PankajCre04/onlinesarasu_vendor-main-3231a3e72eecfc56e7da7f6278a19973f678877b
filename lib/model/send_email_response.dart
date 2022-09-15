class SendEmailResponse {
  SendEmailResponse({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  String? data;
  String? message;

  factory SendEmailResponse.fromJson(Map<String, dynamic> json) => SendEmailResponse(
    success: json["success"],
    data: (json["data"] == null)?"":json["data"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data,
    "message": message,
  };
}
