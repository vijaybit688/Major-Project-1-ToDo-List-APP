import 'package:hive/hive.dart';
part 'task.g.dart';

@HiveType(typeId: 0)
class Tasks extends HiveObject{
  @HiveField(0)
   late String taskData;
  @HiveField(1)
   late bool checkBox;
  Tasks({required this.taskData,required this.checkBox});
}


