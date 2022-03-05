import 'package:flutter/material.dart';
import 'package:new_task_todo_app/constants/size_config.dart';

import '../main_add_task.dart';
import 'tasklist_screen.dart';

class TODOScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => AddTask());
        },
        backgroundColor: Color(0xFF3D82AE),
        child: Icon(Icons.add),
      ),
      backgroundColor: Color(0xFF3D82AE),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.defaultHeightSize / 15,
              left: SizeConfig.defaultWidthSize / 20,
            ),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: SizeConfig.defaultSize * 5,
                    ),
                    backgroundColor: Colors.white,
                    radius: SizeConfig.defaultSize * 3,
                  ),
                  SizedBox(
                    height: SizeConfig.defaultHeightSize / 35,
                  ),
                  Text(
                    'TODO',
                    style: TextStyle(
                        fontSize: SizeConfig.defaultSize * 4,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Center(
                    child: Text(
                      'tasks',
                      style: TextStyle(
                          fontSize: SizeConfig.defaultSize * 2,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(SizeConfig.defaultSize * 2),
              width: double.infinity,
              child: TasksList(),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.lightBlueAccent.withOpacity(.5),
                    Colors.white.withOpacity(.5),
                    Colors.lightBlueAccent.withOpacity(.5)
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
