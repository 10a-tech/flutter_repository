import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:website/conf/configure.dart';

getNewsResult() async {
  String url = 'http://' +
      Config.IP +
      ':' +
      Config.PORT +
      '/?action=getNews';

  var res = await http.get(url);
  var json = jsonDecode(res.body);
  print(json);
  return json;
}
