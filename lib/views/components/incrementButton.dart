import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/controllers/pos/waitingListController.dart';

class incrementButton extends StatelessWidget {
  final WaitingListController controller = Get.put(WaitingListController());
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
              color: Constant.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Constant.greyDark,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.only(left: 5.0, right: 5),
                  child: InkWell(
                    onTap: () {
                      controller.decrement();
                    },
                    child: Icon(
                      CupertinoIcons.minus,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                          width: 1.0, color: Constant.lightGrey),
                      left: BorderSide(
                          width: 1.0, color: Constant.lightGrey),
                    ),
                    color: Constant.blueShadowBackground,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10),
                    child: Obx(() {
                      return Text("${controller.Count}");
                    }),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 5.0, right: 5),
                  child: InkWell(
                    onTap: () {
                      controller.increment();
                    },
                    child: Icon(
                      Icons.add,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
