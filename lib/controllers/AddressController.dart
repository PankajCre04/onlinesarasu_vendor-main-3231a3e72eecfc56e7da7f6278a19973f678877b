import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sooooperbusiness/commons/sessionmanager.dart';
import 'package:sooooperbusiness/controllers/pos/poscontroller.dart';
import 'package:sooooperbusiness/model/AddressModel.dart';

class AddressController extends GetxController {
  var address = "".obs;
  var lat = 0.0.obs;
  var lng = 0.0.obs;
  RxList? addressList = [].obs;
  Rx<AddressModel> addressModel =
      AddressModel(id: null, lat: 0.0, long: 0.0).obs;
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();
  RxBool isLoadingAddress = true.obs;
  TextEditingController landMarkEditingControllers = TextEditingController();
  TextEditingController floorEditingControllers = TextEditingController();
  TextEditingController userPhoneEditingControllers = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController phoneEditingControllers = TextEditingController();
  RxInt selectedType = 0.obs;
  RxString fullAddress = "".obs;
  RxString city = "".obs;
  RxString state = "".obs;
  RxString pincode = "".obs;
  RxString localityName = "".obs;
  RxBool isDefault = false.obs;
  RxBool defaultDetails = false.obs;
  StreamSubscription? _locationSubscription;
  GoogleMapController? mapController;
  List<String> addType = ["HOME", "WORK", "OTHER"];
  double zoom = 14.00;
  RxBool? show = false.obs;
  Rx<CameraPosition> currentPosition = CameraPosition(
    target: LatLng(0.0, 0.0),
    zoom: 14.00,
  ).obs;
  String? accessToken = "";

  void getCurrentLocation() async {
    //var location = await _locationTracker!.getLocation();
    Position location = await Geolocator.getCurrentPosition();
    print("Location");
    print(location);
    currentPosition.value = CameraPosition(
      target: LatLng(location.latitude, location.longitude),
      zoom: zoom,
    );

    mapController!.animateCamera(CameraUpdate.newCameraPosition(
        new CameraPosition(
            bearing: 0,
            target: LatLng(location.latitude, location.longitude),
            tilt: 0,
            zoom: zoom)));

    getAddress(location.latitude, location.longitude).then((value) {
      Placemark placeMark = value[0];
      String? name = placeMark.name;
      String? street = placeMark.street;
      String? subLocality = placeMark.subLocality;
      String? locality = placeMark.locality;
      String? administrativeArea = placeMark.administrativeArea;
      String? subadministrativeArea = placeMark.subAdministrativeArea;
      String? postalCode = placeMark.postalCode;
      pincode.value = postalCode!;
      state.value = administrativeArea!;
      String? country = placeMark.country;
      city.value = placeMark.subAdministrativeArea!;
      if (subLocality != null && subLocality.isNotEmpty) {
        localityName.value = subLocality;
      } else {
        localityName.value = subadministrativeArea!;
      }
      fullAddress.value =
          "${street} ${name}, ${localityName} ${locality}, ${administrativeArea} ${postalCode}, ${country}";
    });
  }

  void addAddress() {
    addressModel.value = AddressModel(
      id: "POS",
      name: nameEditingController.text,
      phone: phoneEditingControllers.text,
      city: city.value,
      state: state.value,
      pinCode: pincode.value,
      locality: localityName.value,
      fullAddress: fullAddress.value,
      floor_building: floorEditingControllers.text,
      lat: currentPosition.value.target.latitude,
      long: currentPosition.value.target.longitude,
    );
  }

  setMarker() {
    mapController!.animateCamera(CameraUpdate.newCameraPosition(
        new CameraPosition(
            bearing: 0,
            target: LatLng(currentPosition.value.target.latitude,
                currentPosition.value.target.longitude),
            tilt: 0,
            zoom: zoom)));
    currentPosition.value = CameraPosition(
      target: LatLng(currentPosition.value.target.latitude,
          currentPosition.value.target.longitude),
      zoom: zoom,
    );

    getAddress(currentPosition.value.target.latitude,
            currentPosition.value.target.longitude)
        .then((value) {
      print("aftergetaddress");
      Placemark placeMark = value[0];
      String? name = placeMark.name;
      String? street = placeMark.street;
      String? subLocality = placeMark.subLocality;
      String? locality = placeMark.locality;
      String? administrativeArea = placeMark.administrativeArea;
      String? subadministrativeArea = placeMark.subAdministrativeArea;
      String? postalCode = placeMark.postalCode;
      pincode.value = postalCode!;
      state.value = administrativeArea!;
      city.value = placeMark.subAdministrativeArea!;
      String? country = placeMark.country;
      if (subLocality != null && subLocality.isNotEmpty) {
        localityName.value = subLocality;
      } else {
        localityName.value = subadministrativeArea!;
      }

      fullAddress.value =
          "${street} ${name}, ${localityName} ${locality}, ${administrativeArea} ${postalCode}, ${country}";
      //_address = "${value.first.addressLine}";
      //print(value.first.addressLine);
    }); //LatLng pinCoordinates = tappedLoc
  }

  getAddress(double? lat, double? lang) async {
    //final coordinates = new Coordinates(lat, lang);
    print("getAddress");
    List<Placemark> add = await placemarkFromCoordinates(lat!, lang!);
    print(add);

    return add;
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    SessionManager.getAccessToken().then((value) {
      accessToken = value!;
      print("Access Token" + accessToken!);
    });
    addressModel = AddressModel(id: null, lat: 0.0, long: 0.0).obs;
    // city.value = addressModel.value.city!;
    // state.value = addressModel.value.state!;
    // fullAddress.value = addressModel.value.fullAddress!;
    // pincode.value = addressModel.value.pinCode!;
    // currentPosition.value = CameraPosition(
    //   target: LatLng(addressModel.value.lat!, addressModel.value.long!),
    //   zoom: zoom,
    // );
    landMarkEditingControllers.text = "";
    floorEditingControllers.text = "";
    isDefault.value = false;
    update();
  }

  void setAddress(AddressModel ad) {
    show!.value = true;
    addressModel.value = ad;
    update();
    city.value = addressModel.value.city!;
    state.value = addressModel.value.state!;
    fullAddress.value = addressModel.value.fullAddress!;
    pincode.value = addressModel.value.pinCode!;
    currentPosition.value = CameraPosition(
      target: LatLng(ad.lat!, ad.long!),
      zoom: zoom,
    );
    // landMarkEditingControllers.text = addressModel.value.locality!;
    if (addressModel.value.locality != null) {
      landMarkEditingControllers.text = addressModel.value.locality!;
    }
    floorEditingControllers.text = addressModel.value.floor_building!;
    selectedType.value =
        addType.indexWhere((element) => element == addressModel.value.type);
    isDefault.value = addressModel.value.isDefault!;

    update();
  }
}
