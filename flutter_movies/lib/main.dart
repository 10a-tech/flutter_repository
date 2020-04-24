import 'package:flutter/material.dart';
import 'package:flutter_movies/bean/theme_data_bean.dart';
import 'package:flutter_movies/page/login_page.dart';
import 'package:flutter_movies/provider/provider_setup.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: providers,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeDataBean>(context, listen: true).theme,
      home: LoginPage(),
    );
  }
}
