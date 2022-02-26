// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:binanse/screens/homePage.dart';
import 'package:binanse/style/appColors.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// ignore_for_file: file_names

class WebViewWidget extends StatefulWidget {
  final String? initialUrl;
  final String? title;

  const WebViewWidget({
    Key? key,
    this.initialUrl,
    this.title,
  }) : super(key: key);

  @override
  _WebViewWidgetState createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: Duration(seconds: 1),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          // appBar: AppBar(
          //   title: Text(widget.title!),
          //   leading: SizedBox(),
          //   actions: [
          //     IconButton(
          //       onPressed: () async {
          //         if (await webviewController.controller!.canGoBack()) {
          //           webviewController.controller!.goBack();
          //         }
          //       },
          //       icon: Icon(
          //         Icons.arrow_back,
          //       ),
          //     ),
          //     IconButton(
          //       onPressed: () {
          //         webviewController.controller!.reload();
          //       },
          //       icon: Icon(
          //         Icons.refresh,
          //       ),
          //     ),
          //   ],
          // ),
          body: SafeArea(
            child: Stack(
              children: <Widget>[
                WebView(
                  initialUrl: widget.initialUrl,
                  javascriptMode: JavascriptMode.unrestricted,
                  userAgent: "random",
                  gestureNavigationEnabled: true,
                  onWebViewCreated: (controller) {
                    webviewController.controller = controller;
                  },
                  onPageFinished: (finish) {
                    setState(() {
                      isLoading = false;
                    });
                  },
                ),
                isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          // color: AppColors.black,
                          backgroundColor: AppColors.yellowColor,
                          color: Colors.white54,
                        ),
                      )
                    : Stack(),
              ],
            ),
          )),
    );
  }
}
