import 'package:flutter/material.dart';

const availableColors = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
    : assert(
        selectedColor >= 0,
        'Selected color must be a number greater than 0',
      ),
      assert(
        selectedColor <= availableColors.length,
        'Selected color must be less or equal to ${availableColors.length - 1}',
      );

  ThemeData getTheme() => ThemeData(
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: availableColors[selectedColor],
    appBarTheme: AppBarTheme(centerTitle: false),
  );
}
