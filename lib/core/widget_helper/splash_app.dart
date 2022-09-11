import 'package:flutter/material.dart';
import '../usecases/constants.dart';
import 'responsive_safe_area.dart';
import 'package:get/get.dart';
import '../usecases/img.dart';
import 'dart:math' as math;
import 'error_app.dart';

late Widget _home;

class SplashApp extends StatefulWidget {
  SplashApp({
    required Widget home,
    bool isInitServices = true,
    Key? key,
  }) : super(key: key) {
    _home = home;
  }

  @override
  _SplashAppState createState() => _SplashAppState();
}

class _SplashAppState extends State<SplashApp> {
  late Image imageLogo;

  @override
  void initState() {
    super.initState();
    imageLogo = Image.asset(
      IMG.logo2,
      fit: BoxFit.contain,
      width: Get.width / 2,
      height: Get.width / 2,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initServices();
    });
  }

  Future<void> _initServices() async {
    try {
      await networkLogic.getConnectionType();
      await Future.delayed(const Duration(seconds: 2));
      if (networkLogic.isConnected) {
        return Get.offAll(() => _home);
      } else {
        return Get.offAll(() => ErrorApp(
          message: 'error_connection'.tr,
        ));
      }
    } catch (e) {
      logger.e(e);
      return Get.offAll(() => ErrorApp(
        message: 'error_wrong'.tr,
      ));
    }
  }

  @override
  void didChangeDependencies() {
    precacheImage(imageLogo.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      withBackground: true,
      builder: (_) => Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(child: imageLogo),
            ],
          ),
        ),
      ),
    );
  }
}
