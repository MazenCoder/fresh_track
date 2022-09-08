import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh_track/core/usecases/generateMaterialColor.dart';
import 'package:get/get.dart';
import '../usecases/constants.dart';
import '../usecases/img.dart';
import 'responsive_safe_area.dart';


class LoadingApp extends StatefulWidget {
  const LoadingApp({Key? key}) : super(key: key);

  @override
  _LoadingAppState createState() => _LoadingAppState();
}

class _LoadingAppState extends State<LoadingApp>
    with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation<double> animation;

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  void _initAnimation() {
    try {
      animController = AnimationController(
          duration: const Duration(seconds: 2), vsync: this);
      final curvedAnimation = CurvedAnimation(
        parent: animController,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut,
      );

      animation =
          Tween<double>(begin: 0, end: 2 * math.pi).animate(curvedAnimation)
            ..addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                animController.reverse();
              } else if (status == AnimationStatus.dismissed) {
                animController.forward();
              }
            });
      animController.forward();
    } catch (e) {
      logger.e("error, _initAnimation: $e");
      animController.dispose();
    }
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      withBackground: true,
      builder: (_) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: FadeTransition(
                    opacity: animation,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Image.asset(
                        IMG.logoTrans,
                        width: Get.width / 2,
                      ),
                    ),
                  ),
                ),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(primaryColor)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
