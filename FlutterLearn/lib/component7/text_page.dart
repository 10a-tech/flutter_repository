import 'package:flutter/material.dart';

class TextPage extends StatefulWidget {
  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              '删除线',
              style: TextStyle(
                color: Colors.green,
                fontSize: 36.0,
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.black,
              ),
            ),
            Text(
              '下划线',
              style: TextStyle(
                color: Colors.green,
                fontSize: 36.0,
                decoration: TextDecoration.underline,
                decorationColor: Colors.black,
              ),
            ),
            Text(
              '上划线 虚线',
              style: TextStyle(
                color: Colors.green,
                fontSize: 36.0,
                decoration: TextDecoration.overline,
                decorationStyle: TextDecorationStyle.dashed,
                decorationColor: Colors.black,
              ),
            ),
            Text(
              '倾斜 加粗',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 36.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Hello Flutter',
              style: TextStyle(
                color: Colors.green,
                fontSize: 36.0,
                fontFamily: 'lhandw',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
