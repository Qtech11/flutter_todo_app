import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_todo_app/view/utilities/color.dart';

TextStyle kTextStyle1(height) => GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: height / 40,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );

TextStyle kTextStyle2(height) => GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: height / 35,
          fontWeight: FontWeight.bold,
          color: kHeaderColor),
    );

TextStyle kTextStyle3(height) => GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: height / 30,
          fontWeight: FontWeight.bold,
          color: Colors.black),
    );

TextStyle kTextStyle4(height) => GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: height / 60,
        color: Colors.white,
      ),
    );

TextStyle kTextStyle5(height) => GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: height / 60,
        color: Colors.black,
      ),
    );

TextStyle kTextStyle6(height) => GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: height / 40,
        fontWeight: FontWeight.bold,
        color: kTextColor,
      ),
    );

TextStyle hintStyle(height) => GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: height / 45,
        color: kTextColor,
      ),
    );

TextStyle kTileStyle(height) => GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: height / 50,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
//
// TextStyle kTileStyle(height) => GoogleFonts.lato(
//   textStyle: TextStyle(
//     fontSize: height / 55,
//     color: Colors.white,
//     fontWeight: FontWeight.bold,
//   ),
// );
