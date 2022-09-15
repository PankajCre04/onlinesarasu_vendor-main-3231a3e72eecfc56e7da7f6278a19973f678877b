import 'package:flutter/material.dart';
import 'package:sooooperbusiness/commons/constant.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: Constant.primaryColor,
        scaffoldBackgroundColor: Constant.white,
        backgroundColor: Constant.white,
        accentColor: Constant.accentColor,
        secondaryHeaderColor: Constant.secondaryColor,
        fontFamily: 'Poppins',
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Constant.primaryColor)));
  }
}
