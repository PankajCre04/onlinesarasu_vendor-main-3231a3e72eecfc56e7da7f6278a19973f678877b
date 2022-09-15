import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/views/components/custombutton.dart';

class AccountWelcome extends StatelessWidget {

  AccountWelcome();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constant.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Row(
          children: [
            Text(
              "Welcome to  ",
              style: TextStyle(
                  color: Constant.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins_Bold'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Image.asset(
                'assets/images/logo_long.png',
                height: 80,
                width: 150,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                "Your Account is\nsuccessfully activated",
                style: TextStyle(
                    color: Constant.secondaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins_Bold'),
              ),
            ),
            Container(
              color: Constant.greyBack,
              child:
              Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Your MID is",
                          style: TextStyle(
                              color: Constant.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Poppins'),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          "1000258",
                          style: TextStyle(
                              color: Constant.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins_Bold'),
                        ),
                      ],
                    ),
                    Text(
                      "You can login with below credentials\nxyz@gmail.com\n123456",
                      style: TextStyle(
                          color: Constant.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins_Bold'),
                    ),
                  ],

                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 20, 0),
              child: Align(
                alignment: Alignment.centerRight,
                child: CustomButton(
                    title: "Login",
                    textColor: Constant.white,
                    textStyle: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: Constant.white,
                        fontFamily: 'Poppins'),
                    borderRadius: 25,
                    customPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    backgroundColor: Constant.secondaryColor,
                    onTap: () {
                      Get.toNamed('/login');
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
