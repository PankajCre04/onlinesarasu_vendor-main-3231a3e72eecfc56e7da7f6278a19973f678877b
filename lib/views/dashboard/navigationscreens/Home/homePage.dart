import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/controllers/pos/homecontroller.dart';
import 'package:sooooperbusiness/views/components/customcontainer.dart';

class HomePage extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: homeController.mainController.isLoadingRestaurants.value
            ? SizedBox(
                width: 15,
                height: 15,
                child: CircularProgressIndicator(),
              )
            : (homeController.mainController.selectedStore.value.id != null)
                ? Container(width: MediaQuery.of(context).size.width, child: AddRestaurantView(context))
                : Container(
                    width: MediaQuery.of(context).size.width,
                    child: RestaurantView(context),
                  ),
      ),
    );
  }

  Widget RestaurantView(context) {
    return Column(
      children: [
        CustomContainer(
          padding: 8,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                homeController.mainController.selectedStore.value.name!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Constant.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                homeController.mainController.selectedStore.value.description!,
                style: TextStyle(
                    fontSize: 12,
                    // fontWeight: FontWeight.bold,
                    color: Constant.greyDark),
              ),
              Text(
                homeController.mainController.selectedStore.value.address!,
                style: TextStyle(
                    fontSize: 12,
                    // fontWeight: FontWeight.bold,
                    color: Constant.greyDark),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget AddRestaurantView(context) {
    return CustomContainer(
      elevation: 0,
      onTap: () {},
      child: Text(
        "Add Store",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
