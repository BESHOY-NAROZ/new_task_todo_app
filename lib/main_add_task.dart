import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'file:///C:/Users/besho/AndroidStudioProjects/new_task_todo_app/lib/logic/todo_operations.dart';

import 'constants/size_config.dart';

TextEditingController titleController = TextEditingController();

class AddTask extends StatelessWidget {
  int id;
  String title;
  String taskCase;

  AddTask({
    this.id,
    this.title,
    this.taskCase,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(SizeConfig.defaultSize * 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              taskCase == 'update' ? 'Update Task' : 'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3D82AE),
              ),
            ),
            TextField(
              controller: titleController,
              textDirection: TextDirection.ltr,
              onChanged: (written) {
                titleController.text = written;
              },
            ),
            Spacer(),
            Container(
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  taskCase == 'update' ? 'Update' : 'Add',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                color: Color(0xFF3D82AE),
                onPressed: () {
                  taskCase == 'update'
                      ? Provider.of<TodoOperations>(context).updateTask(
                          id: id,
                          newTask: titleController.text,
                          context: context)
                      : Provider.of<TodoOperations>(context)
                          .insertDatabase(titleController.text, context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
