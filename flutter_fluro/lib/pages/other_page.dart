import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluro/routers/application.dart';

class OtherPage extends StatelessWidget {
  final String goodId;

  OtherPage(this.goodId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fluro导航示例Other"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${goodId}',
              style: TextStyle(fontSize: 28.0, color: Colors.deepOrange),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text("上一页"),
                onPressed: () {
                  Navigator.pop(context, '又回来了');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
