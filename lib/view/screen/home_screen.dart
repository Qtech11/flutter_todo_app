import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_todo_app/view/screen/add_task_by_category_screen.dart';
import 'package:flutter_todo_app/view/widgets/snack_bar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo_app/model/task_model.dart';
import 'package:flutter_todo_app/view/screen/add_task_screen.dart';
import 'package:flutter_todo_app/view/utilities/styles.dart';
import 'package:intl/intl.dart';
import 'package:flutter_todo_app/view/widgets/custom_button.dart';
import 'package:flutter_todo_app/view/widgets/horizontal_date_picker.dart';
import 'package:flutter_todo_app/view/widgets/task_tile.dart';

import '../../view_model/tasks.dart';
import '../utilities/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<Tasks>(context, listen: false).getTasks();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Tasks tasks = Provider.of<Tasks>(context);
    List<TaskModel> taskList = tasks.taskList;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<TaskModel> pageList = [];
    Map<String, List<TaskModel>> pageMap = {};
    void pageAlgorithm() {
      for (int index = 0; index < taskList.length; index++) {
        if (taskList[index].date == DateFormat.yMd().format(tasks.date)) {
          pageList.add(taskList[index]);

          String key = taskList[index].category;
          if (pageMap.containsKey(key)) {
            List<TaskModel>? c = pageMap[key];
            c!.add(taskList[index]);
            pageMap[key] = c;
          } else {
            pageMap[key] = [taskList[index]];
          }
        }
      }
    }

    pageAlgorithm();

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text(
          'TODO',
          style: kTextStyle1(height),
        ),
        elevation: 0.5,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                left: width * 0.02, right: width * 0.02, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat.yMMMMd().format(
                        DateTime.now(),
                      ),
                      style: kTextStyle2(height),
                    ),
                    Text(
                      "Today",
                      style: kTextStyle3(height),
                    ),
                  ],
                ),
                CustomButton(
                  title: '+  Add Task',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddTaskScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          HorizontalDatePicker(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ExpandablePanel(
                  collapsed: ExpandableButton(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.02,
                        vertical: width * 0.02,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'category: ${pageMap.keys.elementAt(index)}',
                            style: kTextStyle1(height),
                          ),
                          Icon(
                            Icons.expand_more,
                            size: height / 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExpandableButton(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.02,
                            vertical: width * 0.02,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'category: ${pageMap.keys.elementAt(index)}',
                                style: kTextStyle1(height),
                              ),
                              Icon(
                                Icons.expand_less,
                                size: height / 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                      for (int i = 0;
                          i < pageMap[pageMap.keys.elementAt(index)]!.length;
                          i++)
                        GestureDetector(
                          onTap: () {
                            modalBottomSheet(
                              context: context,
                              category:
                                  pageMap[pageMap.keys.elementAt(index)]![i]
                                      .category,
                              tasks: tasks,
                              taskModel:
                                  pageMap[pageMap.keys.elementAt(index)]![i],
                              height: height,
                              pageMap: pageMap,
                            );
                          },
                          child: TaskTile(
                              task: pageMap[pageMap.keys.elementAt(index)]![i]),
                        ),
                      Center(
                        child: CustomButton(
                          title: '+  Add task to this category',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddTaskScreenByCategory(
                                    category: pageMap.keys.elementAt(index)),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: height / 30,
                      )
                    ],
                  ),
                );
              },
              itemCount: pageMap.length,
            ),
          ),
        ],
      ),
    );
  }
}

modalBottomSheet({
  required context,
  required String category,
  required Tasks tasks,
  required Map<String, List<TaskModel>> pageMap,
  required TaskModel taskModel,
  required double height,
}) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: height / 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CustomButton1(
              title: 'Mark Task as Completed',
              onTap: () {
                int a = pageMap[category]!.indexOf(taskModel);
                if (taskModel.date != DateFormat.yMd().format(DateTime.now())) {
                  ShowSnackBar.showSnackBar(
                    'Not ${taskModel.date} yet',
                    height,
                  );
                } else {
                  if (a == 0) {
                    tasks.updateCompletedStatus(id: taskModel.id);
                  } else {
                    bool bar = true;
                    for (int i = 0; i < a; i++) {
                      if (pageMap[category]![i].isCompleted == 0) {
                        bar = false;
                        ShowSnackBar.showSnackBar(
                          'You have to complete previous task(s) in this category',
                          height,
                        );
                        break;
                      }
                    }
                    if (bar == true) {
                      tasks.updateCompletedStatus(id: taskModel.id);
                    }
                  }
                }

                Navigator.pop(context);
              },
              color: kBlueColor,
            ),
            CustomButton1(
              title: 'Delete Task',
              onTap: () {
                tasks.deleteTask(id: taskModel.id);
                Navigator.pop(context);
              },
              color: Colors.redAccent,
            ),
          ],
        ),
      );
    },
  );
}
