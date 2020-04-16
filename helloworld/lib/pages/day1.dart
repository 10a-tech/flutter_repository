
import 'dart:convert';

import 'package:helloworld/model/user.dart';

main() {
  String data = null;
  User user = User.fromJson(json.decode(data));
  user.toJson();
}