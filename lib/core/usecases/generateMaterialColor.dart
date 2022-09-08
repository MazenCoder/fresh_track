import 'package:flutter/material.dart';
import 'dart:math';


MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);



final primaryColor = generateMaterialColor(const Color(0xFF283C7E));
final greenColor = generateMaterialColor(const Color(0xFF91C251));
final blueColor = generateMaterialColor(const Color(0xff235ba8));
final blueAccentColor = generateMaterialColor(const Color(0xff7879F1));
final greyColor = generateMaterialColor(const Color(0xffaba9a9));
final backgroundColor = generateMaterialColor(const Color(0xffFEFEFE));
// final backgroundColor = generateMaterialColor(const Color(0xffeff0f3));
final cardBackgroundColor = generateMaterialColor(const Color(0xfffffffe));
final headlineColor = generateMaterialColor(const Color(0xff0f0e17));
final subHeadlineColor = generateMaterialColor(const Color(0xff2e2f3e));

// Text Style
const titleTextStyle = TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold);
const headingTextStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.w600);
final subTextStyle = TextStyle(fontSize: 16, color: greyColor);