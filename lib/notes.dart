// void main() async {
//   runApp(MultiProvider(
//     providers: [ChangeNotifierProvider(create: (_) => ToDoList())],
//     child: MyApp(),
//   ));
// }










// import 'package:flutter/cupertino.dart';
// class ToDoList extends ChangeNotifier {
//
//   List lisOfTasks = [];
//
//
//   void addTask(String task) {
//     lisOfTasks.add(task);
//     notifyListeners();
//   }
//   void removeTask(int taskIndex) {
//     lisOfTasks.removeAt(taskIndex);
//     notifyListeners();
//   }
// }

// onPressed: () {
// Provider.of<ToDoList>(context, listen: false)
//     .addTask(controller.text);
// },


// Dismissible(
// background: Container(color: LIGHT_PURPLE,),
// onDismissed: (directiion) {
// Provider.of<ToDoList>(context, listen: false)
//     .removeTask(index);
// },
// key: UniqueKey(),
// child: TaskTile(
// title: context.watch<ToDoList>().lisOfTasks[index],
// value: false),
// );

//context.watch<ToDoList>().lisOfTasks.length