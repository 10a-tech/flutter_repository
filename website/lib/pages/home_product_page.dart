import 'package:flutter/material.dart';
import 'package:website/model/product_entity.dart';
import 'package:website/pages/home_detaile_page.dart';
import 'package:website/utils/utils.dart';

class HomeProductPage extends StatelessWidget {
  final ProductEntity productEntity;

  HomeProductPage(this.productEntity);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      width: deviceWidth,
      color: Colors.white,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 7.0),
      child: _build(context, deviceWidth),
    );
  }

  Widget _build(BuildContext context, double deviceWidth) {
    double itemWidth = deviceWidth * 168.5 / 360;
    double imageWidth = deviceWidth * 110.0 / 360;
    List<Widget> listWidgets = productEntity.items.map((i) {
      Color bgColor = string2Color('#f8f8f8');
      Color titleColor = string2Color('#db5d41');
      Color subtitleColor = string2Color('#999999');

      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetailPage(
                        productItem: i,
                      )));
        },
        child: Container(
          width: itemWidth,
          margin: EdgeInsets.only(bottom: 5, left: 2),
          padding: EdgeInsets.only(top: 10, left: 13, bottom: 7),
          color: bgColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                i.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, color: titleColor),
              ),
              Text(
                i.desc,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, color: subtitleColor),
              ),
              Container(
                alignment: Alignment(0, 0),
                margin: EdgeInsets.only(top: 5),
                child: Image.asset(
                  i.imageUrl,
                  width: imageWidth,
                  height: imageWidth,
                ),
              )
            ],
          ),
        ),
      );
    }).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 5, bottom: 10),
          child: Text(
            '最新产品',
            style: TextStyle(
              fontSize: 16.0,
              color: Color.fromRGBO(51, 51, 51, 1),
            ),
          ),
        ),
        Wrap(
          spacing: 2,
          children: listWidgets,
        )
      ],
    );
  }
}
