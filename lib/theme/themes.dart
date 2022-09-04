import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      elevation: 0,
      foregroundColor: Colors.black87,
      backgroundColor: Colors.grey[100],
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.grey[900],
    ),
  );
}
