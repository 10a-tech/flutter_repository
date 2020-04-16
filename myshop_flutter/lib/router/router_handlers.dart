import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:myshop_flutter/page/home/index_page.dart';
import 'package:myshop_flutter/page/loading/loading_page.dart';
import 'package:myshop_flutter/utils/fluro_convert_util.dart';
import 'package:myshop_flutter/utils/string_util.dart';
import 'package:myshop_flutter/widgets/webview_widget.dart';

var homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return IndexPage();
});

var loadingHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return LoadPage();
});

var webViewHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  var title = FluroConvertUtil.fluroCnParamsDecode(parameters['title'].first);
  var url = FluroConvertUtil.fluroCnParamsDecode(parameters['url'].first);
  return WebViewWidget(url, title);
});

var categoryGoodsListHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  var categoryName = StringUtil.decode(parameters['categoryName'].first);
  print('categoryName::: $categoryName');
  var categoryId = StringUtil.decode(parameters['categoryId'].first);
  print('categoryId::: $categoryId');
  //  TODO
  return null;
});
