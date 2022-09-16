import 'package:flutter/cupertino.dart';

import '../model/database/database_helper.dart';
import '../model/task_model.dart';

class Tasks extends ChangeNotifier {
  List<TaskModel> taskList = [];
  DateTime date = DateTime.now();

  Future<void> addTask({TaskModel? task}) async {
    await DBHelper.insert(task);
    getTasks();
  }

  // get all the data from table
  Future<void> getTasks() async {
    taskList = [];
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.addAll(tasks.map((data) => TaskModel.fromJson(data)).toList());
    notifyListeners();
  }

  // delete task from table
  Future<void> deleteTask({id}) async {
    await DBHelper.delete(id);
    getTasks();
  }

  //update Status from table
  Future<void> updateCompletedStatus({id}) async {
    await DBHelper.updateCompletedStatus(id);
    getTasks();
  }

  // delete all tasks from table
  // Future<void> deleteAllTasks() async {
  //   await DBHelper.deleteAll();
  //   getTasks();
  // }
}
