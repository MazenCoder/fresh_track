import 'package:fresh_track/core/controllers/utils/utils_logic.dart';
import '../usecases/generateMaterialColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'clipper_button.dart';



class ButtonClip extends StatelessWidget {
  final String text;
  final double height;
  const ButtonClip({
    Key? key,
    required this.text,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              color: primaryColor,
              height: height,
              width: Get.width,
              child: GetBuilder<UtilsLogic>(
                builder: (logic) {
                  return AnimatedBuilder(
                    animation: logic.controller,
                    builder: (context, child) {
                      return ClipPath(
                        clipper: ClipperButton(logic.animation.value),
                        child: Container(
                          color: greenColor,
                          height: height,
                          width: Get.width,
                        ),
                      );
                    },
                  );
                },
              )
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Center(
              child: Text(text,
                style: Get.textTheme.bodyText2?.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
