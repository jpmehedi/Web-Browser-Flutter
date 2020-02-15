import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BrowserApp(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    ),
  );
}

class BrowserApp extends StatefulWidget {
  @override
  _BrowserAppState createState() => _BrowserAppState();
}

class _BrowserAppState extends State<BrowserApp> {
  TextEditingController textEditingController = TextEditingController();
  String url = "https://";
  String urlString = "https://google.com";
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();

  void launchUrl() {
    urlString = textEditingController.text;
    flutterWebviewPlugin.reloadUrl(url+urlString);
  }

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvs) {});
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: false,
          controller: textEditingController,
          cursorColor: Colors.white,
          cursorWidth: 0.4,
          textInputAction: TextInputAction.go,
          onSubmitted: (url) => launchUrl(),
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search...',
              hintStyle: TextStyle(color: Colors.white, fontSize: 18.00)),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              launchUrl();
            },
          )
        ],
      ),
      url: urlString,
    );
  }
}
