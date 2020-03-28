import 'dart:async';

import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

//view创建完成回调
typedef void WebViewCreatedCallback(WebController controller);

class WebController {
  MethodChannel _channel;

  WebController.init(int id) {
    _channel = MethodChannel("nativeweb_$id");
  }

  Future<void> loadUrl(String url) async {
    assert(url != null);
    return _channel.invokeMethod("loadUrl", url);
  }
}

class Nativeweb extends StatefulWidget {
  final WebViewCreatedCallback onWebCreated;

  Nativeweb({Key key, @required this.onWebCreated});

  @override
  _NativeWebState createState() => _NativeWebState();
}

class _NativeWebState extends State<Nativeweb> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: "nativeweb",
        onPlatformViewCreated: onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: "nativeweb",
        onPlatformViewCreated: onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else {
      return Text('$defaultTargetPlatform 不支持此插件');
    }
  }

  Future<void> onPlatformViewCreated(int id) async {
    if(widget.onWebCreated == null){
      return;
    }
    widget.onWebCreated(WebController.init(id));
  }
}
