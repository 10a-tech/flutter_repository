import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:website/conf/configure.dart';

contactCompany(String msg) async {
  String url = 'http://' +
      Config.IP +
      ':' +
      Config.PORT +
      '/?action=contactCompany&msg=$msg';

  var res = await http.get(url);
  print(res.body);
  return res.body;
}
