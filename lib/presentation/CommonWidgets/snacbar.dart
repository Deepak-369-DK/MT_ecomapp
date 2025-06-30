import 'package:flutter/material.dart';

class ShowSnackBar {
  snackBar(
    context, {
    required String message,
  }) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
