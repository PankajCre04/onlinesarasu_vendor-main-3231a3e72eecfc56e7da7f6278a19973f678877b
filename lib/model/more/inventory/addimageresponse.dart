// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

class AddImageResponse {
  AddImageResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<AddImageData>? data;

  factory AddImageResponse.fromJson(Map<String, dynamic> json) => AddImageResponse(
    status: json["status"],
    message: json["message"],
    data: List<AddImageData>.from(json["data"].map((x) => AddImageData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class AddImageData {
  AddImageData({
    this.fieldname,
    this.originalname,
    this.encoding,
    this.mimetype,
    this.destination,
    this.filename,
    this.path,
    this.size,
  });

  String? fieldname;
  String? originalname;
  String? encoding;
  String? mimetype;
  String? destination;
  String? filename;
  String? path;
  int? size;

  factory AddImageData.fromJson(Map<String, dynamic> json) => AddImageData(
    fieldname: json["fieldname"],
    originalname: json["originalname"],
    encoding: json["encoding"],
    mimetype: json["mimetype"],
    destination: json["destination"],
    filename: json["filename"],
    path: json["path"],
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "fieldname": fieldname,
    "originalname": originalname,
    "encoding": encoding,
    "mimetype": mimetype,
    "destination": destination,
    "filename": filename,
    "path": path,
    "size": size,
  };
}
