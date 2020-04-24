import 'package:flutter/cupertino.dart';

class UserBean with ChangeNotifier {
  String name;
  int age;

  UserBean({this.name = "", this.age});

  void update(UserBean userBean) {
    this.name = userBean.name;
    this.age = userBean.age;
    //用户信息更新发送通知
    notifyListeners();
  }
}
