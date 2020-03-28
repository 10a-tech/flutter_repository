import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:nativeweb/nativeweb.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  WebController webController;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Nativeweb nativeweb = Nativeweb(onWebCreated: onWebController);
    
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: const Text("PlatformView example"),
        ),
        body: Container(
          child: nativeweb,
          height: 300.0,
        ),
      )
    );
  }

  void onWebController(webController){
    this.webController = webController;
    this.webController.loadUrl("https://www.baidu.com");
  }
}
