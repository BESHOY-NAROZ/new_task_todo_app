import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class TodoOperations extends ChangeNotifier {
  List<Map<String, dynamic>> allTasks = [];
  List newTasks = [];

  Database database;
  createDatabase() async {
    database = await openDatabase(
      'TodoTask1.db',
      version: 1,
      onCreate: (db, version) async {
        print('database on create');
        await db.execute(
            'CREATE TABLE TodoTask1(id INTEGER PRIMARY KEY, title TEXT, status TEXT)');
      },
      onOpen: (db) {
        print('database on open');
      },
    );
    await getDatabase();
    notifyListeners();
  }

  getDatabase() async {
    allTasks = await database.rawQuery('SELECT * FROM TodoTask1');
    newTasks = [];
    allTasks.forEach((element) {
      if ((element)['status'] == 'New') {
        newTasks.add(element);
        print('titleeeeeeeeeee');
      }
    });
    notifyListeners();
  }

  insertDatabase(String title, BuildContext context) async {
    await createDatabase();
    await database.transaction((txn) => txn.rawInsert(
        'INSERT INTO TodoTask1(title, status) VALUES("$title", "New")'));
    print('database inserted ${database.toString()}');
    await getDatabase();
    notifyListeners();
    Navigator.pop(context);
  }

  updateTask({int id, String newTask, BuildContext context}) async {
    await database.rawUpdate(
        'UPDATE TodoTask1 SET title = ? WHERE id = ?', ['$newTask', id]);
    print('update is called');
    await getDatabase();
    notifyListeners();
    Navigator.pop(context);
  }

  deleteTask({int id}) async {
    await database.rawDelete('DELETE FROM TodoTask1 WHERE id = ?', [id]);
    await getDatabase();
    notifyListeners();
  }
}
