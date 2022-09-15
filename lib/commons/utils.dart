import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/loading_dialog.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:launch_review/launch_review.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Utility {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  void showSnack(String text) {
    if (_scaffoldKey.currentContext != null) {
      ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(SnackBar(content: Text(text)));
    }
  }

  static void showToast(String msg, String body) {
    Get.snackbar(msg, body,
        backgroundColor: Constant.primaryColor,
        backgroundGradient: LinearGradient(
          colors: [Constant.primaryColor, Constant.secondaryColor],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
        colorText: Constant.white,
        animationDuration: Duration(milliseconds: 900),
        duration: Duration(milliseconds: 900),
        margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
        snackPosition: SnackPosition.TOP);
  }

  static void showSingleTextToast(String msg) {
    Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0);
  }

  Future<dynamic> showUpdate(BuildContext context, bool isForce) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              // height: 200,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "A new update available",
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Constant.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // TextField(
                    //   decoration: InputDecoration(
                    //       border: InputBorder.none,
                    //       hintText: 'A new update Available'),
                    // ),
                    Row(
                      children: [
                        Expanded(
                          child: RaisedButton(
                            onPressed: () {
                              LaunchReview.launch(
                                androidAppId: "com.maltech.localshoppivendor",
                              );
                              // InAppUpdate.performImmediateUpdate()
                              //     .catchError((e) => showSnack(e.toString()));
                            },
                            child: Text(
                              "Update",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Constant.secondaryColor,
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        (isForce)
                            ? Container()
                            : Expanded(
                                child: RaisedButton(
                                  onPressed: () {
                                    print("laga diye");
                                    Get.back();
                                    // InAppUpdate.performImmediateUpdate()
                                    //     .catchError((e) => showSnack(e.toString()));
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: Constant.secondaryColor,
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  static String formateDate(DateTime date) {
    return DateFormat("dd-MM-yyyy").format(date);
  }

  static String formateDateWithMonth(DateTime date) {
    return DateFormat.yMMMMd().format(date);
  }

  // static void showSingleTextToast(String msg) {
  //   Fluttertoast.showToast(
  //       msg: msg,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       fontSize: 16.0);
  // }

  static void showSingleSuccessToast(String msg) {
    Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.green, textColor: Colors.white, fontSize: 16.0);
  }

  static void showLoadingDialog() {
    Get.dialog(LoadingDialog(), barrierDismissible: true);
  }

  static Widget myDialog() {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        padding: EdgeInsets.all(35),
        decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(5)),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: Constant.secondaryColor,
        ),
      ),
    );
  }

  static void hideLoadingDialog() {
    if (Get.isDialogOpen!) Get.back();
  }

  static void showToastSuccess(String? msg, String? body) {
    print("toastopen");
    Get.snackbar(msg!, body!,
        backgroundColor: Colors.green,
        backgroundGradient: LinearGradient(
          colors: [Colors.green, Colors.lightGreen],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
        colorText: Constant.white,
        animationDuration: Duration(milliseconds: 900),
        duration: Duration(milliseconds: 900),
        margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
        snackPosition: SnackPosition.TOP);
  }

  static void showToastError(String? msg, String? body) {
    Get.snackbar(msg!, body!,
        backgroundColor: Constant.errorColor,
        backgroundGradient: LinearGradient(
          colors: [Constant.errorColor, Constant.errorColor],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
        animationDuration: Duration(seconds: 1),
        colorText: Constant.white,
        margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
        snackPosition: SnackPosition.TOP);
  }
}
