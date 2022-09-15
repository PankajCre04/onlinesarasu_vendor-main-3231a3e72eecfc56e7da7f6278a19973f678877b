import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/controllers/getstartedcontroller.dart';
import 'package:http/http.dart' as http;
import 'package:sooooperbusiness/views/authentication/getstarted.dart';

import '../model/subscription/subscription_model.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  GetStartedController getStartedController = Get.put(GetStartedController(), permanent: true);

  @override
  void initState() {
    super.initState();
    getSubscriptionDetails();
  }

  static List subscriptionList = [];
  getSubscriptionDetails() async {
    var response = await http.get(Uri.parse('https://onlinesarasu.ssdemo.xyz/api/subscriptions'));
    if (response.statusCode == 200) {
      var result = SubscriptionModel.fromJson(jsonDecode(response.body));
      subscriptionList = result.data as List;
    } else {
      throw Exception('Failed to load Subscription List');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.white,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 200,
                  width: 300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Text(
                  "Platform to build your own professional online store.",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Constant.black, fontFamily: 'Poppins_Bold'),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 50,
            right: -70.0,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                decoration: BoxDecoration(
                  color: Constant.transparentSecondaryColor,
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 150,
                  backgroundColor: Constant.transparentSecondaryColor,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Constant.secondaryColor,
                    child: Image.asset(
                      'assets/images/play_button.png',
                      color: Constant.white,
                      width: 25,
                      height: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 200),
              child: InkWell(
                onTap: () {
                  Get.toNamed('/login');
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 30, color: Constant.black, letterSpacing: 0.5, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 160),
              child: InkWell(
                onTap: () {
                  Get.toNamed('/getstarted', arguments: subscriptionList);
                },
                child: Text(
                  "Signup",
                  style: TextStyle(fontSize: 20, color: Constant.lightGrey, letterSpacing: 0.5, fontWeight: FontWeight.normal, fontFamily: 'Poppins'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
