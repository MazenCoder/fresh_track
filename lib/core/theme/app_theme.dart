import 'package:fresh_track/core/theme/text_theme.dart';
import '../usecases/generateMaterialColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AppTheme {
  //! Dark
  static ThemeData customDarkTheme = ThemeData.dark().copyWith(
    // primaryColor: primaryColor,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black38,
    textTheme: CustomTextTheme.textThemeDark,
    primaryTextTheme: CustomTextTheme.textThemeDark,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xff424242),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    indicatorColor: Colors.white,
    buttonTheme: const ButtonThemeData(
      // buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
      disabledColor: Colors.grey,
      // colorScheme: ColorScheme.dark(background: Color(0xFF4caf50)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: Get.theme.textTheme.subtitle2,
      focusColor: Colors.white,
      fillColor: Colors.white,
      suffixIconColor: Colors.grey.shade400,
      suffixStyle: Get.theme.textTheme.subtitle2,
      hintStyle: Get.theme.textTheme.subtitle2,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: Colors.grey.shade400,
          width: 1.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: Colors.grey.shade400,
          width: 1.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: Colors.grey.shade400,
          width: 1.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: Colors.grey.shade400,
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1.5,
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    textButtonTheme: TextButtonThemeData(style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith<Color?>((s) {
        if (s.contains(MaterialState.disabled)) {
          return Colors.white30;
        } // Disabled text color
        return Colors.white; // Enabled text color
      }),
      // foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      // textStyle: MaterialStateProperty.all(primaryColor)
    )),
  );

  //! Light
  static ThemeData customLightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    textTheme: CustomTextTheme.textThemeLight,
    primaryTextTheme: CustomTextTheme.textThemeLight,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      centerTitle: true,
    ),
    backgroundColor: backgroundColor,
    scaffoldBackgroundColor: backgroundColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
      ),
    ),
    primaryIconTheme: const IconThemeData.fallback().copyWith(
      color: primaryColor,
    ),
    iconTheme: IconThemeData(color: headlineColor),
    indicatorColor: headlineColor,
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
      disabledColor: Colors.grey,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: Get.theme.textTheme.bodySmall,
      suffixStyle: Get.theme.textTheme.subtitle2,
      hintStyle: Get.theme.textTheme.bodySmall,
      suffixIconColor: Colors.grey,
      focusColor: primaryColor,
      fillColor: const Color(0xFFF3F3F3),
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(
          style: BorderStyle.none,
          width: 0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(
          style: BorderStyle.none,
          width: 0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(
          style: BorderStyle.none,
          width: 0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(
          style: BorderStyle.none,
          width: 0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(
          style: BorderStyle.none,
          width: 0,
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    textButtonTheme: TextButtonThemeData(style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith<Color?>((s) {
        if (s.contains(MaterialState.disabled)) {
          return Colors.grey;
        } // Disabled text color
        return primaryColor; // Enabled text color
      }),
      // foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      // textStyle: MaterialStateProperty.all(primaryColor)
    )),
  );
}
