import 'package:website/generated/json/base/json_convert_content.dart';

class ProductEntity with JsonConvert<ProductEntity> {
	List<ProductItem> items;
}

class ProductItem with JsonConvert<ProductItem> {
	String desc;
	String imageUrl;
	String type;
	String name;
	String point;
}
