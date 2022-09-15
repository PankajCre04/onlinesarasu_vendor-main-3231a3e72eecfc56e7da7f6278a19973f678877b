import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:place_picker/entities/localization_item.dart';
import 'package:place_picker/place_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sooooperbusiness/api/repository/ownerrepo.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/sessionmanager.dart';
import 'package:sooooperbusiness/commons/utils.dart';
import 'package:sooooperbusiness/controllers/authcontrollers.dart';
import 'package:sooooperbusiness/controllers/getstartedcontroller.dart';
import 'package:sooooperbusiness/model/business_type.dart';
import 'package:sooooperbusiness/model/subscription/subscription_model.dart';
import 'package:sooooperbusiness/views/components/custombutton.dart';
import 'package:sooooperbusiness/views/components/my_list_tile.dart';
import 'package:sooooperbusiness/views/components/my_text_field.dart';
import 'package:timelines/timelines.dart';
import 'package:http/http.dart' as http;

import '../splashscreen.dart';

class GetStartedScreen extends StatefulWidget {
  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  GetStartedController getStartedController = Get.find();
  AuthControllers authControllers = Get.find();

  String dropdownvalue = 'Item 1';
  var items = <String>[];
  bool? result;
  int _value = 0;
  int sub_id = 1;

  @override
  void initState() {
    super.initState();
    var subsList = Get.arguments;
    dropdownvalue = subsList[0].products;
    for (int i = 0; i < subsList.length; i++) {
      items.add(subsList[i].products);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: Constant.white,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: Colors.black,
        //     size: 30,
        //   ),
        //   onPressed: () {
        //     Get.back();
        //   },
        // ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 30, 0),
          child: Image.asset(
            'assets/images/logo_long.png',
            height: 80,
            width: 200,
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: getStartedController.scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                width: double.infinity,
                height: 120,
                child: GetBuilder<GetStartedController>(
                    init: getStartedController,
                    builder: (getStartedController) {
                      return Timeline.tileBuilder(
                        shrinkWrap: true,
                        theme: TimelineThemeData(
                          direction: Axis.horizontal,
                          connectorTheme: ConnectorThemeData(space: 5.0, thickness: 5.0, color: Constant.black),
                        ),
                        builder: TimelineTileBuilder.connected(
                          contentsAlign: ContentsAlign.basic,
                          oppositeContentsBuilder: (context, index) {
                            if (index == getStartedController.currentPosition.value) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(20, 5.0, 20.0, 0.0),
                                child: Text(
                                  'Step ${index + 1}',
                                  style: TextStyle(fontSize: 20, letterSpacing: 1, fontWeight: FontWeight.bold, color: Constant.black, fontFamily: 'Poppins_Bold'),
                                ),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
                                child: Container(),
                              );
                            }
                          },
                          indicatorBuilder: (context, index) {
                            var color;
                            var child;
                            if (getStartedController.currentPosition.value == index) {
                              color = Constant.secondaryColor;
                              child = Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.0,
                                  valueColor: AlwaysStoppedAnimation(Colors.white),
                                ),
                              );
                            } else if (getStartedController.currentPosition.value > index) {
                              color = Constant.successColor;
                              child = Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 15.0,
                              );
                            } else {
                              color = Constant.lightGrey;
                            }

                            if (index <= getStartedController.currentPosition.value) {
                              return Stack(
                                children: [
                                  DotIndicator(
                                    size: 15.0,
                                    color: color,
                                    child: child,
                                  ),
                                ],
                              );
                            } else {
                              return Stack(
                                children: [
                                  OutlinedDotIndicator(
                                    borderWidth: 1.5,
                                    color: color,
                                    size: 15,
                                  ),
                                ],
                              );
                            }
                          },
                          connectorBuilder: (_, index, type) {
                            if (index >= 0) {
                              if (index == getStartedController.currentPosition.value) {
                                final prevColor = Constant.secondaryColor;
                                final color = Constant.lightGrey;
                                List<Color> gradientColors;
                                if (type == ConnectorType.start) {
                                  gradientColors = [Color.lerp(prevColor, color, 0.5)!, color];
                                } else {
                                  gradientColors = [prevColor, Color.lerp(prevColor, color, 0.5)!];
                                }
                                return DecoratedLineConnector(
                                  thickness: 2,
                                  space: 1.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: gradientColors,
                                    ),
                                  ),
                                );
                              } else {
                                return SolidLineConnector(
                                  space: 1.0,
                                  thickness: 2,
                                  color: Constant.lightGrey,
                                );
                              }
                            } else {
                              return null;
                            }
                          },
                          itemCount: getStartedController.totalSteps.value,
                        ),
                      );
                    })),
            Obx(
              () => IndexedStack(
                alignment: Alignment.topLeft,
                index: getStartedController.currentPosition.value,
                children: [
                  step1View(),
                  // step2View(context),
                  step3View(),
                  step4View(),
                  step5View()
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: (getStartedController.currentPosition.value == 0)
          ? Container()
          : FloatingActionButton.extended(
              onPressed: () async {
                OwnerRepo ownerRepo = OwnerRepo();
                String? accessToken = await SessionManager.getAccessToken();
                ownerRepo.UploadFcmToken(
                  accessToken!,
                  "",
                ).then((value) async {
                  // Add your onPressed code here!
                  SessionManager.saveAccessToken("");
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.remove("Selected_Restaurant");
                  prefs.remove("Owner_ID");
                  prefs.remove("Owner_Name");
                  prefs.remove("userName");
                  prefs.remove("userEmail");
                  prefs.remove("address");
                  prefs.remove("lat");
                  prefs.remove("lag");
                  print("after remove");
                  // Get.offAllNamed('/splash');
                  Get.offAllNamed('/splash');
                  // Get.offAllNamed("/");
                });
              },
              backgroundColor: Constant.secondaryColor,
              foregroundColor: Constant.white,
              icon: Icon(Icons.logout_sharp),
              label: Text(
                'Log Out',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
    );
  }

  Widget step1View() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
          child: Text(
            'Enter Details',
            style: TextStyle(fontSize: 20, letterSpacing: 1, fontWeight: FontWeight.bold, color: Constant.black, fontFamily: 'Poppins_Bold'),
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 5.0, 10.0, 0.0),
            child: Form(
              key: getStartedController.detailsKey,
              child: Column(children: [
                MyTextField(
                  controller: getStartedController.nameController,
                  borderRadius: 10,
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  onChanged: (value) {},
                  labelText: 'Name',
                  borderColor: Constant.borderColor,
                  focusedBorderColor: Constant.black,
                  borderWidth: 2,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                // MultiSelectChipField(
                //   items: getStartedController.items,
                //   title: Text(
                //     "Business Category",
                //     style: TextStyle(color: Constant.black),
                //   ),
                //   searchable: true,
                //   showHeader: true,
                //   searchTextStyle: TextStyle(fontSize: 12),
                //   headerColor: Constant.greyBack,
                //   decoration: BoxDecoration(
                //       border:
                //           Border.all(color: Constant.borderColor, width: 1.8),
                //       borderRadius: BorderRadius.all(Radius.circular(10))),
                //   selectedChipColor: Constant.secondaryColor.withOpacity(1),
                //   selectedTextStyle: TextStyle(color: Constant.white),
                //   scroll: false,
                //   scrollBar: HorizontalScrollBar(isAlwaysShown: true),
                //   onTap: (values) {
                //     //_selectedAnimals4 = values;
                //   },
                // ),
                // SizedBox(height: 10),
                MyTextField(
                  controller: getStartedController.phoneController,
                  borderRadius: 10,
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  onChanged: (value) {},
                  labelText: 'Phone Number',
                  borderColor: Constant.borderColor,
                  focusedBorderColor: Constant.black,
                  borderWidth: 2,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Phone Number';
                    } else if (value.length > 10 || value.length < 10) {
                      return "Enter 10 digit only";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: getStartedController.emailController,
                  borderRadius: 10,
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  onChanged: (value) {},
                  labelText: 'Email',
                  borderColor: Constant.borderColor,
                  focusedBorderColor: Constant.black,
                  borderWidth: 2,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter email';
                    }
                    if (!RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?").hasMatch(value)) {
                      return "Enter valid email";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: getStartedController.passwordController,
                  borderRadius: 10,
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  onChanged: (value) {},
                  labelText: 'Password',
                  borderColor: Constant.borderColor,
                  focusedBorderColor: Constant.black,
                  borderWidth: 2,
                  minLine: 1,
                  maxLine: 1,
                  isPasswordField: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Password';
                    } else if (value.length <= 5) {
                      return 'Password length should be greater then 6';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 5.0,
                ),
                //start  Subscription UI
                Container(
                    padding: const EdgeInsets.only(left: 10),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15),
                        Text("Subscription Plan", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                        //   SizedBox(height: 5),
                        DropdownButton(
                            value: dropdownvalue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                                if (dropdownvalue == "Free plan") {
                                  sub_id = 1;
                                } else if (dropdownvalue == "Premium plan") {
                                  sub_id = 2;
                                } else if (dropdownvalue == "Ultimate plan") {
                                  sub_id = 3;
                                }
                              });
                            }),
                      ],
                    )),
                // end Subscription UI
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<ProductTypeEnum>(
                          activeColor: Constant.secondaryColor,
                          contentPadding: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey.shade100, width: 0.5), borderRadius: BorderRadius.circular(5)),
                          value: ProductTypeEnum.Ecommerce,
                          groupValue: authControllers.productTypeEnum,
                          tileColor: Colors.white,
                          title: Text(ProductTypeEnum.Ecommerce.name),
                          onChanged: (val) {
                            setState(() {
                              authControllers.productTypeEnum = val;
                              print("On change ${authControllers.productTypeEnum}");
                            });
                          }),
                    ),
                    Expanded(
                      child: RadioListTile<ProductTypeEnum>(
                          activeColor: Constant.secondaryColor,
                          contentPadding: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey.shade100, width: 0.5), borderRadius: BorderRadius.circular(5)),
                          value: ProductTypeEnum.Purchasing,
                          groupValue: authControllers.productTypeEnum,
                          tileColor: Colors.white,
                          title: Text(ProductTypeEnum.Purchasing.name),
                          onChanged: (val) {
                            setState(() {
                              authControllers.productTypeEnum = val;
                              print("On change ${authControllers.productTypeEnum?.index.toString()}");
                            });
                          }),
                    ),
                  ],
                )
              ]),
            )),
        SizedBox(
          height: 50,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: CustomButton(
                title: "Save & Next",
                textColor: Constant.white,
                textStyle: TextStyle(fontSize: 20, letterSpacing: 1, fontWeight: FontWeight.bold, color: Constant.white, fontFamily: 'Poppins'),
                borderRadius: 25,
                customPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                backgroundColor: Constant.secondaryColor,
                onTap: () {
                  if (authControllers.productTypeEnum == ProductTypeEnum.Ecommerce) {
                    _value = 1;
                    Constant.is_ecom = 1;
                  }
                  if (getStartedController.detailsKey.currentState!.validate()) {
                    getStartedController.detailsKey.currentState!.save();
                    if (getStartedController.currentPosition.value < 4) {
                      authControllers.signup(_value, sub_id);
                    }
                  }
                }),
          ),
        ),
      ],
    );
  }

  // Widget step2View(context) {
  Widget step3View() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
          child: Text(
            'Enter Bank Details',
            style: TextStyle(fontSize: 20, letterSpacing: 1, fontWeight: FontWeight.bold, color: Constant.black, fontFamily: 'Poppins_Bold'),
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 5.0, 10.0, 0.0),
            child: Form(
              key: getStartedController.businessBankDetailsKey,
              child: Column(children: [
                MyTextField(
                  controller: getStartedController.bankNameController,
                  borderRadius: 10,
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  onChanged: (value) {},
                  labelText: 'Bank Name',
                  borderColor: Constant.borderColor,
                  focusedBorderColor: Constant.black,
                  borderWidth: 2,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Bank Name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: getStartedController.bankAccountController,
                  borderRadius: 10,
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  onChanged: (value) {},
                  labelText: 'Account Number',
                  borderColor: Constant.borderColor,
                  focusedBorderColor: Constant.black,
                  borderWidth: 2,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Account Number';
                    }
                    if (value.length < 9 || value.length > 18) {
                      return 'Enter Valid Account Number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: getStartedController.nameOnBankController,
                  borderRadius: 10,
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  onChanged: (value) {},
                  labelText: 'Account Holder Name',
                  borderColor: Constant.borderColor,
                  focusedBorderColor: Constant.black,
                  borderWidth: 2,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Account Name';
                    }
                    if (value.length < 3 || value.length > 20) {
                      return 'Enter Valid Account Name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: getStartedController.bankIFSCCodeController,
                  borderRadius: 10,
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  onChanged: (value) {},
                  labelText: 'IFSC Code',
                  borderColor: Constant.borderColor,
                  focusedBorderColor: Constant.black,
                  borderWidth: 2,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter IFSC Code';
                    }
                    if (value.length < 11 || value.length > 11) {
                      return 'Enter Valid IFSC Code';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: getStartedController.bankBranchController,
                  borderRadius: 10,
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  onChanged: (value) {},
                  labelText: 'Branch',
                  borderColor: Constant.borderColor,
                  focusedBorderColor: Constant.black,
                  borderWidth: 2,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter branch name';
                    }
                    if (value.length < 3 || value.length > 20) {
                      return 'Enter Valid branch name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
              ]),
            )),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: CustomButton(
                title: "Save & Next",
                textColor: Constant.white,
                textStyle: TextStyle(fontSize: 20, letterSpacing: 1, fontWeight: FontWeight.bold, color: Constant.white, fontFamily: 'Poppins'),
                borderRadius: 25,
                customPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                backgroundColor: Constant.secondaryColor,
                onTap: () {
                  if (getStartedController.businessBankDetailsKey.currentState!.validate()) {
                    getStartedController.businessBankDetailsKey.currentState!.save();
                    if (getStartedController.currentPosition.value < 4) {
                      authControllers.uploadBankDetails();
                      // getStartedController.changeSteps(
                      //     getStartedController.currentPosition.value + 1);
                    }
                  }
                }),
          ),
        ),
      ],
    );
  }

  Widget step4View() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
          child: Text(
            ' Upload Documents',
            style: TextStyle(fontSize: 20, letterSpacing: 1, fontWeight: FontWeight.bold, color: Constant.black, fontFamily: 'Poppins_Bold'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
          child: Text(
            ' Note: Upload Documents one by one',
            style: TextStyle(fontSize: 15, letterSpacing: 1, fontWeight: FontWeight.bold, color: Constant.errorColor, fontFamily: 'Poppins_Bold'),
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 5.0, 10.0, 0.0),
            child: Column(children: [
              Obx(
                () => getStartedController.owner.value.kyc != null && (getStartedController.owner.value.kyc!.length > 0 && getStartedController.owner.value.kyc![0].photo != "")
                    ? MyListTile(
                        margin: EdgeInsets.all(20),
                        title: "${getStartedController.owner.value.kyc![0].docType} (${getStartedController.owner.value.kyc![0].status})",
                        trailingIconData: Icons.check_circle,
                        trailingColor: Colors.green[700],
                        onPressed: () async {
                          if (getStartedController.owner.value.kyc![0].status == "REJECTED") {
                            getStartedController.idType.value = getStartedController.owner.value.kyc![0].docType!;
                            await getStartedController.pickImage();
                          }
                        },
                        leadingImageName: null,
                        subtitle: null,
                      )
                    : MyListTile(
                        margin: EdgeInsets.all(20),
                        title: "Aadhar Card",
                        trailingIconData: (getStartedController.aadharCardSelected.value && getStartedController.aadharCardImage != null) ? Icons.check_circle : Icons.cloud_upload,
                        trailingColor: (getStartedController.aadharCardSelected.value && getStartedController.aadharCardImage != null) ? Colors.green[700] : Colors.red,
                        onPressed: () async {
                          getStartedController.idType.value = "AADHAR";
                          await getStartedController.pickImage();
                        },
                        leadingImageName: null,
                        subtitle: null,
                      ),
              ),
              Obx(
                () => (getStartedController.owner.value.kyc != null && getStartedController.owner.value.kyc!.length > 0 && getStartedController.owner.value.kyc![0].photo != "")
                    ? Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Image.network((getStartedController.owner.value.kyc![0].photo!.contains("http")) ? getStartedController.owner.value.kyc![0].photo! : Constant.baseUrl + getStartedController.owner.value.kyc![0].photo!),
                        ),
                      )
                    : GetBuilder<GetStartedController>(
                        builder: (getstarted) => getstarted.aadharCardSelected.value && getstarted.aadharCardImage != null
                            ? Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Image.file(getstarted.aadharCardImage as File),
                              )
                            : Container(),
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => getStartedController.owner.value.kyc != null && (getStartedController.owner.value.kyc!.length > 1 && getStartedController.owner.value.kyc![1].photo != "")
                    ? MyListTile(
                        margin: EdgeInsets.all(20),
                        title: "${getStartedController.owner.value.kyc![1].docType} (${getStartedController.owner.value.kyc![1].status})",
                        trailingIconData: Icons.check_circle,
                        trailingColor: Colors.green[700],
                        onPressed: () async {
                          if (getStartedController.owner.value.kyc![1].status == "REJECTED") {
                            getStartedController.idType.value = getStartedController.owner.value.kyc![1].docType!;
                            await getStartedController.pickImage();
                          }
                        },
                        leadingImageName: null,
                        subtitle: null,
                      )
                    : MyListTile(
                        margin: EdgeInsets.all(20),
                        title: "Business PAN",
                        trailingIconData: (getStartedController.panCardSelected.value && getStartedController.panCardImage != null) ? Icons.check_circle : Icons.cloud_upload,
                        trailingColor: (getStartedController.panCardSelected.value && getStartedController.panCardImage != null) ? Colors.green[700] : Colors.red,
                        onPressed: () async {
                          getStartedController.idType.value = "PAN";
                          await getStartedController.pickImage();
                        },
                        leadingImageName: null,
                        subtitle: null,
                      ),
              ),
              (getStartedController.owner.value.kyc != null && getStartedController.owner.value.kyc!.length > 1 && getStartedController.owner.value.kyc![1].photo != "")
                  ? Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Image.network((getStartedController.owner.value.kyc![1].photo!.contains("http")) ? getStartedController.owner.value.kyc![1].photo! : Constant.baseUrl + getStartedController.owner.value.kyc![1].photo!),
                      ),
                    )
                  : GetBuilder<GetStartedController>(
                      builder: (getstarted) => getstarted.panCardSelected.value && getstarted.panCardImage != null
                          ? Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Image.file(getstarted.panCardImage as File),
                            )
                          : Container(),
                    ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => getStartedController.owner.value.kyc != null && (getStartedController.owner.value.kyc!.length > 2 && getStartedController.owner.value.kyc![2].photo != "")
                    ? MyListTile(
                        margin: EdgeInsets.all(20),
                        title: "${getStartedController.owner.value.kyc![2].docType} (${getStartedController.owner.value.kyc![2].status})",
                        trailingIconData: Icons.check_circle,
                        trailingColor: Colors.green[700],
                        onPressed: () async {
                          if (getStartedController.owner.value.kyc![2].status == "REJECTED") {
                            getStartedController.idType.value = getStartedController.owner.value.kyc![2].docType!;
                            await getStartedController.pickImage();
                          }
                        },
                        leadingImageName: null,
                        subtitle: null,
                      )
                    : MyListTile(
                        margin: EdgeInsets.all(20),
                        title: "GST Certificate if applicable",
                        trailingIconData: (getStartedController.gstCertificateSelected.value && getStartedController.gstImage != null) ? Icons.check_circle : Icons.cloud_upload,
                        trailingColor: (getStartedController.gstCertificateSelected.value && getStartedController.gstImage != null) ? Colors.green[700] : Colors.red,
                        onPressed: () async {
                          getStartedController.idType.value = "GST";
                          await getStartedController.pickImage();
                        },
                        leadingImageName: null,
                        subtitle: null,
                      ),
              ),
              (getStartedController.owner.value.kyc != null && getStartedController.owner.value.kyc!.length > 2 && getStartedController.owner.value.kyc![2].photo != "")
                  ? Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Image.network((getStartedController.owner.value.kyc![2].photo!.contains("http")) ? getStartedController.owner.value.kyc![2].photo! : Constant.baseUrl + getStartedController.owner.value.kyc![2].photo!),
                      ),
                    )
                  : GetBuilder<GetStartedController>(
                      builder: (getstarted) => getstarted.gstCertificateSelected.value && getstarted.gstImage != null
                          ? Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Image.file(getstarted.gstImage as File),
                            )
                          : Container(),
                    ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => getStartedController.owner.value.kyc != null && (getStartedController.owner.value.kyc!.length > 3 && getStartedController.owner.value.kyc![3].photo != "")
                    ? MyListTile(
                        margin: EdgeInsets.all(20),
                        title: "${getStartedController.owner.value.kyc![3].docType} (${getStartedController.owner.value.kyc![3].status})",
                        trailingIconData: Icons.check_circle,
                        trailingColor: Colors.green[700],
                        onPressed: () async {
                          if (getStartedController.owner.value.kyc![3].status == "REJECTED") {
                            getStartedController.idType.value = getStartedController.owner.value.kyc![3].docType!;
                            await getStartedController.pickImage();
                          }
                        },
                        leadingImageName: null,
                        subtitle: null,
                      )
                    : MyListTile(
                        margin: EdgeInsets.all(20),
                        title: "Fssai",
                        trailingIconData: (getStartedController.fssaiSelected.value && getStartedController.fssaiImage != null) ? Icons.check_circle : Icons.cloud_upload,
                        trailingColor: (getStartedController.fssaiSelected.value && getStartedController.fssaiImage != null) ? Colors.green[700] : Colors.red,
                        onPressed: () async {
                          getStartedController.idType.value = "Address Proof";
                          await getStartedController.pickImage();
                        },
                        leadingImageName: null,
                        subtitle: null,
                      ),
              ),
              (getStartedController.owner.value.kyc != null && getStartedController.owner.value.kyc!.length > 3 && getStartedController.owner.value.kyc![3].photo != "")
                  ? Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Image.network((getStartedController.owner.value.kyc![3].photo!.contains("http")) ? getStartedController.owner.value.kyc![3].photo! : Constant.baseUrl + getStartedController.owner.value.kyc![3].photo!),
                      ),
                    )
                  : GetBuilder<GetStartedController>(
                      builder: (getstarted) => getstarted.fssaiSelected.value && getstarted.fssaiImage != null
                          ? Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Image.file(getstarted.fssaiImage as File),
                            )
                          : Container(),
                    ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => getStartedController.owner.value.kyc != null && (getStartedController.owner.value.kyc!.length > 4 && getStartedController.owner.value.kyc![4].photo != "")
                    ? MyListTile(
                        margin: EdgeInsets.all(20),
                        title: "${getStartedController.owner.value.kyc![4].docType} (${getStartedController.owner.value.kyc![4].status})",
                        trailingIconData: Icons.check_circle,
                        trailingColor: Colors.green[700],
                        onPressed: () async {
                          if (getStartedController.owner.value.kyc![4].status == "REJECTED") {
                            getStartedController.idType.value = getStartedController.owner.value.kyc![4].docType!;
                            await getStartedController.pickImage();
                          }
                        },
                        leadingImageName: null,
                        subtitle: null,
                      )
                    : MyListTile(
                        margin: EdgeInsets.all(20),
                        title: "Photo",
                        trailingIconData: (getStartedController.photoSelected.value && getStartedController.photoImage != null) ? Icons.check_circle : Icons.cloud_upload,
                        trailingColor: (getStartedController.photoSelected.value && getStartedController.photoImage != null) ? Colors.green[700] : Colors.red,
                        onPressed: () async {
                          getStartedController.idType.value = "Photo";
                          await getStartedController.pickImage();
                        },
                        leadingImageName: null,
                        subtitle: null,
                      ),
              ),
              (getStartedController.owner.value.kyc != null && getStartedController.owner.value.kyc!.length > 4 && getStartedController.owner.value.kyc![4].photo != "")
                  ? Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Image.network((getStartedController.owner.value.kyc![4].photo!.contains("http")) ? getStartedController.owner.value.kyc![4].photo! : Constant.baseUrl + getStartedController.owner.value.kyc![4].photo!),
                      ),
                    )
                  : GetBuilder<GetStartedController>(
                      builder: (getstarted) => getstarted.photoSelected.value && getstarted.photoImage != null
                          ? Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Image.file(getstarted.photoImage as File),
                            )
                          : Container(),
                    ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => getStartedController.owner.value.kyc != null && (getStartedController.owner.value.kyc!.length > 5 && getStartedController.owner.value.kyc![5].photo != "")
                    ? MyListTile(
                        margin: EdgeInsets.all(20),
                        title: "${getStartedController.owner.value.kyc![5].docType} (${getStartedController.owner.value.kyc![5].status})",
                        trailingIconData: Icons.check_circle,
                        trailingColor: Colors.green[700],
                        onPressed: () async {
                          if (getStartedController.owner.value.kyc![5].status == "REJECTED") {
                            getStartedController.idType.value = getStartedController.owner.value.kyc![5].docType!;
                            await getStartedController.pickImage();
                          }
                        },
                        leadingImageName: null,
                        subtitle: null,
                      )
                    : MyListTile(
                        margin: EdgeInsets.all(20),
                        title: "Other",
                        trailingIconData: (getStartedController.otherSelected.value && getStartedController.otherImage != null) ? Icons.check_circle : Icons.cloud_upload,
                        trailingColor: (getStartedController.otherSelected.value && getStartedController.otherImage != null) ? Colors.green[700] : Colors.red,
                        onPressed: () async {
                          getStartedController.idType.value = "Other";
                          await getStartedController.pickImage();
                        },
                        leadingImageName: null,
                        subtitle: null,
                      ),
              ),
              (getStartedController.owner.value.kyc != null && getStartedController.owner.value.kyc!.length > 5 && getStartedController.owner.value.kyc![5].photo != "")
                  ? Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Image.network((getStartedController.owner.value.kyc![5].photo!.contains("http")) ? getStartedController.owner.value.kyc![5].photo! : Constant.baseUrl + getStartedController.owner.value.kyc![5].photo!),
                      ),
                    )
                  : GetBuilder<GetStartedController>(
                      builder: (getstarted) => getstarted.otherSelected.value && getstarted.otherImage != null
                          ? Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Image.file(getstarted.otherImage as File),
                            )
                          : Container(),
                    ),
              SizedBox(
                height: 10,
              ),
            ])),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: CustomButton(
                title: "Save & Next",
                textColor: Constant.white,
                textStyle: TextStyle(fontSize: 20, letterSpacing: 1, fontWeight: FontWeight.bold, color: Constant.white, fontFamily: 'Poppins'),
                borderRadius: 25,
                customPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                backgroundColor: Constant.secondaryColor,
                onTap: () {
                  if (((getStartedController.owner.value.kyc!.length > 0 && getStartedController.owner.value.kyc![0].photo != "") || (getStartedController.aadharCardSelected.value && getStartedController.aadharCardImage != null)) &&
                      ((getStartedController.owner.value.kyc!.length > 1 && getStartedController.owner.value.kyc![1].photo != "") || (getStartedController.panCardSelected.value && getStartedController.panCardImage != null))
                      // && ((getStartedController.owner.value.kyc!.length>2 && getStartedController.owner.value.kyc![2].photo != "")|| (getStartedController.addressProofSelected.value && getStartedController.addressProofImage != null))
                      &&
                      ((getStartedController.owner.value.kyc!.length > 2 && getStartedController.owner.value.kyc![2].photo != "") || (getStartedController.gstCertificateSelected.value && getStartedController.gstImage != null))) {
                    getStartedController.changeSteps(getStartedController.currentPosition.value + 1);
                  } else {
                    Utility.showToastSuccess("error", "Upload all documents");
                  }

                  // if ((getStartedController.aadharCardSelected.value &&
                  //         getStartedController.aadharCardImage != null) &&
                  //     (getStartedController.panCardSelected.value &&
                  //         getStartedController.panCardImage != null)) {
                  //   if (getStartedController.currentPosition.value < 4) {
                  //     authControllers.signupOwner();
                  //   }
                  // } else {
                  //   print("error");
                  //   Utility.showToastSuccess("error", "signup error");
                  // }
                }),
          ),
        ),
      ],
    );
  }

  Widget step5View() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
          child: Text(
            'Account Activation Status',
            style: TextStyle(fontSize: 20, letterSpacing: 1, fontWeight: FontWeight.bold, color: Constant.black, fontFamily: 'Poppins_Bold'),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Center(
            child: Image.asset(
          'assets/images/inreview.png',
          width: 100,
          height: 100,
        )),
        SizedBox(
          height: 30,
        ),
        Center(
          child: Text(
            'We are Reviewing your request.\nWait for some more time',
            style: TextStyle(fontSize: 16, letterSpacing: 1, fontWeight: FontWeight.normal, color: Constant.black, fontFamily: 'Poppins'),
          ),
        ),
        SizedBox(height: 30),
        // Align(
        //   alignment: Alignment.centerRight,
        //   child: Padding(
        //     padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        //     child: CustomButton(
        //         title: "Save & Next",
        //         textColor: Constant.white,
        //         textStyle: TextStyle(
        //             fontSize: 20,
        //             letterSpacing: 1,
        //             fontWeight: FontWeight.bold,
        //             color: Constant.white,
        //             fontFamily: 'Poppins'),
        //         borderRadius: 25,
        //         customPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        //         backgroundColor: Constant.secondaryColor,
        //         onTap: () {
        //           if (getStartedController.currentPosition.value < 4) {
        //             getStartedController.changeSteps(
        //                 getStartedController.currentPosition.value + 1);
        //           } else {
        //             Get.toNamed('/welcomeaccount');
        //           }
        //         }),
        //   ),
        // ),
      ],
    );
  }

  void showPlacePicker(BuildContext context) async {
    LocationResult result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PlacePicker(Constant.googleMapKey, localizationItem: LocalizationItem(languageCode: "en_in"), displayLocation: LatLng(getStartedController.lat.value, getStartedController.lat.value))));

    // Handle the result in your way
    getStartedController.address.value = result.formattedAddress!;
    getStartedController.lat.value = result.latLng!.latitude;
    getStartedController.lng.value = result.latLng!.longitude;
  }
}
