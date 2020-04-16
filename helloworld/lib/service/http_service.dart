import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:async';

//Dio请求封装

Future request(url, {formData}) async {
  try {
    Response response;
    Dio dio = Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    response = await dio.post(url, data: formData);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('后端接口异常,请检查测试代码和服务器运行情况...');
    }
  } catch (e) {
    return print('error::: ${e}');
  }
}
