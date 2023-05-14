import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    
    scaffoldBackgroundColor: const Color.fromARGB(255, 16, 15, 15),
    appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 16, 15, 15), elevation: 0, titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
    dividerColor: Colors.white24,
    primarySwatch: Colors.yellow,
    listTileTheme: const ListTileThemeData(iconColor: Colors.white),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
  );