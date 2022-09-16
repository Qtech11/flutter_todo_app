import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_todo_app/view/utilities/color.dart';
import 'package:flutter_todo_app/view/utilities/styles.dart';

import '../../model/task_model.dart';

class TaskTile extends StatelessWidget {
  final TaskModel? task;
  const TaskTile({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
        bottom: width * 0.02,
        left: width * 0.02,
        right: width * 0.02,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: width * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kBlueColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  task?.title ?? "",
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  task?.note ?? "",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[100],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: height / 12,
            width: 0.5,
            color: Colors.grey[200]!.withOpacity(0.7),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              task!.isCompleted == 1 ? "COMPLETED" : "TODO",
              style: kTextStyle4(height),
            ),
          ),
        ],
      ),
    );
  }
}
