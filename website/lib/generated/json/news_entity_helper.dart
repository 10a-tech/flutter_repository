import 'package:website/model/news_entity.dart';

newsEntityFromJson(NewsEntity data, Map<String, dynamic> json) {
	if (json['items'] != null) {
		data.items = new List<NewsItem>();
		(json['items'] as List).forEach((v) {
			data.items.add(new NewsItem().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> newsEntityToJson(NewsEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.items != null) {
		data['items'] =  entity.items.map((v) => v.toJson()).toList();
	}
	return data;
}

newsItemFromJson(NewsItem data, Map<String, dynamic> json) {
	if (json['author'] != null) {
		data.author = json['author']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	return data;
}

Map<String, dynamic> newsItemToJson(NewsItem entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['author'] = entity.author;
	data['title'] = entity.title;
	data['content'] = entity.content;
	return data;
}