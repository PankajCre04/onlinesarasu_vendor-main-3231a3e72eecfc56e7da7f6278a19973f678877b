import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/utils.dart';
import 'package:sooooperbusiness/controllers/schedule_time_controller.dart';
import 'package:sooooperbusiness/views/components/custombutton.dart';
import 'package:sooooperbusiness/views/components/customcontainer.dart';
import 'package:sooooperbusiness/views/components/my_text_field.dart';

class ScheduleStoreTiming extends StatelessWidget {
  final storeId;
  ScheduleStoreTiming(this.storeId);
  ScheduleTimeController scheduleTimeController = Get.put(ScheduleTimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Constant.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Constant.black,
          ),
        ),
        title: Text(
          "Schedule Restaurant Timing",
          style: TextStyle(
            fontSize: 16.0,
            color: Constant.black,
            fontFamily: 'Poppins_Bold',
          ),
        ),
      ),
      body: Obx(()=>
        SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: scheduleTimeController.selectedDaysList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(() {
                              return Container(
                                height: 45,
                                width: 120,
                                padding: EdgeInsets.only(left: 20, right: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Constant.white,
                                    border: Border.all(
                                        color: Colors.grey.shade300, width: 1)),
                                child: DropdownButton<String>(
                                  value: (scheduleTimeController.selectedDaysList[index] == "")
                                      ?scheduleTimeController.days[0]
                                      :scheduleTimeController.selectedDaysList[index],
                                  icon: Icon(
                                    Icons.arrow_drop_down_circle_rounded,
                                    color: Constant.secondaryColor,
                                  ),
                                  iconSize: 20,
                                  underline: SizedBox(),
                                  isExpanded: true,
                                  style: const TextStyle(color: Colors.black),
                                  onChanged: (String? newValue) {
                                    print(newValue);
                                    scheduleTimeController.selectedDaysList[index] = newValue!;
                                    // offerController.discountType.value = newValue!;
                                  },
                                  items: scheduleTimeController.days.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              );
                            }),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: CustomContainer(
                                  onTap: () async {
                                    scheduleTimeController.selectedOpenTime[index] = await scheduleTimeController.selectTime(context);
                                  },
                                  elevation: 0,
                                  height: 55,
                                  borderColor: Constant.borderColor,
                                  borderRadius: 10,
                                  child: Center(
                                      child: Obx(()=>
                                          Text(
                                              (scheduleTimeController.selectedOpenTime[index] == "")
                                                  ?"Open Time"
                                                  :scheduleTimeController.selectedOpenTime[index]
                                          ),
                                      )
                                  )
                              ),
                            ),

                            Expanded(
                              child: CustomContainer(
                                  onTap: () async {
                                    scheduleTimeController.selectedCloseTime[index] = await scheduleTimeController.selectTime(context);
                                  },
                                  elevation: 0,
                                  height: 55,
                                  borderColor: Constant.borderColor,
                                  borderRadius: 10,
                                  child: Center(
                                      child: Obx(()=>
                                          Text(
                                              (scheduleTimeController.selectedCloseTime[index] == "")
                                                  ?"Close Time"
                                                  :scheduleTimeController.selectedCloseTime[index]
                                          ),
                                      )
                                  )
                              ),
                            ),

                            CustomContainer(
                              elevation: 0,
                              onTap: () {
                                scheduleTimeController.selectedDaysList.removeAt(index);
                                scheduleTimeController.selectedOpenTime.removeAt(index);
                                scheduleTimeController.selectedCloseTime.removeAt(index);
                              },
                              // backgroundColor: Colors.black,
                              padding: 0,
                              width: 30,
                              height: 50,
                              child: Center(
                                child: Icon(
                                  Icons.cancel,
                                  size: 20,
                                  color: Constant.errorColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                ),
                SizedBox(
                  height: 10,
                ),
                CustomContainer(
                  onTap: () {
                    scheduleTimeController.selectedDaysList.add("Monday");
                    scheduleTimeController.selectedOpenTime.add("");
                    scheduleTimeController.selectedCloseTime.add("");
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.add,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Add Schedule"
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomButton(
        title: "Add Schedule",
        onTap: () {
          if(!scheduleTimeController.selectedOpenTime.contains("") && !scheduleTimeController.selectedCloseTime.contains("")){
            scheduleTimeController.addStoreTimeSchedule(storeId);
          }else{
            Utility.showToastSuccess(
                "Fill all added slots", "null value");
          }

        },
        borderRadius: 25,
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
        height: 65,
        textColor: Constant.white,
        backgroundColor: Constant.black,
      ),
    );
  }
}
