import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluro/routers/application.dart';
import 'package:flutter_fluro/routers/routers.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
    return Container(
      child: MaterialApp(
        title: "Fluro路由导航示例",
        debugShowCheckedModeBanner: false,
        //生成路由的回调函数,当导航的命名路由的时候,会使用这个来生成界面
        onGenerateRoute: Application.router.generator,
        home: HomePage(),
      ),
    );
  }
}