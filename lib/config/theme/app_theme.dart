import 'package:flutter/material.dart';

const Color _customColor = Color(0xff491222);

const List<Color> _colorThemes = [
  _customColor,
  Color.fromRGBO(18, 60, 73, 1),
  Color.fromARGB(255, 73, 73, 18),
];

class AppTheme {
  final int selectedTheme;

  AppTheme({required this.selectedTheme})
      : assert(selectedTheme >= 0 && selectedTheme <= _colorThemes.length - 1);

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorThemes[selectedTheme]);
  }
}
