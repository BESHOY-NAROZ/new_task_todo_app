import 'package:flutter/material.dart';
import 'package:new_task_todo_app/home.dart';
import 'package:provider/provider.dart';

import 'file:///C:/Users/besho/AndroidStudioProjects/new_task_todo_app/lib/logic/todo_operations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoOperations>(
        create: (context) {
          return TodoOperations()..createDatabase();
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: TODOHome(),
        ));
  }
}
