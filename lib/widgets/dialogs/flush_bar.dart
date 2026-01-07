import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showCustomFlushBar(
  BuildContext context,
  String title,
  String? message,
  bool success,
) {
  Flushbar(
    margin: EdgeInsets.all(16),
    borderRadius: BorderRadius.circular(16),
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
    backgroundColor: success ? Colors.green : Colors.red,
    flushbarPosition: FlushbarPosition.TOP,

    title: title,
    message: message,
    duration: Duration(seconds: 3),
  ).show(context);
}
