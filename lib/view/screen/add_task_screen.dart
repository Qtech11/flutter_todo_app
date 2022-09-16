import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo_app/view/utilities/color.dart';
import 'package:flutter_todo_app/view/widgets/custom_button.dart';
import 'package:flutter_todo_app/view/widgets/custom_text_field.dart';
import 'package:flutter_todo_app/view/widgets/snack_bar.dart';

import '../../model/task_model.dart';
import '../../view_model/tasks.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({Key? key}) : super(key: key);
  final categoryController = TextEditingController();
  final titleController = TextEditingController();
  final noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                title: 'Category',
                hintText: 'Enter your task category',
                controller: categoryController,
                height: height,
              ),
              SizedBox(
                height: height / 25,
              ),
              CustomTextField(
                title: 'Title',
                hintText: 'Enter your task title',
                controller: titleController,
                height: height,
              ),
              SizedBox(
                height: height / 25,
              ),
              CustomTextField(
                title: 'Note',
                hintText: 'Enter your task note',
                controller: noteController,
                height: height,
                isNote: true,
              ),
              SizedBox(
                height: height / 25,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CustomButton(
                  title: 'Create Task',
                  onTap: () {
                    validateData(context, height);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addTaskToDB(context) async {
    Tasks task = Provider.of<Tasks>(context, listen: false);
    task.addTask(
      task: TaskModel(
        note: noteController.text.trim(),
        category: categoryController.text.trim(),
        title: titleController.text.trim(),
        date: DateFormat.yMd().format(task.date),
      ),
    );

    // print("My Id is $value");
  }

  void validateData(context, double height) {
    if (titleController.text.trim().isNotEmpty &&
        noteController.text.trim().isNotEmpty &&
        categoryController.text.trim().isNotEmpty) {
      _addTaskToDB(context);
      Navigator.pop(context);
    } else {
      ShowSnackBar.showSnackBar('Fill in all fields', height);
    }
  }
}
