/// code : 401
/// message : "Incorrect mobile no or password"
/// stack : "Error: Incorrect mobile no or password\n    at Object.loginOwnerWithMobileAndPassword (/app/src/services/owner.service.js:94:15)\n    at runMicrotasks (<anonymous>)\n    at processTicksAndRejections (node:internal/process/task_queues:96:5)\n    at async /app/src/controllers/owner.controller.js:67:23"

class Servererror {
  // int? _code;
  String? _message;
  String? _stack;

  // int? get code => _code;
  String? get message => _message;
  String? get stack => _stack;

  Servererror({
      int? code, 
      String? message, 
      String? stack}){
    // _code = code;
    _message = message;
    _stack = stack;
}

  Servererror.fromJson(dynamic json) {
    // _code = json["code"];
    // _message = (json["message"] == null)?"":json["message"];
    // _stack = json["stack"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    // map["code"] = _code;
    map["message"] = _message;
    map["stack"] = _stack;
    return map;
  }

}

class Servererror2 {
  // int? _code;
  // String? _message;
  // String? _stack;

  // int? get code => _code;
  // String? get message => _message;
  // String? get stack => _stack;

  Servererror2({
    int? code,
    String? message,
    String? stack}){
    // _code = code;
    // _message = message;
    // _stack = stack;
  }

  Servererror2.fromJson(dynamic json) {
    // _code = json["code"];
    // _message = (json["message"] == null)?"":json["message"];
    // _stack = json["stack"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    // map["code"] = _code;
    // map["message"] = _message;
    // map["stack"] = _stack;
    return map;
  }

}