import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:google_fonts/google_fonts.dart';
import '../usecases/generateMaterialColor.dart';
import 'package:flutter/material.dart';
import '../usecases/constants.dart';
import 'responsive_safe_area.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../usecases/img.dart';
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

class _SplashAppState extends State<SplashApp>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Image imageLogo;
  late Image imageBg;

  @override
  void initState() {
    super.initState();
    _initAnimation();
    imageLogo = Image.asset(
      IMG.logo2,
      fit: BoxFit.contain,
      width: Get.width / 2,
      height: Get.width / 2,
    );
    imageBg = Image.asset(IMG.background);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initServices();
    });
  }

  void _initAnimation() {
    try {
      _animationController = AnimationController(
          duration: const Duration(seconds: 5), vsync: this);
      final curvedAnimation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut,
      );

      _animation =
          Tween<double>(begin: 0, end: 2 * math.pi).animate(curvedAnimation)
            ..addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                _animationController.reverse();
              } else if (status == AnimationStatus.dismissed) {
                _animationController.forward();
              }
            });
      _animationController.forward();
    } catch (e) {
      logger.i("error, $e");
      _animationController.dispose();
    }
  }

  Future<void> _initServices() async {
    try {
      await networkLogic.getConnectionType();
      // await Future.delayed(const Duration(seconds: 2));
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
    precacheImage(imageLogo.image, context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ResponsiveSafeArea(
      builder: (_) => Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(IMG.background),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _animation,
                  child: RippleAnimation(
                    repeat: true,
                    color: primaryColor,
                    minRadius: 38,
                    ripplesCount: 25,
                    child: ClipOval(child: imageLogo),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
