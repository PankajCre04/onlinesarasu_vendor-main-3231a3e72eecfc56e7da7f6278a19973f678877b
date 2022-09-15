import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/controllers/mainsplashcontroller.dart';

class MainSplashScreen extends StatelessWidget {
  MainSplashController mainSplashController = Get.put(MainSplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo_long.png',
                // height: 100,
                width: 300,
              ),
              // LinearProgressIndicator(
              //     color: Constant.secondaryColor,
              //     backgroundColor: Constant.transparentSecondaryColor)
            ],
          ),
        ),
      ),
    );
  }
}
