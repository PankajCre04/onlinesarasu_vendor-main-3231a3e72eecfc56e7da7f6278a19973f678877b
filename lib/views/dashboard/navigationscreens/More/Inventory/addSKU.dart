import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/controllers/inventory/inventoryController.dart';
import 'package:sooooperbusiness/controllers/order/ordercontroller.dart';
import 'package:sooooperbusiness/views/components/custombutton.dart';
import 'package:sooooperbusiness/views/components/my_text_field.dart';

class AddSKU extends StatefulWidget {
  final id;
  AddSKU(this.id);
  @override
  State<StatefulWidget> createState() => AddSKUState();
}

class AddSKUState extends State<AddSKU>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;
  InventoryController inventoryController = Get.put(InventoryController());

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
                  Text("Increase Quantity of Product"),
                  // mkl
                  SizedBox(
                    height: 10,
                  ),

                  Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: MyTextField(
                        controller: inventoryController.productQuantityController,
                        borderRadius: 10,
                        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        onChanged: (value) {},
                        labelText: 'Enter Quantity',
                        borderColor: Constant.borderColor,
                        focusedBorderColor: Constant.black,
                        borderWidth: 2,
                        keyboardType: TextInputType.number,
                        showTrailingWidget: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Quantity ';
                          }
                          return null;
                        },
                      )
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  setSKUButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  Widget setSKUButton() {
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
          "Set Quantity",
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
          Constant.secondaryColor,
          onTap: () {
            Get.back();
            inventoryController.EditProductQuantity(widget.id,inventoryController.productQuantityController.text);

          }),
    );
  }
}