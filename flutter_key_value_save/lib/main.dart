import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SharedPreferences示例',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'SharedPreferences示例'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<SharedPreferences> _perfs = SharedPreferences.getInstance();
  var controller = TextEditingController();
  bool value_dart = false;
  bool value_js = false;
  bool value_java = false;

  @override
  void initState() {
    super.initState();
    initFromCache();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SharedPreferences示例"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: controller,
              decoration: InputDecoration(labelText: '昵称', hintText: '请输入昵称'),
            ),
            Text('你喜欢的编程语言'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Dart'),
                Switch(
                    value: value_dart,
                    onChanged: (isChanged) {
                      setState(() {
                        this.value_dart = isChanged;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Js'),
                Switch(
                    value: value_js,
                    onChanged: (isChanged) {
                      setState(() {
                        this.value_js = isChanged;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Java'),
                Switch(
                    value: value_java,
                    onChanged: (isChanged) {
                      setState(() {
                        this.value_java = isChanged;
                      });
                    }),
              ],
            ),
            MaterialButton(
                child: Text('保存'),
                onPressed: () {
                  saveInfo(controller.text);
                })
          ],
        ),
      ),
    );
  }

  void initFromCache() async {
    final SharedPreferences prefs = await _perfs;
    final value_nickname = prefs.getString("key_nickname");
    final value_dart = prefs.getBool("key_dart");
    final value_js = prefs.getBool("key_js");
    final value_java = prefs.getBool("key_java");
    setState(() {
      controller.text = (value_nickname == null ? "" : value_nickname);
      this.value_dart = (value_dart == null ? false : value_dart);
      this.value_js = (value_js == null ? false : value_js);
      this.value_java = (value_java == null ? false : value_java);
    });
  }

  void saveInfo(String value_nickname) async {
    final SharedPreferences prefs = await _perfs;
    prefs.setString("key_nickname", value_nickname);
    prefs.setBool("key_dart", value_dart);
    prefs.setBool("key_js", value_js);
    prefs.setBool("key_java", value_java);
  }
}
