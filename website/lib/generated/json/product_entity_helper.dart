import 'package:website/model/product_entity.dart';

productEntityFromJson(ProductEntity data, Map<String, dynamic> json) {
	if (json['items'] != null) {
		data.items = new List<ProductItem>();
		(json['items'] as List).forEach((v) {
			data.items.add(new ProductItem().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> productEntityToJson(ProductEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.items != null) {
		data['items'] =  entity.items.map((v) => v.toJson()).toList();
	}
	return data;
}

productItemFromJson(ProductItem data, Map<String, dynamic> json) {
	if (json['desc'] != null) {
		data.desc = json['desc']?.toString();
	}
	if (json['imageUrl'] != null) {
		data.imageUrl = json['imageUrl']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['point'] != null) {
		data.point = json['point']?.toString();
	}
	return data;
}

Map<String, dynamic> productItemToJson(ProductItem entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['desc'] = entity.desc;
	data['imageUrl'] = entity.imageUrl;
	data['type'] = entity.type;
	data['name'] = entity.name;
	data['point'] = entity.point;
	return data;
}