import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:website/app.dart';
import 'package:website/loading.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WebSite',
      theme: mDefauleTheme,
      routes: <String, WidgetBuilder>{
        'app': (BuildContext context) => App(),
        'company_info': (BuildContext context) => WebviewScaffold(
              url: 'https:www.baidu.com',
              appBar: AppBar(
                title: Text('公司介绍'),
                leading: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('app');
                  },
                ),
              ),
            ),
      },
      home: LoadingPage(),
    ));

final ThemeData mDefauleTheme = ThemeData(
  primaryColor: Colors.redAccent,
);
//void main() {
//  runApp(MyApp());
//}
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: Center(
//        child: RaisedButton(
//          child: Text('测试数据'),
//          onPressed: () async {
//            print('发起请求...');
//            String url = 'http://192.168.199.163:9090/?action=getProducts';
//            var res = await http.get(url);
//            print(res);
//            String body = res.body;
//            var json = jsonDecode(body);
//            print(json);
//          },
//        ),
//      ),
//    );
//  }
//}
