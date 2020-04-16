import 'package:flutter/material.dart';
import 'package:myshop_flutter/model/user_model.dart';

class UserInfoProvider with ChangeNotifier {
  UserModel userModel;

  updateInfo(UserModel userModel) {
    this.userModel = userModel;
    notifyListeners();
  }
}
