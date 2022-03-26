import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/models/tasks_model/task.dart';

String SHOPPING="shopping";
String STUDY="study";
String PRIVATE_WORK="privateWork";
String WORK="work";
String NUMBER_OF_TASKS="no_of_tasks";

class Boxes {
  static Box<Tasks> getShoppingTasks() => Hive.box<Tasks>(SHOPPING);
  static Box<Tasks> getStudyTasks() => Hive.box<Tasks>(STUDY);
  static Box<Tasks> getPrivateTasks() => Hive.box<Tasks>(PRIVATE_WORK);
  static Box<Tasks> getWorkTasks() => Hive.box<Tasks>(WORK);
  static Box getTotalNumberOfTasks() => Hive.box(NUMBER_OF_TASKS);


}
