import 'package:flutter/material.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
  Color? backgroundColor,
  int durationInSecond = 3,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        duration: Duration(seconds: durationInSecond),
        content: Text(message),
        backgroundColor: (backgroundColor == null)
            ? Colors.green
            : backgroundColor,
      ),
    );
}
