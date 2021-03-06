import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewWidget extends StatelessWidget{

  var url;

  var title;

  WebViewWidget(this.url,this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: WebviewScaffold(
        url: url,
        withZoom: false,
        withLocalStorage: true,
        withJavascript: true,
      ),
    );
  }
  
}