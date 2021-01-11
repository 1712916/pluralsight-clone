import 'package:sqflite/sqflite.dart'  as sqlite;
class SQLSERVICE {

  String databaseName;

  Future<sqlite.Database> database;

  SQLSERVICE({this.databaseName});

  Future<List<dynamic>> getData(String userId) {}

  Future<dynamic> open() {}

  Future<dynamic> insert(var item) {}

  Future<dynamic> update(var item) {}

  Future<dynamic> delete(var item) {}
}