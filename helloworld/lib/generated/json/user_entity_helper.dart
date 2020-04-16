import 'package:helloworld/user_entity.dart';

userEntityFromJson(UserEntity data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['age'] != null) {
		data.age = json['age']?.toInt();
	}
	if (json['sex'] != null) {
		data.sex = json['sex'];
	}
	return data;
}

Map<String, dynamic> userEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['age'] = entity.age;
	data['sex'] = entity.sex;
	return data;
}