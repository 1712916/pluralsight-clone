
import 'package:app/models/course-detail-response-model.dart';
import 'package:app/services/course-services.dart';
import 'package:flutter/foundation.dart';

import 'courses-response-model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String database_name = "bookmarks";

class BookmarkProvider extends ChangeNotifier{
  String userId;
  List<String> courseIds=[];
  BookmarkSQL bookmarkSQL;

  /// List of course in the bookmark.
  Future<List<Course>> get courses   async {
    List<Course> courses=[];
    for(var i=0;i<courseIds.length;i++){
      Future<Course> course=  (()  async {
        var response= await CourseServices.getCourseInfo(courseId: courseIds[i]);
        return courseDetailResponseModelFromJson(response.body).payload;
      })();
      await course.then((value) => courses.add(value));
    }
    return courses;
  }

  void add(String  id) {
    var condition=courseIds.indexOf(id);
    if(condition>=0){
      courseIds.remove(id);
      bookmarkSQL.delete(Bookmark(courseId: id,userId: this.userId));
    }else{
      courseIds.add(id);
      bookmarkSQL.insert(Bookmark(courseId: id,userId: this.userId));
    }
    notifyListeners();
  }

  bool isInBookmark(String id){
    var condition=courseIds.indexOf(id);
    return condition>=0?true:false;
  }
}

Future<void> main() async {
  var bookmark=BookmarkProvider();
  bookmark.courses.then((value) => print("data: ${value.length}"));
  print(bookmark.courseIds);
}


class Bookmark {
  final int id;
  final String userId;
  final String courseId;

  Bookmark({this.id, this.userId, this.courseId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'courseId': courseId,
    };
  }

  @override
  String toString() {
    return 'Bookmark{id: $id, userId: $userId, courseId: $courseId}';
  }
}

class SQLSERVICE {

  String databaseName;

  Future<Database> database;

  SQLSERVICE({this.databaseName});

  Future<List<dynamic>> getData(String userId) {}

  Future<dynamic> open() {}

  Future<dynamic> insert(var item) {}

  Future<dynamic> update(var item) {}

  Future<dynamic> delete(var item) {}
}


class BookmarkSQL extends SQLSERVICE {
  BookmarkSQL({String databaseName}):super(databaseName: databaseName);

  @override
  Future<dynamic> open() async{
    database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), '${this.databaseName}_database.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE ${this.databaseName}(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, userId TEXT, courseId TEXT)",
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
    final Database db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.rawQuery('SELECT * FROM ${this.databaseName} WHERE userId=?', [userId]);
    // Convert the List<Map<String, dynamic> into a List<Dog>.

    return maps!=null? List.generate(maps.length, (i) {
      return Bookmark(
        id: maps[i]['id'],
        userId: maps[i]['userId'],
        courseId: maps[i]['courseId'],
      );
    }):[];

  }
  @override
  Future<dynamic> insert(item)  async{
    final Database db =  await this.database;
    await db.insert(
      this.databaseName,
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<dynamic> update(item) async {

    final Database db = await this.database;
    // Update the given Dog.
    await db.update(
      this.databaseName,
      item.toMap(),
      // Ensure that the Dog has a matching id.
      where: "courseId = ? AND userId = ?",

      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [item.courseId,item.userId],
    );
  }

  @override
  Future<dynamic> delete(item) async{
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      this.databaseName,
      // Use a `where` clause to delete a specific dog.
      where: "courseId = ? AND userID = ?",

      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [item.courseId,item.userId],
    );
  }


}

