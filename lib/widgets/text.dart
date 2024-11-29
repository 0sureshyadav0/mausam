import 'package:flutter/material.dart';

Widget myText(String text, double size, Color color) {
  return Text(
    overflow: TextOverflow.ellipsis,
    text,
    style: TextStyle(fontSize: size, color: color),
  );
}
