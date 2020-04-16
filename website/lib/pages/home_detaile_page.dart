import 'package:flutter/material.dart';
import 'package:website/model/product_entity.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductItem productItem;

  ProductDetailPage({Key key, @required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productItem.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            productItem.imageUrl,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(productItem.desc),
          ),
        ],
      ),
    );
  }
}
