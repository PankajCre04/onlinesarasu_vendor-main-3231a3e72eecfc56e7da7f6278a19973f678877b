import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:geocoding/geocoding.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/utils.dart';
import 'package:sooooperbusiness/controllers/AddressController.dart';
import 'package:sooooperbusiness/controllers/pos/poscontroller.dart';
import 'package:sooooperbusiness/views/components/custombutton.dart';
import 'package:sooooperbusiness/views/components/labeledcheckbox.dart';
import 'package:sooooperbusiness/views/components/my_text_field.dart';

class AddressMap extends StatelessWidget {
  AddressController addressController = Get.find();

  AddressMap();

  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   title: Text(
      //       'Select Address',
      //     style: TextStyle(
      //       color: Colors.black
      //     ),
      //   ),
      // ),
      body: Stack(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Obx(
                  () => GoogleMap(
                      scrollGesturesEnabled: true,
                      mapType: MapType.normal,
                      zoomGesturesEnabled: true,
                      zoomControlsEnabled: true,
                      onCameraIdle: () {
                        // _controller.getLatLng(screenCoordinate)
                        print("ONIDLE");
                        // addressController.setMarker();
                        //setState(() {});
                        // addressController.setMarker();
                      },
                      gestureRecognizers: Set()
                        ..add(Factory<PanGestureRecognizer>(
                            () => PanGestureRecognizer()))
                        ..add(Factory<VerticalDragGestureRecognizer>(
                            () => VerticalDragGestureRecognizer()))
                        ..add(Factory<HorizontalDragGestureRecognizer>(
                            () => HorizontalDragGestureRecognizer()))
                        ..add(Factory<ScaleGestureRecognizer>(
                            () => ScaleGestureRecognizer())),
                      buildingsEnabled: true,
                      onCameraMoveStarted: () {},
                      onCameraMove: (value) {
                        print("ONMOVE" + value.target.toString());
                        //_setMarker(value.target);

                        addressController.currentPosition.value =
                            CameraPosition(
                          target: LatLng(
                              value.target.latitude, value.target.longitude),
                          zoom: addressController.zoom,
                        );
                      },
                      initialCameraPosition:
                          addressController.currentPosition.value,
                      onMapCreated: (GoogleMapController controller) {
                        addressController.mapController = controller;
                        addressController.getCurrentLocation();
                      },
                      onTap: (value) {
                        addressController.currentPosition.value =
                            CameraPosition(
                          target: value,
                          zoom: addressController.zoom,
                        );
                        addressController.update();
                        addressController.setMarker();
                      }),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 50,
                right: 0,
                left: 0,
                child: Container(
                  height: 50,
                  width: 50,
                  child: Icon(
                    Icons.location_on_rounded,
                    color: Constant.secondaryColor,
                    size: 40,
                  ),
                  // child: Lottie.asset(
                  //   'assets/images/animatedmarker.json',
                  //   width: 20,
                  //   height: 20,
                  //   fit: BoxFit.scaleDown,
                  // ),
                ),
              ),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.20,
            minChildSize: 0.20,
            maxChildSize: 0.70,
            expand: true,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  color: Colors.white,
                  //elevation: 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 10),
                        child: Text('SET DELIVERY LOCATION',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins_Bold",
                            )),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 20, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Constant.secondaryColor,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Obx(
                                  () => Text(
                                    (addressController.localityName.isEmpty)
                                        ? "Searching...."
                                        : '${addressController.localityName.value}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                // Container(
                                //   height: 50,
                                //   width: 50,
                                //   child: Lottie.asset(
                                //     'assets/images/animatedmarker.json',
                                //     width: 20,
                                //     height: 20,
                                //     fit: BoxFit.fill,
                                //   ),
                                // )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Obx(
                                  () => Text(
                                    (addressController.fullAddress.isEmpty)
                                        ? ""
                                        : '${addressController.fullAddress.value}',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    //overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Form(
                        key: addressController.addressFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyTextField(
                                    controller: addressController
                                        .landMarkEditingControllers,
                                    borderRadius: 10,
                                    keyboardType: TextInputType.text,
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20, 15, 20, 15),
                                    onChanged: (value) {},
                                    labelText: 'Landmark/Street',
                                    borderColor: Constant.borderColor,
                                    focusedBorderColor: Constant.black,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Landmark/Street';
                                      }
                                      return null;
                                    },
                                    borderWidth: 2,
                                    // trailing: Padding(
                                    //   padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                                    //   child: CircleAvatar(
                                    //     backgroundColor: Constant.secondaryColor,
                                    //     radius: 5,
                                    //     child: Padding(
                                    //       padding: const EdgeInsets.all(8.0),
                                    //       child: Image.asset('assets/icons/arrow_bold.png'),
                                    //     ),
                                    //   ),
                                    // ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  MyTextField(
                                    controller: addressController
                                        .floorEditingControllers,
                                    borderRadius: 10,
                                    keyboardType: TextInputType.text,
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20, 15, 20, 15),
                                    onChanged: (value) {},
                                    labelText: 'Flat no. / House no. ',
                                    borderColor: Constant.borderColor,
                                    focusedBorderColor: Constant.black,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter Flat no. / House no.';
                                      }
                                      return null;
                                    },
                                    borderWidth: 2,
                                    // trailing: Padding(
                                    //   padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                                    //   child: CircleAvatar(
                                    //     backgroundColor: Constant.secondaryColor,
                                    //     radius: 5,
                                    //     child: Padding(
                                    //       padding: const EdgeInsets.all(8.0),
                                    //       child: Image.asset('assets/icons/arrow_bold.png'),
                                    //     ),
                                    //   ),
                                    // ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  MyTextField(
                                    controller:
                                        addressController.nameEditingController,
                                    borderRadius: 10,
                                    keyboardType: TextInputType.text,
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20, 15, 20, 15),
                                    onChanged: (value) {},
                                    labelText: 'Person Name',
                                    borderColor: Constant.borderColor,
                                    focusedBorderColor: Constant.black,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter Name';
                                      }
                                      return null;
                                    },
                                    borderWidth: 2,
                                    // trailing: Padding(
                                    //   padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                                    //   child: CircleAvatar(
                                    //     backgroundColor: Constant.secondaryColor,
                                    //     radius: 5,
                                    //     child: Padding(
                                    //       padding: const EdgeInsets.all(8.0),
                                    //       child: Image.asset('assets/icons/arrow_bold.png'),
                                    //     ),
                                    //   ),
                                    // ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  MyTextField(
                                    controller: addressController
                                        .phoneEditingControllers,
                                    borderRadius: 10,
                                    // keyboardType:
                                    //     TextInputType.text,
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20, 15, 20, 15),
                                    onChanged: (value) {},
                                    labelText: 'Person Phone Number',
                                    borderColor: Constant.borderColor,
                                    focusedBorderColor: Constant.black,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter Phone Number';
                                      }
                                      return null;
                                    },
                                    borderWidth: 2,
                                    // trailing: Padding(
                                    //   padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                                    //   child: CircleAvatar(
                                    //     backgroundColor: Constant.secondaryColor,
                                    //     radius: 5,
                                    //     child: Padding(
                                    //       padding: const EdgeInsets.all(8.0),
                                    //       child: Image.asset('assets/icons/arrow_bold.png'),
                                    //     ),
                                    //   ),
                                    // ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: GetBuilder<AddressController>(
                            builder: (addressController) {
                          return CustomButton(
                            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            backgroundColor: Constant.secondaryColor,
                            textColor: Constant.white,
                            textStyle:
                                TextStyle(fontSize: 14, color: Constant.white),
                            title: (addressController.show!.value)
                                ? 'ADD ADDRESS'
                                : (addressController.show == true)
                                    ? 'CONFIRM LOCATION'
                                    : 'CONFIRM LOCATION',
                            onTap: () {
                              if (addressController.addressFormKey.currentState!
                                  .validate()) {
                                if (addressController.fullAddress.value
                                    .contains("")) {
                                  if (addressController.pincode.value
                                      .contains("")) {
                                    addressController.pincode.value = "000000";
                                  }
                                  addressController.addAddress();
                                  Get.back();
                                } else {
                                  Utility.showToastError("Address Error",
                                      "Please Select location on map");
                                }
                              }
                            },
                          );
                        }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    elevation: 2.0,
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.arrow_back,
                      size: 25.0,
                    ),
                    padding: EdgeInsets.all(10.0),
                    shape: CircleBorder(),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: RawMaterialButton(
                    onPressed: () {
                      addressController.getCurrentLocation();
                    },
                    elevation: 2.0,
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.location_searching,
                      size: 25.0,
                    ),
                    padding: EdgeInsets.all(10.0),
                    shape: CircleBorder(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
//_AddressMapState a1 = new _AddressMapState(userId,addressId);
}
