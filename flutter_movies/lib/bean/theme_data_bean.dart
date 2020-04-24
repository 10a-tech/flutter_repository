import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeDataBean with ChangeNotifier {
  ThemeData _themeData;
  ThemeMode _themeMode;

  ThemeData get theme => _themeData;

  ThemeDataBean(ThemeMode themeMode) {
    this._themeMode = themeMode;
    if (themeMode == ThemeMode.dark) {
      _themeData = ThemeData.dark();
    } else {
      _themeData = ThemeData.light();
    }
  }

  void change() {
    if (_themeMode == ThemeMode.light) {
      _themeData = ThemeData.dark();
      _themeMode = ThemeMode.dark;
    } else {
      _themeData = ThemeData.light();
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
