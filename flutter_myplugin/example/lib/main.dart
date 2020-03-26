import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_myplugin/flutter_myplugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _native = 'Unknown';

  @override
  void initState() {
    super.initState();
    FlutterMyplugin();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    String native;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterMyplugin.platformVersion;
      native = await FlutterMyplugin.getNative;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
      native = 'Failed to get Native';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _native = native;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Plugin example app'),
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  Text('Running on: $_platformVersion\n'),
                  Text('Running on: $_native\n'),
                  RaisedButton(
                    child: Text('传递参数'),
                    onPressed: () async {
                      String message =
                          await FlutterMyplugin.sayHello("我是dart里面的数据");
                      print("message::: ${message}");
                    },
                  )
                ],
              ),
            )));
  }
}
