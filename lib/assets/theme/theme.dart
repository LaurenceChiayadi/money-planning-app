import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.lightGreen,
      // accentColor: Colors.lightGreenAccent,
      // backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: Colors.lightGreen,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.black, fontSize: 16),
        bodySmall: TextStyle(color: Colors.black54, fontSize: 14),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.lightGreen,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}

class CustomDarkModeTheme {
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.lightGreen,
      // accentColor: Colors.lightBlueAccent,
      // backgroundColor: Colors.black,
      scaffoldBackgroundColor: const Color(0xFF2a3439),
      appBarTheme: const AppBarTheme(
        color: Colors.lightGreen,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.white, fontSize: 16),
        bodySmall: TextStyle(color: Colors.white70, fontSize: 14),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.lightGreen,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
