import 'package:flutter/material.dart';

class Helpers {
  static showSnack(BuildContext ctx, String text) {
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(text)));
  }
}
