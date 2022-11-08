import 'package:flutter/material.dart';

Map<int, Color> _opacityColor = {
  50: const Color.fromRGBO(85, 165, 158, 0.1),
  100: const Color.fromRGBO(85, 165, 158, 0.2),
  200: const Color.fromRGBO(85, 165, 158, 0.3),
  300: const Color.fromRGBO(85, 165, 158, 0.4),
  400: const Color.fromRGBO(85, 165, 158, 0.5),
  500: const Color.fromRGBO(85, 165, 158, 0.6),
  600: const Color.fromRGBO(85, 165, 158, 0.7),
  700: const Color.fromRGBO(85, 165, 158, 0.8),
  800: const Color.fromRGBO(85, 165, 158, 0.9),
  900: const Color.fromRGBO(85, 165, 158, 1),
};

abstract class CustomColors {
  static Color customContrasctColor = Colors.red.shade600;
  static MaterialColor customSwatchColor =
      MaterialColor(0xFF55A59E, _opacityColor);
}
