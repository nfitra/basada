import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData getPrimary() {
    return ThemeData(
      primaryColor: const Color(0xff3A7E04),
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: const Color(0xff3A7E04),
          shape: const StadiumBorder(),
          maximumSize: const Size(double.infinity, 56),
          minimumSize: const Size(double.infinity, 56),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Color(0xff3A7E04).withOpacity(0.1),
        iconColor: Color(0xff3A7E04),
        prefixIconColor: Color(0xff3A7E04),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
