import 'package:flutter/material.dart';
import 'package:flutter_todo_app/view/utilities/styles.dart';

import '../utilities/color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.title,
    this.hintText,
    this.keyboardType,
    required this.controller,
    required this.height,
    this.isNote = false,
  }) : super(key: key);

  final String? hintText;
  final TextInputType? keyboardType;
  final String title;
  final TextEditingController controller;
  final double height;
  final bool isNote;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kTextStyle1(height * 1.1),
        ),
        Container(
          height: isNote ? 100 : 52,
          margin: const EdgeInsets.only(top: 8.0),
          padding: const EdgeInsets.only(left: 8.0),
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(
              color: kHeaderColor,
              width: 1.5,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            style: kTextStyle6(height),
            cursorColor: kTextColor,
            maxLines: isNote ? 3 : null,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: hintStyle(height),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            ),
          ),
        ),
      ],
    );
  }
}
