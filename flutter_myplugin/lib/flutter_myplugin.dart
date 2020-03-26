import 'dart:async';

import 'package:flutter/services.dart';

class FlutterMyplugin {
  static const MethodChannel _channel = const MethodChannel('flutter_myplugin');

  StreamSubscription<dynamic> _eventSubscription;

  FlutterMyplugin(){
    initEvent(); 
  }

  void initEvent() {
    _eventSubscription = _eventChannelFor()
        .receiveBroadcastStream()//注册接收底层广播
        .listen(eventListener,onError: errorListener);//监听广播
  }

  //对应底层
  EventChannel _eventChannelFor(){
    return EventChannel('flutter_plugin_event');
  }

  void eventListener(dynamic event){
    final Map<dynamic,dynamic> map = event;
    switch(map['event']){
      case 'demoEvent':
        String value = map['value'];
        print("demoEvent data::: ${value}");
        break;
    }
  }

  void errorListener(Object object){
    final PlatformException e = object;
    throw e;
  }

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get getNative async {
    final String result = await _channel.invokeMethod('getNative');
    return result;
  }

  static Future<String> sayHello(String message) async {
    //第一版直接接收字符串
//    final String result = await _channel
//        .invokeMethod('sayHello', <String, dynamic>{"message": message});
//    return result;
    //第二版接收Map
    final Map<dynamic,dynamic> result = await _channel
        .invokeMethod('sayHello', <String, dynamic>{"message": message});
    return result['message']+result['info'];
  }
}
