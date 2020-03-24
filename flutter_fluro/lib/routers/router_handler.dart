//路由处理
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluro/pages/other_page.dart';
import 'router_handler.dart';

Handler otherHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parmas) {
  String goodId = parmas['goodId'].first;
  print("goodId::: ${goodId}");
  return OtherPage(goodId);
});
