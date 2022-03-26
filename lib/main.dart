import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todolist/models/tasks_model/task.dart';
import 'package:todolist/screens/catogory/privatework.dart';
import 'package:todolist/screens/catogory/shopping.dart';
import 'package:todolist/screens/catogory/study.dart';
import 'package:todolist/screens/catogory/work.dart';
import 'package:todolist/screens/home.dart';
import 'package:todolist/screens/setting.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'components/boxes.dart';
import 'package:todolist/components/boxes.dart';
import 'components/constents/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TasksAdapter());

  await Hive.openBox<Tasks>(SHOPPING);
  await Hive.openBox<Tasks>(STUDY);
  await Hive.openBox<Tasks>(PRIVATE_WORK);
  await Hive.openBox<Tasks>(WORK);
  await Hive.openBox(NUMBER_OF_TASKS);

  runApp(
      MyApp()
   // DevicePreview(
    //  enabled: !kReleaseMode,
     // builder: (BuildContext context) => MyApp(),
  //  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(unselectedWidgetColor: Colors.pinkAccent),
      routes: {
        Screens().HOME_SCREEN: (context) => const Home(),
        Screens().SETTINGS: (context) => Setting(),
        Screens().SHOPPING: (context) => const Shopping(),
        Screens().STUDY: (context) => const Study(),
        Screens().PRIVATE_WORK: (context) => const PrivateWork(),
        Screens().WORK: (context) => const Work()
      },
    );
  }
}
