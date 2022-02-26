// ignore_for_file: file_names, prefer_const_constructors

import 'dart:io';

import 'package:binanse/style/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'homePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    Future.delayed(
      Duration(seconds: 5),
    ).then((value) => Get.to(HomePage()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Center(
        child: Image.asset(
          'assets/splash.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
