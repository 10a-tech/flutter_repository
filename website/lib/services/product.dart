import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:website/conf/configure.dart';

getProductResult([int page = 0]) async {
  String url = 'http://' +
      Config.IP +
      ':' +
      Config.PORT +
      '/?action=getProducts&page=$page';

  var res = await http.get(url);
  var json = jsonDecode(res.body);
  print(json);
  return json;
}
