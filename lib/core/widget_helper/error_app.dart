import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:fresh_track/features/login/presentation/pages/login_page.dart';
import 'package:fresh_track/core/widget_helper/splash_app.dart';
import 'package:google_fonts/google_fonts.dart';
import '../usecases/generateMaterialColor.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'responsive_safe_area.dart';
import 'package:get/get.dart';
import '../usecases/img.dart';


class ErrorApp extends StatelessWidget {
  final String? message;
  const ErrorApp({this.message, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      color: Colors.white,
      builder: (context) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Lottie.asset(IMG.jsonError, height: Get.height / 2.4),
                  const SizedBox(height: 5),
                  Text(
                    message ?? 'error_wrong'.tr,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                      icon: const Icon(
                        MdiIcons.refresh,
                        color: Colors.white,
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(primaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ))),
                      label: Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 12),
                        child: Text(
                          'try_again'.tr,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onPressed: () => Get.offAll(() => SplashApp(
                            home: const LoginPage(),
                          ))),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton.icon(
                      icon: const Icon(MdiIcons.alert, color: Colors.white),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                      side: BorderSide(color: Colors.red)))),
                      label: Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 12),
                        child: Text('rest'.tr),
                      ),
                      onPressed: () => Get.offAll(() => SplashApp(
                            home: const LoginPage(),
                          ))),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
