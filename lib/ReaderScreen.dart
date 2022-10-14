import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReaderScreen extends StatefulWidget {
  final int chapterId;
  const ReaderScreen({Key? key, required this.chapterId}) : super(key: key);

  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  late WebViewController webViewController;
  late String _fileUrl;
  void _loadChapter1() async {
    _fileUrl = await rootBundle.loadString("assets/chapter_1.html");
    webViewController.loadUrl(Uri.dataFromString(_fileUrl,
            mimeType: "text/html", encoding: Encoding.getByName("utf8"))
        .toString());
  }

  void _loadChapter2() async {
    _fileUrl = await rootBundle.loadString("assets/chapter_2.html");
    webViewController.loadUrl(Uri.dataFromString(_fileUrl,
            mimeType: "text/html", encoding: Encoding.getByName("utf8"))
        .toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("chapter " + widget.chapterId.toString())),
      body: WebView(
        initialUrl: "about:blank",
        onWebViewCreated: (WebViewController controller) {
          webViewController = controller;
          if (widget.chapterId == 1) _loadChapter1();
        },
      ),
    );
  }
}
