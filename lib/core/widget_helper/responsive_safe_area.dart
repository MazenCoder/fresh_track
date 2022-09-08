import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../usecases/generateMaterialColor.dart';


typedef ResponsiveBuilder = Widget Function(BuildContext context);

class ResponsiveSafeArea extends StatelessWidget {
  const ResponsiveSafeArea({
    required ResponsiveBuilder builder,
    Key? key,
    Color? color,
    bool? bottom,
  })  : responsiveBuilder = builder,
        colorContainer = color,
        allowBottom = bottom ?? true,
        super(key: key);

  final ResponsiveBuilder responsiveBuilder;
  final Color? colorContainer;
  final bool allowBottom;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
        color: colorContainer ?? primaryColor,
        child: SafeArea(bottom: allowBottom, child: responsiveBuilder(context)),
      ),
    );
  }
}
