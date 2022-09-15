import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/controllers/order/ordercontroller.dart';
import 'package:sooooperbusiness/views/components/custombutton.dart';

class SelectTimePopUp extends StatefulWidget {
  final id;
  SelectTimePopUp(this.id);
  @override
  State<StatefulWidget> createState() => SelectTimePopUpState();
}

class SelectTimePopUpState extends State<SelectTimePopUp>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;
  OrderController orderController = Get.put(OrderController());

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller!, curve: Curves.elasticInOut);

    controller!.addListener(() {
      setState(() {});
    });

    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation!,
          child: Container(
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            child: Padding(
              padding: const EdgeInsets.only(left: 50.0,right: 50,bottom: 20,top: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Set preparation Time."),
                  // mkl
                  SizedBox(
                    height: 10,
                  ),
                  selectTimeButton(),
                  SizedBox(
                    height: 10,
                  ),
                  setTimeButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget selectTimeButton() {
    return  Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).accentColor),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
              onTap: () {
                orderController.decreaseTime();
              },
              child: Container(
                padding: EdgeInsets.only(left: 12,right: 12),
                child: Icon(
                  Icons.remove,
                  color: Constant.black,
                  size: 16,
                ),
              )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3),
            padding:
            EdgeInsets.symmetric(horizontal: 3, vertical: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Colors.white),
            child: Obx(()=>
              Text(
                '${orderController.preperationTime} min',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ),
          InkWell(
              onTap: () {
                orderController.increaseTime();
              },
              child: Container(
                padding: EdgeInsets.only(left: 12,right: 12),
                child: Icon(
                  Icons.add,
                  color: Constant.black,
                  size: 16,
                ),
              )),
        ],
      ),
    );
  }

  Widget setTimeButton() {
    return Container(
      width: MediaQuery
          .of(
          context)
          .size
          .width *
          0.3,
      height: 45,
      child: CustomButton(
          title:
          "Set Time",
          textColor:
          Constant
              .white,
          textStyle: TextStyle(
              fontSize: 20,
              letterSpacing:
              1,
              fontWeight:
              FontWeight
                  .bold,
              color: Constant
                  .white,
              fontFamily:
              'Poppins'),
          borderRadius: 25,
          //customPadding: EdgeInsets.fromLTRB(20, 5, 20, 5),
          backgroundColor:
          Constant
              .secondaryColor,
          onTap: () {
            Get.back();
            orderController
                .ModifyStoreOrderStatus(
                widget.id!.toString(),
                "ACCEPTED",
                orderController.preperationTime.value.toString(),
            );

          }),
    );
  }
}