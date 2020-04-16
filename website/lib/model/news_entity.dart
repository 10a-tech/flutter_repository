import 'package:website/generated/json/base/json_convert_content.dart';

class NewsEntity with JsonConvert<NewsEntity> {
	List<NewsItem> items;
}

class NewsItem with JsonConvert<NewsItem> {
	String author;
	String title;
	String content;
}
