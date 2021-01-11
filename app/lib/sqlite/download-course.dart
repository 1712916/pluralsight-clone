import 'dart:convert';

import 'package:app/models/courses-response-model.dart';
import 'package:app/sqlite/sql-service.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sqlite;
import 'dart:ui';


class CourseDownload{
  String id;
  String userId;
  Course data;

  CourseDownload({this.id, this.userId, this.data});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'data': jsonEncode(data.toJson()),
    };
  }
}




class CourseSQL extends SQLSERVICE{
  static const String  database_name = "download_course";
  CourseSQL({String databaseName}):super(databaseName: databaseName);

  @override
  Future<dynamic> open() async{
    database = sqlite.openDatabase(

      path.join(await sqlite.getDatabasesPath(), '${this.databaseName}_database.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE ${this.databaseName}(id TEXT PRIMARY KEY  NOT NULL, userId TEXT, data TEXT)",
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  @override
  Future<List> getData( userId) async{
    // Get a reference to the database.
    final sqlite.Database db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.rawQuery('SELECT * FROM ${this.databaseName} WHERE userId=?', [userId]);
    // Convert the List<Map<String, dynamic> into a List<Dog>.

    return maps!=null? List.generate(maps.length, (i) {
      return  Course.fromJson(jsonDecode(maps[i]['data']));
    }):[];

  }
  @override
  Future<dynamic> insert(item)  async{
    final sqlite.Database db =  await this.database;
    await db.insert(
      this.databaseName,
      item.toMap(),
      conflictAlgorithm: sqlite.ConflictAlgorithm.replace,
    );
  }

  @override
  Future<dynamic> update(item) async {

    final sqlite.Database db = await this.database;

    await db.update(
      this.databaseName,
      item.toMap(),

      where: "id = ? AND userId = ?",

      whereArgs: [item.id,item.userId],
    );
  }
  @override
  Future<dynamic> delete(item) async{
    // Get a reference to the database.
    final db = await database;


    await db.delete(
      this.databaseName,

      where: "id = ? AND userID = ?",


      whereArgs: [item.id,item.userId],
    );
  }
}



