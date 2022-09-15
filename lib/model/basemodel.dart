import 'package:sooooperbusiness/model/servererror.dart';

class BaseModel<T> {
  Servererror? error;
  T? data;

  setException(Servererror error) {
    this.error = error;
  }

  @override
  String toString() {
    return 'BaseModel{error: $error, data: $data}';
  }

  setData(T data) {
    this.data = data;
  }

  get getException {
    return error;
  }
}

class BaseModel2<T> {
  // Servererror2? error;
  T? data;

  setException(Servererror2 error) {
    // this.error = error;
  }

  @override
  // String toString() {
  //   return 'BaseModel{error: $error, data: $data}';
  // }

  setData(T data) {
    // this.data = data;
  }

  get getException {
    // return error;
  }
}
