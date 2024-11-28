import 'package:flutter/material.dart';

Widget MyText(String text, double size, Color color) {
  return Text(
    overflow: TextOverflow.ellipsis,
    text,
    style: TextStyle(fontSize: size, color: color),
  );
}
