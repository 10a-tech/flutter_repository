//路由集合

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'router_handler.dart';

class Routes{
  static String root = "/";

  static String other = "/other";

  static void configureRoutes(Router router){
    //404处理
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String,List<String>> parmas){
        print("error::: eouter 没有找到");
      }
    );
    //页面路由配置
    router.define(other, handler: otherHandler);
  }
}