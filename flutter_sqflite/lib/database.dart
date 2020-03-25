import 'dart:io';

import 'package:flutter_sqflite/client.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirection = await getApplicationDocumentsDirectory();
    String path = join(documentsDirection.path, 'client.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      db.execute("CREATE TABLE Client ("
          "id INTERGER PRIMARY KEY,"
          "name TEXT,"
          "age INTEGER,"
          "sex BIT"
          ")");
    });
  }

  /**
   * 插入新数据
   */
  insertClient(Client newClient) async {
    final db = await database;
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Client");
    int id = 1;
    if (table.first['id'] != null) {
      id = table.first['id'];
    }
    var raw = await db.rawInsert(
        "INSERT Into Client (id,name,age,sex)"
        " VALUES (?,?,?,?)",
        [id, newClient.name, newClient.age, newClient.sex]);
    return raw;
  }

  updateSex(Client client) async {
    final db = await database;
    Client newCLient = Client(
        id: client.id, name: client.name, age: client.age, sex: !client.sex);
    var res = await db.update('Client', newCLient.toMap(),
        where: "id = ?", whereArgs: [client.id]);
    return res;
  }

  updateClient(Client newClient) async {
    final db = await database;
    var res = await db.update('Client', newClient.toMap(),
        where: "id = ?", whereArgs: [newClient.id]);
    return res;
  }

  Future<List<Client>> getAllClient() async {
    final db = await database;
    var res = await db.query("Client");
    List<Client> list =
        res.isNotEmpty ? res.map((e) => Client.fromMap(e)).toList() : [];
    return list;
  }

  deleteClient(int id) async {
    final db = await database;
    return db.delete("Client", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    return db.rawDelete("Delete * From Client");
  }
}
