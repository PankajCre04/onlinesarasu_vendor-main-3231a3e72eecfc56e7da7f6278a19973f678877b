import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/controllers/authcontrollers.dart';
import 'package:sooooperbusiness/controllers/getstartedcontroller.dart';
import 'package:sooooperbusiness/controllers/maincontroller.dart';
import 'package:sooooperbusiness/main.dart';
import 'package:sooooperbusiness/views/components/custombutton.dart';
import 'package:sooooperbusiness/views/components/my_text_field.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../privacy_policy_terms_of_use/term_of_use.dart';

class LoginScreen extends StatelessWidget {
  AuthControllers authControllers = Get.put(AuthControllers());
  MainController mainController =Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Form(
          key: authControllers.formKeyLogin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 30, 0),
                child: Image.asset(
                  'assets/images/logo_long.png',
                  height: 200,
                  width: 300,
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Text(
                  "Let's Login.",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Constant.black,
                      fontFamily: 'Poppins_Bold'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Text(
                  "Enter your Email",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Constant.black,
                      fontFamily: 'Poppins'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(30, 25, 30, 0),
                  child: MyTextField(
                    controller: authControllers.loginMobileEditingController,
                    borderRadius: 30,
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    onChanged: (value) {},
                    labelText: 'Email',
                    borderColor: Constant.borderColor,
                    focusedBorderColor: Constant.black,
                    borderWidth: 2,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    showTrailingWidget: true,
                    // prefixWidget: Padding(
                    //   padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    //   child: Text("+91"),
                    // ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter email ';
                      }
                      return null;
                    },
                    trailing: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                      child: CircleAvatar(
                        backgroundColor: Constant.secondaryColor,
                        radius: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/images/arrow_bold.png'),
                        ),
                      ),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.fromLTRB(30, 25, 30, 0),
                  child: MyTextField(
                    controller: authControllers.loginPasswordEditingController,
                    borderRadius: 30,
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    onChanged: (value) {
                      if(value.isNotEmpty){
                        authControllers.isValidPassword.value=true;
                      }else{
                        authControllers.isValidPassword.value=false;
                      }
                    },
                    labelText: 'Password',
                    borderColor: Constant.borderColor,
                    focusedBorderColor: Constant.black,
                    borderWidth: 2,
                    isPasswordField: true,
                    minLine: 1,
                    maxLine: 1,
                    autofocus: true,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Password';
                      } else if (value.length < 6) {
                        return 'Min. 6 Char Password';
                      }
                      return null;
                    },
                  )),
              SizedBox(
                height: 30,
              ),
              Obx(()=>
                 CustomButton(
                  title: "Submit",
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                      color: Constant.white
                  ),
                  onTap: () {
                    if (authControllers.formKeyLogin.currentState!.validate()) {
                      authControllers.formKeyLogin.currentState!.save();
                      authControllers.loginOwner();
                    }
                  },
                  borderRadius: 25,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                  height: 65,
                  textColor: Constant.white,
                  backgroundColor: authControllers.isValidPassword.isTrue?Colors.black:Colors.grey
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 30.0, 10.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed('/sendPasswordOtp');
                    },
                    child: Text(
                      "Forgot Password ?",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Constant.black,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 0, 35, 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "By Continuing agreed to use ${Constant.appName}",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Constant.black,
                          fontFamily: 'Poppins'),
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(TermAndConditions());

                      },
                      child: Text(
                        " Terms of use & Privacy Policy",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.lightBlue,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(35, 25, 35, 0),
              //   child: PinCodeTextField(
              //     length: 6,
              //     obscureText: false,
              //     animationType: AnimationType.fade,
              //     pinTheme: PinTheme(
              //         shape: PinCodeFieldShape.box,
              //         borderRadius: BorderRadius.circular(10),
              //         fieldHeight: 50,
              //         fieldWidth: 50,
              //         activeFillColor: Colors.white,
              //         inactiveColor: Constant.borderColor,
              //         activeColor: Constant.black,
              //         disabledColor: Constant.borderColor,
              //         selectedColor: Constant.secondaryColor),
              //     animationDuration: Duration(milliseconds: 300),
              //     backgroundColor: Colors.white,
              //     keyboardType: TextInputType.number,
              //     enableActiveFill: false,
              //     cursorColor: Constant.secondaryColor,
              //     errorAnimationController: authControllers.errorController,
              //     controller: authControllers.textEditingController,
              //     onCompleted: (v) {
              //       print("Completed");
              //     },
              //     onChanged: (value) {
              //       print(value);
              //       authControllers.currentText.value = value;
              //     },
              //     beforeTextPaste: (text) {
              //       print("Allowing to paste $text");
              //       //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //       //but you can show anything you want here, like your pop up saying wrong paste format or etc
              //       return true;
              //     },
              //     appContext: context,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
