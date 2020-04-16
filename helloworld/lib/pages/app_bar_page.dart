import 'package:flutter/material.dart';

class AppBarPage extends StatefulWidget {
  @override
  _AppBarPageState createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> {
  @override
  Widget build(BuildContext context) {
//    return SizedBox(
//      height: 200,
//      child: AppBar(
//        title: Text('应用'),
//        //操作按钮
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.print),
//            tooltip: '打印',
//            onPressed: (){
//
//            },
//          ),
//          IconButton(
//            icon: Icon(Icons.plus_one),
//            tooltip: '更多',
//            onPressed: (){
//
//            },
//          ),
//          IconButton(
//            icon: Icon(Icons.share),
//            tooltip: '分享',
//            onPressed: (){
//
//            },
//          )
//        ],
//      ),
//    );

    return SizedBox(
      height: 500,
      child: AppBar(
        title: Text('标题'),
        //左侧图标
        leading: Icon(Icons.home),
        //背景色
        backgroundColor: Colors.green,
        //标题居中
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.print),
            tooltip: '打印',
            onPressed: (){},
          ),
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context)=><PopupMenuItem<String>>[
              PopupMenuItem<String>(
                value: 'friend',
                child: Text('分享到朋友圈'),
              ),
              PopupMenuItem<String>(
                value: 'download',
                child: Text('下载到本地'),
              ),
            ]
          )
        ],
      ),
    );
  }
}
