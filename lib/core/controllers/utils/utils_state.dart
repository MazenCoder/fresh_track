import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UtilsState {

  late Offset offset;

  RxBool isDarkTheme = false.obs;
  ThemeMode get themeStateMode =>
      isDarkTheme.value ? ThemeMode.dark : ThemeMode.light;

  late String version;

  UtilsState() {
    version = '1.0.0';
    offset = Offset.zero;
  }
}
