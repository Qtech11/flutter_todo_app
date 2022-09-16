import 'package:flutter/material.dart';
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Tasks tasks = Provider.of<Tasks>(context);
    List<TaskModel> taskList = tasks.taskList;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Map<int?, dynamic> map = {};
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
                if (taskList[index].date ==
                    DateFormat.yMd().format(tasks.date)) {
                  map[taskList[index].id] = taskList[index];
                  return GestureDetector(
                    onTap: () {
                      modalBottomSheet(
                        context: context,
                        isCompleted: taskList[index].isCompleted,
                        tasks: tasks,
                        taskModel: taskList[index],
                        height: height,
                      );
                    },
                    child: TaskTile(task: taskList[index]),
                  );
                } else {
                  return Container();
                }
              },
              itemCount: taskList.length,
            ),
          ),
        ],
      ),
    );
  }
}

modalBottomSheet({
  required context,
  required int? isCompleted,
  required Tasks tasks,
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
                tasks.updateCompletedStatus(id: taskModel.id);
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
