import 'package:flutter/material.dart';

class BaseModel with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  void showLoading() {
    this._loading = true;
    //通知状态改变
    notifyListeners();
  }

  void closeLoading() {
    this._loading = false;
    //通知状态改变
    notifyListeners();
  }
}
