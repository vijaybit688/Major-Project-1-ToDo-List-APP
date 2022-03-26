import 'package:todolist/components/boxes.dart';
import 'package:todolist/components/constents/colors.dart';
import 'package:flutter/material.dart';
import 'package:todolist/components/all_task_update_functions.dart';
import 'package:todolist/components/widget/app_bar.dart';
import 'package:todolist/components/widget/task_tile.dart';
import 'package:todolist/models/tasks_model/task.dart';
import 'package:hive_flutter/hive_flutter.dart';

bool checkBool = false;
final controller = TextEditingController();

class PrivateWork extends StatefulWidget {
  const PrivateWork({Key? key}) : super(key: key);

  @override
  State<PrivateWork> createState() => _PrivateWorkState();
}

class _PrivateWorkState extends State<PrivateWork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: DEEP_PINK,
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: DEEP_PURPLE,
              context: context,
              builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 50,
                      ),
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                            hintText: "Enter Task Here",
                            hintStyle:
                                TextStyle(fontSize: 19, color: WHITE_COLOR),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.pinkAccent)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2.5, color: DEEP_PINK))),
                        cursorColor: WHITE_COLOR,
                        style: TextStyle(color: WHITE_COLOR),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: TextButton(
                          onPressed: () {
                            addTask(controller.text, checkBoxValue,
                                Boxes.getPrivateTasks());
                            controller.clear();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: DEEP_PINK,
                            ),
                            width: 100,
                            height: 60,
                            child: const Center(
                              child: Text(
                                "Add Task",
                                style:
                                    TextStyle(fontSize: 19, color: WHITE_COLOR),
                              ),
                            ),
                          )),
                    )
                  ],
                );
              });
        },
      ),
      appBar: AppBarWidget().AppBarForScreens("Private Work To DO List"),
      body: ValueListenableBuilder<Box<Tasks>>(
        valueListenable: Boxes.getPrivateTasks().listenable(),
        builder: (context, box, widget) {
          List<Tasks> tasks = box.values.toList().cast<Tasks>();
          List<int> taskKeys = box.keys.toList().cast();

          if (box.length == 0) {
            return Container(
              color: DEEP_PURPLE,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const Center(
                  child: Text(
                    'If You Want To Delete Added Task Swipe \n Left Or Right',
                style: TextStyle(color: WHITE_COLOR, fontSize: 20),
              )),
            );
          } else {
            return Container(
              decoration: const BoxDecoration(color: DEEP_PURPLE),
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: box.keys.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      background: Container(
                        decoration: BoxDecoration(
                          color: LIGHT_PURPLE,
                        ),
                      ),
                      onDismissed: (direction) =>
                          deleteTask(box, taskKeys[index]),
                      key: UniqueKey(),
                      child: TaskTile(
                          title: tasks[index].taskData,
                          value: tasks[index].checkBox,
                          task: tasks[index],
                          index: index),
                    );
                  }),
            );
          }
        },
      ),
    );
  }
}
