import '../usecases/generateMaterialColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


typedef ResponsiveBuilder = Widget Function(BuildContext context);

class ResponsiveSafeArea extends StatelessWidget {
  const ResponsiveSafeArea({
    required ResponsiveBuilder builder,
    Key? key,
    Color? color,
    bool? bottom,
    bool? withBackground,
    bool? reverse,
  })  : responsiveBuilder = builder,
        colorContainer = color,
        allowBottom = bottom ?? true,
        reverse = reverse ?? false,
        withBackground = withBackground ?? false,
        super(key: key);

  final ResponsiveBuilder responsiveBuilder;
  final Color? colorContainer;
  final bool allowBottom;
  final bool withBackground;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
        color: colorContainer ?? primaryColor,
        child: SafeArea(bottom: allowBottom,
          child: withBackground ?
          Container(
            color: backgroundColor,
            height: Get.height,
            width: Get.width,
            child: Stack(
              children: [
                //! Background
                Positioned(
                  left: reverse ? null : -120,
                  right: reverse ? -120 : null,
                  top: -140,
                  child: Container(
                    height: Get.width,
                    width: Get.width,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: reverse ? Alignment.topRight : Alignment.topLeft,
                          end: reverse ? Alignment.bottomLeft : Alignment.bottomRight,
                          colors: [
                            primaryColor,
                            primaryColor.withOpacity(0.4),
                            primaryColor.withOpacity(0),
                            Colors.transparent,
                          ],
                        )
                    ),
                  ),
                ),
                Positioned(
                  right: reverse ? null : -120,
                  left: reverse ? -120 : null,
                  bottom: -140,
                  child: Container(
                    height: Get.width /1.2,
                    width: Get.width /1.2,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: reverse ? Alignment.bottomLeft : Alignment.bottomRight,
                          end: reverse ? Alignment.topRight : Alignment.topLeft,
                          stops: const [
                            0.3,
                            0.7,
                            0.8,
                            0.9,
                          ],
                          colors: [
                            greenColor.withOpacity(.8),
                            greenColor.withOpacity(.1),
                            greenColor.withOpacity(0),
                            Colors.transparent,
                          ],
                        )
                    ),
                  ),
                ),
                responsiveBuilder(context),
              ],
            ),
          )
          : responsiveBuilder(context),
        ),
      ),
    );
  }
}
