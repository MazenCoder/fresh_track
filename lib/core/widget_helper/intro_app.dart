import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import '../usecases/generateMaterialColor.dart';
import '../../core/models/slider_model.dart';
import '../../core/usecases/keys.dart';
import '../../features/login/presentation/pages/login_page.dart';
import '../usecases/boxes.dart';
import 'responsive_safe_area.dart';
import 'slide_tile.dart';

class IntroApp extends StatefulWidget {
  const IntroApp({Key? key}) : super(key: key);

  @override
  _IntroAppState createState() => _IntroAppState();
}

class _IntroAppState extends State<IntroApp>
    with TickerProviderStateMixin<IntroApp> {
  final PageController controller = PageController();
  List<SliderModel> mySLides = <SliderModel>[];
  int slideIndex = 0;

  @override
  void initState() {
    mySLides = SliderModel.getSlides();
    super.initState();
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? primaryColor : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      bottom:
          (Platform.isIOS && slideIndex == mySLides.length - 1) ? false : true,
      color: Platform.isIOS ? Colors.white : null,
      builder: (_) => Scaffold(
        backgroundColor: backgroundColor,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  slideIndex = index;
                });
              },
              children: mySLides.map((e) {
                return SlideTile(
                  image: Image.asset(e.getImageAssetPath()),
                  title: e.getTitle(),
                  desc: e.getDesc(),
                );
              }).toList(),
            ),
          ),
        ),
        bottomSheet: slideIndex != mySLides.length - 1
            ? Container(
                height: 45,
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        controller.animateToPage(mySLides.length,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.linear);
                      },
                      child: Text(
                        'skip'.tr,
                        style: GoogleFonts.notoSans(
                          fontSize: 14,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    Container(
                      child: getPointWidgets(slideIndex),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.animateToPage(slideIndex + 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear);
                      },
                      child: Text(
                        'next'.tr,
                        style: GoogleFonts.notoSans(
                          fontSize: 14,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : InkWell(
                onTap: () async {
                  final box = Boxes.boxSettings();
                  await box.put(Keys.intro, false);
                  Get.offAll(() => const LoginPage());
                },
                child: Container(
                  height: Platform.isIOS ? 70 : 60,
                  color: primaryColor,
                  alignment: Alignment.center,
                  child: Text(
                    "get_started".tr,
                    style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Widget getPointWidgets(int slideIndex) {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < mySLides.length; i++) {
      if (i == slideIndex) {
        list.add(_buildPageIndicator(true));
      } else {
        list.add(_buildPageIndicator(false));
      }
    }
    return Row(children: list);
  }
}
