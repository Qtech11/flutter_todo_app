import 'package:sqflite/sqflite.dart';

import '../task_model.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = "task";
  static Future<void> initDB() async {
    if (_db != null) {
      return;
    }
    try {
      String path = '${await getDatabasesPath()}tasks.db';
      _db = await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE $_tableName("
            "id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "title TEXT, note TEXT, date TEXT, category TEXT, "
            "isCompleted INTEGER)",
          );
        },
      );
    } catch (e) {
      // print(e);
    }
  }

  static Future<int> insert(TaskModel? task) async {
    return await _db?.insert(_tableName, task!.toJson()) ?? 1;
  }

  // get all tasks from database
  static Future<List<Map<String, dynamic>>> query() async {
    List<Map<String, dynamic>> tasks = await _db!.query(_tableName);
    return tasks;
  }

  // delete task from database
  static Future<void> delete(int id) async {
    await _db!.delete(_tableName, where: "id = ?", whereArgs: [id]);
  }

  //update task from database
  static Future<void> updateCompletedStatus(int id) async {
    await _db!.rawUpdate('''
      UPDATE $_tableName SET isCompleted = ? WHERE id = ?
    ''', [1, id]);
  }
}
