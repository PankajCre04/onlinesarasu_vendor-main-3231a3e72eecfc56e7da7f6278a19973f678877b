import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/utils.dart';
import 'package:sooooperbusiness/controllers/inventory/inventoryController.dart';
import 'package:sooooperbusiness/views/components/my_list_tile.dart';

class Import extends StatelessWidget {
  InventoryController Controller = Get.put(InventoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Constant.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Constant.black,
          ),
        ),
        title: Text(
          "Import ",
          style: TextStyle(
            fontSize: 16.0,
            color: Constant.black,
            fontFamily: 'Poppins_Bold',
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Import Food Category",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Constant.secondaryColor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      // Replace with a Row for horizontal icon + text
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            "Sample File",
                                            style: TextStyle(
                                                color: Constant.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.arrow_downward,
                                          color: Constant.white,
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Import Food category file here"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Note : First import item category",
                            style: TextStyle(
                                color: Constant.secondaryColor,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => MyListTile(
                      //margin: EdgeInsets.all(20),
                      title: (Controller.FileSelected1.value &&
                              Controller.FileSelected1 != null)
                          ? "Click Import button"
                          : "Select File",
                      trailingIconData: (Controller.FileSelected1.value &&
                              Controller.FileSelected1 != null)
                          ? Icons.check_circle
                          : Icons.cloud_upload,
                      trailingColor: (Controller.FileSelected1.value &&
                              Controller.FileSelected1 != null)
                          ? Colors.green[700]
                          : Colors.red,
                      onPressed: () async {
                        await Controller.filepicker("category");
                      },
                      leadingImageName: null,
                      subtitle: null,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Constant.secondaryColor),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                // Replace with a Row for horizontal icon + text
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      if(Controller.file != null){
                                        Controller.ImportCategory();
                                      }else{
                                        Utility.showToastError("Select File", "Failed");
                                      }

                                    },
                                    child: Container(
                                      child: Text(
                                        "Import",
                                        style: TextStyle(
                                            color: Constant.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.arrow_upward,
                                    color: Constant.white,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Import Food Items",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Constant.secondaryColor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      // Replace with a Row for horizontal icon + text
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            "Sample File",
                                            style: TextStyle(
                                                color: Constant.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.arrow_downward,
                                          color: Constant.white,
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Import Food items file here"),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => MyListTile(
                      //margin: EdgeInsets.all(20),
                      title: (Controller.FileSelected2.value &&
                              Controller.FileSelected2 != null)
                          ? "Click Import button"
                          : "Select File",
                      trailingIconData: (Controller.FileSelected2.value &&
                              Controller.FileSelected2 != null)
                          ? Icons.check_circle
                          : Icons.cloud_upload,
                      trailingColor: (Controller.FileSelected2.value &&
                              Controller.FileSelected2 != null)
                          ? Colors.green[700]
                          : Colors.red,
                      onPressed: () async {
                        await Controller.filepicker("item");
                      },
                      leadingImageName: null,
                      subtitle: null,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Constant.secondaryColor),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                // Replace with a Row for horizontal icon + text
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      if(Controller.file2 != null){
                                        Controller.ImportItems();
                                      }else{
                                        Utility.showToastError("Select File", "Failed");
                                      }

                                    },
                                    child: Container(
                                      child: Text(
                                        "Import",
                                        style: TextStyle(
                                            color: Constant.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.arrow_upward,
                                    color: Constant.white,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
