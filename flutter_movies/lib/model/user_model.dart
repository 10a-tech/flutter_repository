import 'package:flutter_movies/model/base_model.dart';
import 'package:flutter_movies/bean/user_bean.dart';
import 'package:flutter_movies/service/user_login_service.dart';

class UserModel extends BaseModel{

  UserLoginService _service;

  UserModel(UserLoginService service){
    this._service = service;
  }

  Future<UserBean> login(String name) async{
    showLoading();
    UserBean userBean =  await _service.login(name);
    closeLoading();
    return userBean;
  }
}