import 'package:hive/hive.dart';
import 'package:todolist/models/tasks_model/task.dart';

import 'boxes.dart';

upDateTheNumberOfTasksWhenAdded() {
  Box ntBoxInstance = Boxes.getTotalNumberOfTasks();
  int oldNumberOfTasks = ntBoxInstance.get('noOfTasks') ?? 0;
  ntBoxInstance.put('noOfTasks', ++oldNumberOfTasks);
  getNumberOfTaskDone();
}

upDateTheNumberOfTasksWhenSubtract() {
  Box ntBoxInstance = Boxes.getTotalNumberOfTasks();
  int oldNumberOfTasks = ntBoxInstance.get('noOfTasks') ?? 0;
  //oldNumberOfTasks = oldNumberOfTasks - 1;
  ntBoxInstance.put('noOfTasks', --oldNumberOfTasks);
  getNumberOfTaskDone();
}

addTask(String taskData, bool checkBoxValue, Box<Tasks> box) {
  String text = taskData.trim();
  if (text.isNotEmpty) {
    final task = Tasks(taskData: taskData, checkBox: false);
    box.add(task);
    upDateTheNumberOfTasksWhenAdded();
    getNumberOfTaskDone();
  } else {
    print("Please add some task");
  }
}

void upDateValueOfCheckBox(Tasks task, String title, bool isDone) {
  task.checkBox = isDone;
  task.save();
  getNumberOfTaskDone();
}

void deleteTask(Box box, int key) {
  box.delete(key);
  upDateTheNumberOfTasksWhenSubtract();
  getNumberOfTaskDone();
}

void getNumberOfTaskDone() {
  List<bool> listOfNotDoneTask = [];
  Box shoppingBox = Boxes.getShoppingTasks();
  List<Tasks> task = shoppingBox.values.toList().cast();
  int taskLength = shoppingBox.keys.length;
  for (int x = 0; x < taskLength; x++) {
    listOfNotDoneTask.add(task[x].checkBox);
  }

  Box privateWorkBox = Boxes.getPrivateTasks();
  List<Tasks> task1 = privateWorkBox.values.toList().cast();
  int taskLength1 = privateWorkBox.keys.length;
  for (int x = 0; x < taskLength1; x++) {
    listOfNotDoneTask.add(task1[x].checkBox);
  }
  Box workBox = Boxes.getWorkTasks();
  List<Tasks> task2 = workBox.values.toList().cast();
  int taskLength2 = workBox.keys.length;
  for (int x = 0; x < taskLength2; x++) {
    listOfNotDoneTask.add(task2[x].checkBox);
  }

  Box studyBox = Boxes.getStudyTasks();
  List<Tasks> task3 = studyBox.values.toList().cast();
  int taskLength3 = studyBox.keys.length;
  for (int x = 0; x < taskLength3; x++) {
    listOfNotDoneTask.add(task3[x].checkBox);
  }

  var value = listOfNotDoneTask.where((item) => item == true).length;
  Box ntBoxInstance = Boxes.getTotalNumberOfTasks();
  ntBoxInstance.put('taskDone', value);
}
