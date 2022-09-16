import 'package:flutter/material.dart';

import '../utilities/color.dart';
import '../utilities/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.title, required this.onTap})
      : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: kBlueColor,
        ),
        child: Text(
          title,
          style: kTextStyle4(height),
        ),
      ),
    );
  }
}

class CustomButton1 extends StatelessWidget {
  const CustomButton1(
      {Key? key, required this.title, required this.onTap, required this.color})
      : super(key: key);

  final String title;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          left: width * 0.02,
          bottom: width * 0.02,
          right: width * 0.02,
        ),
        padding: EdgeInsets.symmetric(vertical: height / 40),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color: color,
        ),
        child: Center(
          child: Text(
            title,
            style: kTextStyle4(height),
          ),
        ),
      ),
    );
  }
}
