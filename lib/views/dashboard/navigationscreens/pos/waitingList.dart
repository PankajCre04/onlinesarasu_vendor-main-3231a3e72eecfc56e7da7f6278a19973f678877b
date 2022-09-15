import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/controllers/pos/waitingListController.dart';
import 'package:sooooperbusiness/model/pos/WaitingListModel.dart';
import 'package:sooooperbusiness/views/components/incrementButton.dart';
import 'package:sooooperbusiness/views/components/my_text_field.dart';

class WaitingList extends StatelessWidget {
  final WaitingListController controller = Get.put(WaitingListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Waiting List",
                    style: TextStyle(color: Constant.black, fontSize: 18, fontFamily: 'Poppins_Bold', fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.close)
                ],
              ),
            ),
            ListView.builder(
                physics: new BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: waitingList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 16, right: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Constant.blueShadowBackground,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Constant.greyBack,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    waitingList[index].Name ?? "",
                                    style: TextStyle(
                                      color: Constant.black,
                                      fontSize: 15,
                                      fontFamily: 'Poppins_Bold',
                                    ),
                                  ),
                                  Text(
                                    waitingList[index].peaple ?? "",
                                    style: TextStyle(
                                      color: Constant.black,
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              waitingList[index].id ?? "",
                              style: TextStyle(
                                color: Constant.black,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Text(
                              waitingList[index].time ?? "",
                              style: TextStyle(
                                color: Constant.black,
                                fontSize: 12,
                                fontFamily: 'Popins',
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Done',
                                style: TextStyle(color: Constant.black, fontSize: 13, fontFamily: 'Poppins-bold', fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Constant.blueShadowBackground,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Constant.greyBack,
                      ),
                    ),
                    child: Column(
                      children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top:8.0,left:8,right:8),
//                           child: Container(
//                             height: 50.0,
//                             width: MediaQuery.of(context).size.width * 0.85,
//                             child: Container(
//                               margin: EdgeInsets.symmetric(vertical: 5),
//                               padding: EdgeInsets.only(
//                                   top: 5, bottom: 2, right: 10, left: 10),
//                               width: MediaQuery.of(context).size.width * 0.8,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(29),
//                               ),
//                               child: TextFormField(
//                                 style: TextStyle(
//                                     fontSize: 12.0,
//                                     height: 1.5,
//                                     color: Colors.black),
//                                 textInputAction: TextInputAction.next,
//                                 cursorColor: Colors.black,
//                                 keyboardType: TextInputType.emailAddress,
//                                 decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   contentPadding: EdgeInsets.only(
//                                       left: 0, right: 3, top: 6, bottom: 12),
//                                   errorStyle: TextStyle(
//                                     fontSize: 10.0,
//                                     height: 0.3,
//                                   ),
//                                   fillColor: Colors.white,
//                                   filled: true,
//                                   hintText: "Customer Name",
//                                 ),
//                                 // controller: displayNameInputController,
//                                 // validator: validateDisplayName,
//                                 //enableInteractiveSelection: false,
//                                 //  keyboardType: TextInputType.name,
// //                      validator: emailValidator,
//                               ),
//                             ),
//                           ),
//                         ),
                        SizedBox(
                          height: 20,
                        ),

                        Padding(
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                          child: Container(
                            height: 40.0,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: MyTextField(
                              borderRadius: 30,
                              fillColor: Constant.white,
                              isFilled: true,
                              contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                              onChanged: (value) {},
                              labelText: 'Customer Name',
                              borderColor: Constant.borderColor,
                              focusedBorderColor: Constant.borderColor,
                              borderWidth: 2,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                          child: Container(
                            height: 40.0,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: MyTextField(
                              borderRadius: 30,
                              fillColor: Constant.white,
                              isFilled: true,
                              contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                              onChanged: (value) {},
                              labelText: 'Phone Number',
                              borderColor: Constant.borderColor,
                              focusedBorderColor: Constant.borderColor,
                              borderWidth: 2,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Constant.blueShadowBackground,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Constant.blueShadowBackground,
                                ),
                              ),
                              child: incrementButton(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Constant.secondaryColor,
                                    borderRadius: BorderRadius.circular(29),
                                    border: Border.all(
                                      color: Constant.secondaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 18.0, right: 18, top: 8, bottom: 8),
                                    child: Text(
                                      "Add",
                                      style: TextStyle(color: Constant.white, fontSize: 13, fontFamily: 'Poppins-bold', fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
