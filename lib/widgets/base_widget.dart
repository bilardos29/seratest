import 'dart:ui';

import 'package:flutter/material.dart';

class BaseWidget{

  static TextStyle mainTextStyle({double size = 12, Color colors = Colors.black}) {
    return TextStyle(
        color: colors,
        fontSize: size,
        fontWeight: FontWeight.bold);
  }

  static TextStyle h1TextStyle() {
    return TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold);
  }
}