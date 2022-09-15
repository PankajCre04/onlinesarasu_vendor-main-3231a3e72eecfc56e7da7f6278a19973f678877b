import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/controllers/maincontroller.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:html/dom.dart' as dom;
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class PrivacyPolicy extends StatelessWidget {
  final title;
  final data;
  PrivacyPolicy(this.title,this.data);
  MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Constant.white,
          ),
        ),
        title: Text(
          title,
          // "Privacy Policy"
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Text(
            //   mainController.settingData.value.privacyPolicy!,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HtmlWidget(
                mainController.settingData.value.privacyPolicy!,
                // webView: true,
              ),
            ),
            // Html(
            //   data: mainController.settingData.value.privacyPolicy!,
            // ),
          ],
        ),
      ),
    );
  }
}
