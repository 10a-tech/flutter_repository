import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;

  Product(this.title, this.description);
}

class FirstPage extends StatelessWidget {
  final Product product = Product("商品1", "商品一号");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("导航页面1示例"),
      ),
        body: RouteButton(),
//      body:Builder(
//        builder: (BuildContext context){
//          return Center(
//            child: RaisedButton(
//              child: Text("跳转到一下页面"),
//              onPressed: () {
//                _navigateTo(context);
////            Navigator.push(context, MaterialPageRoute(builder: (context) {
////              return SecondPage(product: product);
////            }));
//              },
//            ),
//          );
//        },
//      )
    );
  }

  _navigateTo(BuildContext context) async {
    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => SecondPage(product: product)));
    print("result:::$result");
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("$result"),
    ));
  }
}

class RouteButton extends StatelessWidget {
  final Product product = Product("商品1", "商品一号");

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: (){
        _navigateTo(context);
      },
      child: Text("跳转页面"),
    );
  }

  _navigateTo(BuildContext context) async {
    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => SecondPage(product: product)));
    print("result:::$result");
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("$result"),
    ));
  }
}


class SecondPage extends StatelessWidget {
  final Product product;

  SecondPage({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("导航页面2示例${product.title}---${product.description}"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("返回到上一页面"),
          onPressed: () {
            Navigator.pop(context, "hello back");
          },
        ),
      ),
    );
  }
}
