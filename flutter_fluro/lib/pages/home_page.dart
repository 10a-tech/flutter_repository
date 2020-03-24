import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluro/routers/application.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fluro导航示例Home"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("下一页"),
          onPressed: () {
            _navigationTo(context);
          },
        ),
      ),
    );
  }

  _navigationTo(BuildContext context) async {
    String goodId = '0010010';
    Application.router
        .navigateTo(context, '/other?goodId=$goodId',
            transition: TransitionType.fadeIn)
        .then((result) {
      if (result != null) {
        print("result::: $result");
      }
    });
  }
}
