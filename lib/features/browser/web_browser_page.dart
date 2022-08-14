import 'dart:async';

import 'package:flutter/material.dart';
import 'package:odo_tv/features/browser/web_stack.dart';
import 'package:odo_tv/styles.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebBrowser extends StatefulWidget {
  const WebBrowser({
    Key? key,
  }) : super(key: key);

  @override
  State<WebBrowser> createState() => _WebBrowserState();
}

class _WebBrowserState extends State<WebBrowser> {
  final _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: SafeArea(
          top: true,
          bottom: false,
          child: Container(
            color: Colors.black,
            width: double.infinity,
            height: double.infinity,
            child: WebStack(
              url: 'https://odotv.com.ng',
              webViewController: _controller,
            ),
          )),
    );
  }
}
