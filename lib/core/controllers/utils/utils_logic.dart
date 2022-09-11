import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:package_info/package_info.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../usecases/boxes.dart';
import '../../usecases/constants.dart';
import '../../usecases/enums.dart';
import '../../usecases/keys.dart';
import 'utils_state.dart';



class UtilsLogic extends GetxController {
  static UtilsLogic instance = Get.find();
  final state = UtilsState();

  final boxSettings = Boxes.boxSettings();

  @override
  void onInit() {
    initVersion();
    getThemeStatus();
    super.onInit();
  }

  ///! --------- Version ---------
  Future<void> initVersion({bool listener = false}) async {
    final packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    state.version = version;
    if (listener) {
      update();
    }
  }

  ///! --------- Themes ---------
  void getThemeStatus() {
    state.isDarkTheme.value = boxSettings.get(Keys.theme, defaultValue: false);
    //! isDarkTheme = ture
    if (state.isDarkTheme.value) {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      //! isDarkTheme = false
      Get.changeThemeMode(ThemeMode.light);
    }
  }

  void saveThemeStatus(bool value) {
    logger.i('saveThemeStatus: $value');
    //! isDark = ture
    if (value) {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      //! isDark = false
      Get.changeThemeMode(ThemeMode.light);
    }
    state.isDarkTheme.value = value;
    boxSettings.put(Keys.theme, value);
  }

  void showSnack(
      {required SnackBarType type,
      String? title,
      String? message,
      int seconds = 4}) {
    switch (type) {
      case SnackBarType.error:
        Get.snackbar(
          title ?? 'oops'.tr,
          message ?? 'error_wrong'.tr,
          icon: Icon(MdiIcons.alert, color: Colors.red[300]),
          backgroundColor: Colors.white,
          shouldIconPulse: true,
          barBlur: 20,
          isDismissible: true,
          snackPosition: SnackPosition.BOTTOM,
          borderColor: Colors.red[300],
          borderWidth: 0.5,
          margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
          duration: Duration(seconds: seconds),
        );
        return;
      case SnackBarType.unconnected:
        Get.snackbar(
          title ?? 'oops'.tr,
          'error_connection'.tr,
          icon: Icon(MdiIcons.wifiRemove, color: Colors.red[300]),
          backgroundColor: Colors.white,
          shouldIconPulse: true,
          barBlur: 20,
          isDismissible: true,
          snackPosition: SnackPosition.BOTTOM,
          borderColor: Colors.red[300],
          borderWidth: 0.5,
          margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
          duration: Duration(seconds: seconds),
        );
        return;
      case SnackBarType.info:
        Get.snackbar(
          title ?? 'oops'.tr,
          message ?? '',
          icon: Icon(MdiIcons.informationOutline, color: Colors.orange[600]),
          backgroundColor: Colors.white,
          shouldIconPulse: true,
          barBlur: 20,
          isDismissible: true,
          snackPosition: SnackPosition.BOTTOM,
          borderColor: Colors.orange[600],
          borderWidth: 0.5,
          margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
          duration: Duration(seconds: seconds),
        );
        return;
      case SnackBarType.success:
        Get.snackbar(
          title ?? '',
          message ?? '',
          icon: Icon(MdiIcons.checkboxMarkedCircleOutline,
              color: Colors.green[300]),
          backgroundColor: Colors.white,
          shouldIconPulse: true,
          barBlur: 20,
          isDismissible: true,
          snackPosition: SnackPosition.BOTTOM,
          borderColor: Colors.green[300],
          borderWidth: 0.5,
          margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
          duration: Duration(seconds: seconds),
        );
        return;
    }
  }

  Future<void> askForPermissions() async {
    var cameraStatus = await Permission.camera.status;
    var storageStatus = await Permission.storage.status;
    var photosStatus = await Permission.photos.status;
    var notificationStatus = await Permission.notification.status;
    if (cameraStatus.isDenied ||
        storageStatus.isDenied ||
        photosStatus.isDenied ||
        notificationStatus.isDenied) {
      await [
        Permission.camera,
        Permission.storage,
        Permission.photos,
        Permission.notification,
      ].request();
    }
  }

  void changePositionUp() {
    state.offset = state.offset -= const Offset(1, 0);
    update();
  }

  void changePositionDown() {
    state.offset = state.offset += const Offset(1, 0);
    update();
  }
}
