import 'dart:math';

import 'package:flutter/material.dart';

void showMsg(BuildContext context, String msg) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

Color generateRandomColor() {
  final random = Random();
  final r = random.nextInt(256);
  final g = random.nextInt(256);
  final b = random.nextInt(256);

  return Color.fromRGBO(r, g, b, 1.0);
}