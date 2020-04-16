import 'package:flutter/material.dart';
import 'package:website/model/product_entity.dart';
import 'package:website/pages/product_list_page.dart';
import 'package:website/services/product.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductEntity datas = ProductEntity();

  int page = 0;

  void getProductList() async {
    var data = await getProductResult(page++);
    ProductEntity productEntity = ProductEntity().fromJson(data);
    setState(() {
      if(datas.items == null){
        datas.items = List<ProductItem>();
      }
      datas.items.addAll(productEntity.items);
    });
  }

  @override
  void initState() {
    getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProductResultListWidget(
      datas,
      getNextPage: () => getProductList(),
    );
  }
}
