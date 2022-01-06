import 'package:flutter/material.dart';

final myTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: Colors.green.shade800),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 12),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.black.withOpacity(0.83), width: 2)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.red.shade800, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.red.shade800, width: 2),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.black.withOpacity(0.8))),
    ));
