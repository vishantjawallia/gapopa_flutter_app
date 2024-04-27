import 'package:flutter/material.dart';

class Themes {
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      primaryIconTheme: const IconThemeData(color: Colors.white),
      primaryColorDark: Colors.blue,
      primarySwatch: Colors.lightBlue,
      canvasColor: const Color.fromRGBO(86, 194, 255, 1),
      secondaryHeaderColor: Colors.deepPurpleAccent,
      fontFamily: 'Raleway',
      textTheme: ThemeData.light().textTheme.copyWith(
            titleSmall: const TextStyle(fontSize: 14, color: Colors.black54),
            titleMedium: const TextStyle(fontSize: 18, color: Colors.black54),
            titleLarge: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black54),
          ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      primaryIconTheme: const IconThemeData(color: Colors.white),
      primaryColorDark: Colors.blue,
      primarySwatch: Colors.lightBlue,
      canvasColor: const Color.fromRGBO(86, 194, 255, 1),
      secondaryHeaderColor: Colors.deepPurpleAccent,
      fontFamily: 'Raleway',
      textTheme: ThemeData.light().textTheme.copyWith(
            titleSmall: const TextStyle(fontSize: 14, color: Colors.white),
            titleMedium: const TextStyle(fontSize: 18, color: Colors.white),
            titleLarge: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
          ),
    );
  }
}
