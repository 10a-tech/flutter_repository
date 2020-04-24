import 'package:flutter_movies/bean/user_bean.dart';

class UserLoginService {
  //模拟登陆
  Future<UserBean> login(String name) async {
    return Future.delayed(Duration(seconds: 2), () {
      return UserBean(name: name, age: 23);
    });
  }
}
