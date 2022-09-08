import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../usecases/boxes.dart';
import '../../usecases/constants.dart';
import '../../usecases/keys.dart';

class AppLanguage extends GetxController {
  static AppLanguage instance = Get.find();
  final box = Boxes.boxSettings();

  @override
  void onInit() {
    getLocale();
    super.onInit();
  }

  Future<void> updateLocal(String long) async {
    var locale = Locale(long);
    await box.put(Keys.locale, long);
    Get.updateLocale(locale);
  }

  Locale getLocale() {
    try {
      String locale = box.get(
        Keys.locale,
        defaultValue: 'en',
      );
      return Locale(locale);
    } catch (e) {
      logger.e(e);
      return const Locale('en');
    }
  }

  bool isLtr() {
    String locale = box.get(Keys.locale, defaultValue: 'en');
    final lung = Get.locale ?? Locale(locale);
    return lung.languageCode == 'ar';
  }

  Locale getSystemLocale() {
    String locale = box.get(Keys.locale, defaultValue: 'en');
    return Get.deviceLocale ?? Locale(locale);
  }
}
