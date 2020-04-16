import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myshop_flutter/config/color.dart';
import 'package:myshop_flutter/model/home_model.dart';
import 'package:myshop_flutter/widgets/cached_image_widget.dart';

class HomeProductWidget extends StatelessWidget {

  List<Goods> productList;

  HomeProductWidget(this.productList);

  _goGoodsDetail(BuildContext context, Goods goods) {

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.90,
        ),
        itemBuilder: (BuildContext context, int index) {
          return _getGridViewWidget(context, productList[index]);
        },),
    );
  }

  Widget _getGridViewWidget(BuildContext context, Goods product) {
    return Container(
      child: InkWell(
        onTap: () => _goGoodsDetail(context, product),
        child: Card(
          elevation: 2.0,
          margin: EdgeInsets.all(6.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5.0),
                child: CachedImageWidget(
                    ScreenUtil.instance.setHeight(200.0),
                    ScreenUtil.instance.setHeight(200.0),
                    product.picUrl),
              ),
              Padding(padding: EdgeInsets.only(top: 4.0)),
              Container(
                padding: EdgeInsets.only(left: 4.0, right: 4.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black54, fontSize: 14.0),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 4.0)),
              Container(
                padding: EdgeInsets.only(left: 4.0, right: 4.0),
                alignment: Alignment.center,
                child: Text(
                  "${product.retailPrice}",
                  style: TextStyle(color: KColor.priceColor, fontSize: 12.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
