import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_layout_scenery/res.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Home Page'),
    );
  }
}

class HomePage extends StatelessWidget {
  static const String layout_title = '在线培训考试系统';

  static const String layout_subtitle = '十五年专注于保险行业应用解决方案';

  static const String layout_desc = '''
    在线培训考试系统提供了从培训需求、培训计划、培训实施、
  培训评估等培训事务到在线考试的全流程管理。我们拥有强
  大的组卷能力，可以从题库中随机或自主选择任意题型（单选
  、多选、判断、问答等），并且在完成考试后智能分析试卷，
  分析出试卷的知识点分布情况、对考生的成绩生成图标，考生可
  以整体以及个人成绩榜情况。
  ''';

  final String title;

  HomePage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset(
            Res.zaixianpeixun,
            width: 600.0,
            height: 240.0,
            fit: BoxFit.cover,
          ),
          _buildTitleLayout(),
          _buildMenuLayout(context),
          _buildDesLayout(),
        ],
      ),
    );
  }

  _buildTitleLayout() {
    return Container(
      padding: EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    layout_title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  layout_subtitle,
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.redAccent),
          Text('41')
        ],
      ),
    );
  }

  _buildButtonColumn(BuildContext context, IconData icon, String label) {
    Color color = Theme.of(context).primaryColor;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: color,
        ),
        Container(
          margin: EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  _buildMenuLayout(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(context, Icons.call, 'Call'),
          _buildButtonColumn(context, Icons.near_me, 'Route'),
          _buildButtonColumn(context, Icons.share, 'Share'),
        ],
      ),
    );
  }

  _buildDesLayout() {
    return Container(
      padding: EdgeInsets.all(32.0),
      child: Text(layout_desc),
    );
  }
}
