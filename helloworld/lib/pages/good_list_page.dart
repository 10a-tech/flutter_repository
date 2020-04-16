import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:helloworld/model/good_list_model.dart';
import 'package:helloworld/service/http_service.dart';

class GoodListPage extends StatefulWidget {
  @override
  _GoodListPageState createState() => _GoodListPageState();
}

class _GoodListPageState extends State<GoodListPage> {
  //初始化数据模型
  GoodListModel goodList = GoodListModel([]);
  var scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //获取数据
    getGoods();
  }

  @override
  Widget build(BuildContext context) {
    if (goodList.data.length > 0) {
      return ListView.builder(
          controller: scrollController,
          itemCount: goodList.data.length,
          itemBuilder: (context, index) {
            return _ListWidget(goodList.data, index);
          });
    }
    return Container();
  }

  void getGoods() async {
    var url = 'http://192.168.199.163:9090/list';
    var formData = {'shopId': '001'};
    print('请求地址: $url');
    print('请求数据: $formData');
    await request(url, formData: formData).then((value) {
      var data = json.decode(value.toString());
      print('商品列表数据Json格式:::' + data.toString());
      setState(() {
        goodList = GoodListModel.fromJson(data);
      });
    });
  }

  Widget _ListWidget(List<GoodModel> data, int index) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 1.0, color: Colors.black12))),
      child: Row(
        children: <Widget>[
          _goodImage(data, index),
          SizedBox(
            width: 10,
          ),
          Column(
            children: <Widget>[
              _goodName(data, index),
              _goodPirate(data, index)
            ],
          )
        ],
      ),
    );
  }

  _goodImage(List<GoodModel> data, int index) {
    return Container(
      width: 150,
      height: 100,
      child: Image.network(data[index].image, fit: BoxFit.fitHeight),
    );
  }

  _goodName(List<GoodModel> data, int index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: 200,
      child: Text(
        data[index].name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  _goodPirate(List<GoodModel> data, int index) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      width: 200,
      child: Row(
        children: <Widget>[
          Text('价格:¥${data[index].presentPrice}'),
          Text('¥${data[index].oriPrice}')
        ],
      ),
    );
  }
}
