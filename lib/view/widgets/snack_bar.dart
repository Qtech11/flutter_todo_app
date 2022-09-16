import 'package:flutter/material.dart';
import '../utilities/styles.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();

class ShowSnackBar {
  static showSnackBar(String message, double height) {
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Row(
            children: [
              const Icon(
                Icons.error,
                color: Colors.white,
              ),
              Text(
                message,
                style: kTextStyle4(height),
              ),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 4),
        ),
      );
  }
}
