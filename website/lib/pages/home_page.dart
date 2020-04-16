import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:website/model/product_entity.dart';
import 'package:website/pages/home_banner.dart';
import 'package:website/pages/home_product_page.dart';
import 'package:website/services/product.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ProductEntity listData = ProductEntity();

  void getProductList() async {
    var result = await getProductResult();
    ProductEntity productEntity = ProductEntity().fromJson(result);
    setState(() {
      listData.items.addAll(productEntity.items);
    });
  }

  @override
  void initState() {
    listData.items = List<ProductItem>();
    getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          BannerWidget(),
          HomeProductPage(listData),
        ],
      ),
    );
  }
}
