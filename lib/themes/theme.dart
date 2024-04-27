import 'package:flutter/material.dart';

class Themes {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(240, 240, 240, 1),
    primaryIconTheme: const IconThemeData(color: Colors.white),
    primaryColorDark: Colors.blue,
    primarySwatch: Colors.lightBlue,
    canvasColor: const Color.fromRGBO(86, 194, 255, 1),
    secondaryHeaderColor: Colors.deepPurpleAccent,
    fontFamily: 'Raleway',
    textTheme: ThemeData.light().textTheme.copyWith(),
  );
  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(240, 240, 240, 1),
    primaryIconTheme: const IconThemeData(color: Colors.white),
    primaryColorDark: Colors.blue,
    primarySwatch: Colors.lightBlue,
    canvasColor: const Color.fromRGBO(86, 194, 255, 1),
    secondaryHeaderColor: Colors.deepPurpleAccent,
    fontFamily: 'Raleway',
    textTheme: ThemeData.light().textTheme.copyWith(),
  );
}
