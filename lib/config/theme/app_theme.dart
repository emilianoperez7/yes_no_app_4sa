import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 0, 0, 255);
const List<Color> _colorThemes = [
  _customColor,
  Colors.red,
  Colors.lightBlue,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.green,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < _colorThemes.length,
            'Colors must be between 0 and ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _colorThemes[selectedColor],
        brightness: Brightness.dark);
  }
}
