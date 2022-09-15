import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/model/more/inventory/inventoryModel.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/More/Inventory/tabs/Products.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/More/Inventory/tabs/addon.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/More/Inventory/tabs/subcategory.dart';

import 'import.dart';
import 'tabs/category.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: parentCategories.length,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBar(
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
                "Inventory",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Constant.black,
                  fontFamily: 'Poppins_Bold',
                ),
              ),
              bottom: PreferredSize(
                  child: TabBar(
                    //isScrollable: true,
                    labelColor: Constant.black,
                    unselectedLabelColor: Constant.black.withOpacity(0.3),
                    indicatorColor: Constant.black,
                    tabs: List<Widget>.generate(parentCategories.length, (int tabindex){
                      print(categories[0]);
                      return new Tab(
                        child: Text(
                          parentCategories[tabindex],
                        ),
                      );
                    }),
                  ),
                  preferredSize: Size.fromHeight(30.0)),
              actions: <Widget>[
                // Center(
                //   child: Container(
                //     //width: 80,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(50)
                //     ),
                //     child: FlatButton(
                //       onPressed: () => {
                //         Get.to(Import())
                //       },
                //       color: Constant.secondaryColor,
                //       padding: EdgeInsets.all(8.0),
                //       child: Row(
                //         // Replace with a Row for horizontal icon + text
                //         children: <Widget>[
                //
                //
                //           Text(
                //               "Import",
                //             style: TextStyle(
                //               color: Constant.white,
                //             ),
                //           ),
                //           SizedBox(
                //             width: 5,
                //           ),
                //           Icon(
                //             Icons.addchart_sharp,
                //             color: Constant.white,
                //             size: 18,
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: List<Widget>.generate(parentCategories.length, (int tabindex){
              print(categories[0]);
              return (parentCategories[tabindex]=="Products")?
              Products():
              // (parentCategories[tabindex]=="Add-Ons")?
              // Addon():
              (parentCategories[tabindex]=="Category")?
                  Category():(parentCategories[tabindex]=="Sub category")?Subcategory():Container();//Addon();

            }),
            // children: <Widget>[
            //   subcategory(),
            //   subcategory(),
            //   subcategory(),
            //   subcategory(),
            //   subcategory(),
            //   subcategory(),
            // ],
          )),
    );
  }
}
