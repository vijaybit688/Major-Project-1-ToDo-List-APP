import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todolist/components/constents/colors.dart';
import 'package:todolist/models/tasks_model/task.dart';

import '../boxes.dart';
import '../all_task_update_functions.dart';

bool checkBoxValue = false;

class TaskTile extends StatefulWidget {
  final String? title;
  final bool? value;
  final Tasks? task;
  final int ?index;

  TaskTile({
    Key? key,
     this.title,
     this.value,
    this.task, this.index,
  }) : super(key: key) {
    checkBoxValue = value!;
  }


  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Text(
          widget.title!,
          style: TextStyle(
              fontSize: 23,
              color: Colors.white,
              decoration: checkBoxValue ? TextDecoration.lineThrough : null),
        ),
        trailing: Transform.scale(
          scale: 1.2,
          child: Checkbox(
              activeColor: DEEP_PINK,
              value: checkBoxValue,
              onChanged: (value) {
                setState(() {
                  checkBoxValue = value!;
                  upDateValueOfCheckBox(widget.task!, widget.title!, checkBoxValue);
                });
              }),
        ),
      ),
    );
  }



}
