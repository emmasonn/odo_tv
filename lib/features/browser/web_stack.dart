import 'dart:async';

import 'package:flutter/material.dart';
import 'package:odo_tv/core/loading_widget.dart';
import 'package:odo_tv/styles.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebStack extends StatefulWidget {
  const WebStack({Key? key, required this.url, required this.webViewController})
      : super(key: key);
  final String url;
  final Completer<WebViewController> webViewController;

  @override
  State<WebStack> createState() => _PaymentWebStackState();
}

class _PaymentWebStackState extends State<WebStack> {
  bool isLoading = true;
  String webPageError = '';
  WebViewController? inCompleteController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        WebView(
          backgroundColor: Colors.black,
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            widget.webViewController.complete(controller);
            inCompleteController = controller;
          },
          onPageStarted: (url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (webError) {
            // showErrorDialog(inCompleteController);
            setState(() {
              webPageError = 'Unable to load payment page';
            });
          },
        ),
        (isLoading)
            ? InfoDialog.loadingHeart(color: primaryColor)
            : Container(),
      ],
    );
  }
}
