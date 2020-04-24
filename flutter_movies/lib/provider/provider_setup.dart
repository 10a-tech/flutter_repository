import 'package:flutter/material.dart';
import 'package:flutter_movies/bean/theme_data_bean.dart';
import 'package:flutter_movies/bean/user_bean.dart';
import 'package:flutter_movies/service/movies_service.dart';
import 'package:flutter_movies/service/user_login_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  Provider<UserLoginService>(
    create: (_) => UserLoginService(),
  ),
  Provider<MoviesService>(
    create: (_) => MoviesService(),
  ),
  ChangeNotifierProvider<ThemeDataBean>(
    create: (_) => ThemeDataBean(ThemeMode.dark),
  ),
  ChangeNotifierProvider<UserBean>(
    create: (_) => UserBean(),
  ),
];
