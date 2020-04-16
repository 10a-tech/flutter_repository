import 'package:myshop_flutter/config/index.dart';
import 'package:myshop_flutter/model/home_model.dart';
import 'package:myshop_flutter/utils/http_util.dart';

typedef OnSuccessList<T>(List<T> list);

typedef OnSuccess<T>(T t);

typedef OnFail(String message);

class HomeService {
  Future queryHomeData(OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instence.get(ServerUrl.HOME_URL);
      if (response['errno'] == 0) {
        HomeModel homeModel = HomeModel.fromJson(response['data']);
        onSuccess(homeModel);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      onFail(KString.SERVER_EXCEPTION);
    }
  }
}
