import 'package:flutter/material.dart';
import 'package:new_task_todo_app/constants/size_config.dart';
import 'package:provider/provider.dart';

import 'file:///C:/Users/besho/AndroidStudioProjects/new_task_todo_app/lib/logic/todo_operations.dart';

import '../main_add_task.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      reverse: false,
      separatorBuilder: (context, index) {
        return Container(
          color: Colors.white,
          width: SizeConfig.defaultWidthSize / 2,
          height: SizeConfig.defaultHeightSize / 500,
        );
      },
      itemBuilder: (context, index) {
        return ListTile(
          title: Provider.of<TodoOperations>(context).newTasks.isNotEmpty
              ? Text(
                  '${Provider.of<TodoOperations>(context).newTasks[index]['title']}',
                  style: TextStyle(
                      fontSize: SizeConfig.defaultSize * 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              : Text('There is no tasks yet'),
          trailing: Container(
            width: SizeConfig.defaultWidthSize / 5,
            child: Row(
              children: <Widget>[
                InkWell(
                  child: Icon(Icons.edit, color: Colors.white),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => AddTask(
                              id: Provider.of<TodoOperations>(context)
                                  .newTasks[index]['id'],
                              taskCase: 'update',
                            ));
                  },
                ),
                SizedBox(
                  width: SizeConfig.defaultWidthSize / 20,
                ),
                InkWell(
                  child: Icon(Icons.restore_from_trash, color: Colors.white),
                  onTap: () {
                    Provider.of<TodoOperations>(context).deleteTask(
                      id: Provider.of<TodoOperations>(context).newTasks[index]
                          ['id'],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
      itemCount: Provider.of<TodoOperations>(context).newTasks.length,
    );
  }
}
