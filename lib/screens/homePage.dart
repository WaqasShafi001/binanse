// ignore_for_file: file_names, prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:binanse/controllers/webviewController.dart';
import 'package:binanse/style/appColors.dart';
import 'package:binanse/widgets/webview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var webviewController = Get.put(WebviewControllerr());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: Duration(seconds: 1),
      child: WillPopScope(
        onWillPop: () async {
          if (await webviewController.controller!.canGoBack()) {
            webviewController.controller!.goBack();
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
            backgroundColor: AppColors.darkColor,
            body: WebViewWidget(
              initialUrl: 'https://binanse.org/',
              title: 'Binanse',
            )),
      ),
    );
  }
}
