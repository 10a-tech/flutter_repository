import 'package:flutter/material.dart';
import 'package:flutter_sqflite/client.dart';
import 'package:flutter_sqflite/database.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sqlite操作',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Sqlite操作'),
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
  List<Client> clients = [
    Client(name: "张三", age: 12, sex: false),
    Client(name: "李四", age: 32, sex: false),
    Client(name: "王五", age: 22, sex: true),
    Client(name: "赵柳", age: 42, sex: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Client>>(
          future: DBProvider.db.getAllClient(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Client item = snapshot.data[index];
                    return Dismissible(
                      key: UniqueKey(),
                      background: Container(color: Colors.red,),
                      onDismissed: (direction){
                        DBProvider.db.deleteClient(item.id);
                      },
                      child: ListTile(
                        title: Text(item.name.toString()),
                        leading: Text(item.id.toString()),
                        trailing: Checkbox(
                          onChanged: (bool value){
                            DBProvider.db.updateSex(item);
                                setState(() {
                                });
                          },
                          value: item.sex,
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Client rnd = clients[Random().nextInt(clients.length)];
          await DBProvider.db.insertClient(rnd);
          setState(() {
          });
        },
        tooltip: '插入数据',
        child: Icon(Icons.add),
      ),
    );
  }
}
