import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:provider/provider.dart';

import '../../view_model/tasks.dart';
import '../utilities/styles.dart';

class HorizontalDatePicker extends StatelessWidget {
  HorizontalDatePicker({
    Key? key,
  }) : super(key: key);

  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: width * 0.02,
      ),
      child: DatePicker(
        DateTime.now(),
        height: height / 8,
        width: height / 12,
        initialSelectedDate: _selectedDate,
        selectionColor: Colors.blue,
        selectedTextColor: Colors.white,
        deactivatedColor: Colors.black54,
        dateTextStyle: kTextStyle5(height),
        dayTextStyle: kTextStyle5(height),
        monthTextStyle: kTextStyle5(height),
        onDateChange: (date) {
          _selectedDate = date;
          Provider.of<Tasks>(context, listen: false).date = date;
          Provider.of<Tasks>(context, listen: false).getTasks();
        },
      ),
    );
  }
}
