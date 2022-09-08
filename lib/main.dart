import 'core/controllers/langs/app_language.dart';
import 'core/controllers/network/network_controller.dart';
import 'core/controllers/utils/utils_logic.dart';
import 'core/theme/app_theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'core/injection/injection.dart';
import 'core/controllers/langs/translation.dart';
import 'core/usecases/constants.dart';
import 'core/usecases/generateMaterialColor.dart';
import 'core/util/hive_utils.dart';
import 'core/widget_helper/splash_app.dart';
import 'features/login/presentation/pages/login_page.dart';


void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  configureInjection(Env.dev);
  await HiveUtils.init();
  Get.put(NetworkLogic());
  Get.put(AppLanguage());
  Get.put(UtilsLogic());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = appLanguage.getLocale();
    FlutterNativeSplash.remove();
    return Container(
      color: primaryColor,
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: GetMaterialApp(
          title: 'Fresh Track',
          translations: Translation(),
          locale: locale,
          fallbackLocale: locale,
          debugShowCheckedModeBanner: false,
          themeMode: utilsState.themeStateMode,
          theme: AppTheme.customLightTheme,
          darkTheme: AppTheme.customDarkTheme,
          home: SplashApp(
            home: const LoginPage(),
          ),
        ),
      ),
    );
  }
}
