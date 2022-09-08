import '../usecases/generateMaterialColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'clipper_button.dart';


class ButtonClip extends StatelessWidget {
  final String text;
  const ButtonClip({
    Key? key,
    required this.text,
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
              height: 49.11,
              width: Get.width,
              child: ClipPath(
                clipper: ClipperButton(),
                child: Container(
                  color: greenColor,
                  height: 49.11,
                  width: Get.width,
                ),
              ),
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
