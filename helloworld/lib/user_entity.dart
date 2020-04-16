import 'package:helloworld/generated/json/base/json_convert_content.dart';

class UserEntity with JsonConvert<UserEntity> {
  String name;
  int age;
  bool sex;
}
