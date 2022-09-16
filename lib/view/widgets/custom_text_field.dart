import 'package:flutter/material.dart';
import 'package:flutter_todo_app/view/utilities/styles.dart';

import '../utilities/color.dart';

// class MyInputField extends StatelessWidget {
//   final String title;
//   final String hint;
//   final String? updateValue;
//   final TextEditingController? controller;
//   final Widget? widget;
//   final bool isNote;
//
//   const MyInputField({
//     Key? key,
//     required this.title,
//     required this.hint,
//     this.updateValue,
//     this.controller,
//     this.widget,
//     this.isNote = false,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     if (updateValue != null) {
//       controller!.text = updateValue!;
//     }
//     return Container(
//       margin: const EdgeInsets.only(top: 16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: kTextStyle1(height),
//           ),
//           Container(
//             height: isNote ? 100 : 52,
//             margin: const EdgeInsets.only(top: 8.0),
//             padding: const EdgeInsets.only(left: 8.0),
//             width: double.maxFinite,
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: kHeaderColor,
//                 width: 1.5,
//               ),
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(8.0),
//               ),
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     readOnly: widget != null,
//                     controller: controller,
//                     autofocus: false,
//                     maxLines: isNote ? 3 : null,
//                     style: subTitleStyle,
//                     cursorColor:
//                         Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintStyle: subTitleStyle,
//                       hintText: hint,
//                       alignLabelWithHint: true,
//                       focusedBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Theme.of(context).backgroundColor,
//                           width: 0,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 if (widget != null)
//                   Container(
//                     child: widget,
//                   ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.title,
    this.hintText,
    this.keyboardType,
    required this.controller,
    // this.iconButton,
    required this.height,
    this.isNote = false,
  }) : super(key: key);

  final String? hintText;
  final TextInputType? keyboardType;
  final String title;
  final TextEditingController controller;
  final double height;
  bool isNote;

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
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              // focusedBorder: UnderlineInputBorder(
              //   borderSide: BorderSide(
              //     color: Theme.of(context).backgroundColor,
              //     width: 0,
              //   ),
              // ),
            ),
          ),
        ),
      ],
    );
  }
}
