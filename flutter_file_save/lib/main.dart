import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '文件存储/日志读写',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '文件存储/日志读写'),
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
  int log_id = 0;
  String log_info = '';
  File file;

  @override
  void initState() {
    super.initState();
    readLogInfo().then((value) {
      setState(() {
        log_info = value;
      });
    });
  }

  Future<File> getFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    if (file == null) {
      file = File('$dir/log.txt');
    }
    return file;
  }

  Future<String> readLogInfo() async {
    try {
      File file = await getFile();
      String contents = await file.readAsString();
      return contents;
    } on FileSystemException {
      return '';
    }
  }

  Future<Null> writeLogInfo() async {
    setState(() {
      log_id++;
    });
    await (await getFile())
        .writeAsString('日志信息:$log_id\n', mode: FileMode.append);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('$log_info'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: writeLogInfo,
        tooltip: '写入日志',
        child: Icon(Icons.add),
      ),
    );
  }
}
