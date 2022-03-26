import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:todolist/components/boxes.dart';
import 'package:todolist/components/constents/colors.dart';
import 'package:todolist/components/constents/data.dart';
import 'package:todolist/components/constents/routes.dart';
import 'package:todolist/components/constents/styles.dart';
import 'package:todolist/components/constents/variables.dart';
import 'package:todolist/components/all_task_update_functions.dart';
import 'package:todolist/components/widget/app_bar.dart';
import 'package:todolist/screens/setting.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DEEP_PURPLE,
        bottomNavigationBar: GNav(
          padding: EdgeInsets.all(15),
          backgroundColor: DEEP_PINK,
          tabMargin: EdgeInsets.all(8),
          tabBackgroundColor: LIGHT_PINK,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          gap: 8,
          selectedIndex: selectedIndexValue,
          onTabChange: onTabChanged,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
              textStyle: TextStyle(fontSize: 28),
              iconSize: 28,
            ),
            GButton(
              icon: Icons.settings,
              text: 'Setting',
              textStyle: TextStyle(fontSize: 28),
              iconSize: 28,
            ),
          ],
        ),
        appBar: AppBarWidget().AppBarForScreens("ToDo List"),
        body: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          children: [HomePage1(), Setting()],
        ));
  }

  onTabChanged(int _tabIndex) {
    pageController.animateToPage(_tabIndex,
        duration: Duration(microseconds: 400), curve: Curves.ease);
  }

  onPageChanged(int _pageIndex) {
    setState(() {
      selectedIndexValue = _pageIndex;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Hive.close();
  }
}

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: AnimationLimiter(
        child: Container(
          decoration: BoxDecoration(color: DEEP_PURPLE),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                child: GridView.builder(
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        columnCount: 2,
                        duration: Duration(milliseconds: 1000),
                        child: SlideAnimation(
                          verticalOffset: 50,
                          child: ScaleAnimation(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: GestureDetector(
                                onTap: () {
                                  if (index == 0) {
                                    Navigator.pushNamed(
                                        context, Screens().SHOPPING);
                                  }
                                  if (index == 1) {
                                    Navigator.pushNamed(
                                        context, Screens().STUDY);
                                  }
                                  if (index == 2) {
                                    Navigator.pushNamed(
                                        context, Screens().PRIVATE_WORK);
                                  }
                                  if (index == 3) {
                                    Navigator.pushNamed(
                                        context, Screens().WORK);
                                  }
                                },
                                child: Container(
                                  child:Center(
                                    child: Text(todoCategory[index],style: textStyle,),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: LIGHT_PURPLE),
                                  height: 200,
                                  width: 200,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ValueListenableBuilder<Box>(
                  valueListenable: Boxes.getTotalNumberOfTasks().listenable(),
                  builder: (context, box, widget) {
                    int taskDone = box.get('taskDone') ?? 0;
                    int numberOfTask;

                    if (box.get('noOfTasks') == null) {
                      numberOfTask = 0;
                    } else if (box.get('noOfTasks') < 0) {
                      numberOfTask = 0;
                    } else {
                      numberOfTask = box.get('noOfTasks');
                    }
                    print(numberOfTask);
                    if (numberOfTask == 0) {
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Total task:             ',
                                    style: textStyle,
                                  ),
                                  Text('0',style: textStyleGreen,)
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Task done:            ',
                                    style: textStyle,
                                  ),
                                  Text('0',style: textStyleGreen,)
                                ],
                              ),
                              Row(
                                children: [
                                  Flexible(
                                      child: Text(
                                    'Task Remaining:  ',
                                    style: textStyle,
                                  )),
                                  Text('0',style: textStyleGreen,)
                                ],
                              )
                            ],
                          ),
                        ),
                        height: MediaQuery.of(context).size.width / 1.5,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: LIGHT_PURPLE),
                      );
                    } else {
                      return Container(
                          height: MediaQuery.of(context).size.width / 1.5,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: LIGHT_PURPLE),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 60.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Total task:             ',
                                      style: textStyle,
                                    ),
                                    Text('$numberOfTask',style: textStyleGreen,)
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Task done:            ',
                                      style: textStyle,
                                    ),
                                    Text('$taskDone',style: textStyleGreen,)
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Task Remaining:  ',
                                      style: textStyle,
                                    ),
                                    Text('${numberOfTask - taskDone}',style: numberOfTask - taskDone==0?textStyleGreen:textStyleRed,)
                                  ],
                                )
                              ],
                            ),
                          ));
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
