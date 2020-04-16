import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:myshop_flutter/router/router_handlers.dart';

class Routers {
  static String root = '/';
  static String home = '/home';
  static String brandDetail = '/brandDetail';
  static String categoryGoodsList = '/categoryGoodsList';

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(handlerFunc:
        (BuildContext context, Map<String, List<String>> parameters) {
      print('handler not find');
    });
    router.define(root, handler: loadingHandler);
    router.define(home, handler: homeHandler);
    router.define(brandDetail, handler: webViewHandler);
    router.define(categoryGoodsList, handler: categoryGoodsListHandler);
  }
}
