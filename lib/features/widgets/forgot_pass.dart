import 'package:flutter_mobx/flutter_mobx.dart';
import '../../core/controllers/utils/utils_logic.dart';
import '../../core/mobx/mobx_app.dart';
import '../../core/usecases/constants.dart';
import '../../core/usecases/generateMaterialColor.dart';
import '../../core/widget_helper/clipper_arrow.dart';
import '../../core/widget_helper/sliding_layer.dart';
import '../account/presentation/pages/create_account_page.dart';
import '../../core/widget_helper/responsive_safe_area.dart';
import '../../core/widget_helper/button_clip.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../core/usecases/img.dart';
import 'package:get/get.dart';
import 'dart:math';


class ForgotPass extends StatelessWidget {
  ForgotPass({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final _formEmail = GlobalKey<FormState>();
  final MobxApp mobxApp = MobxApp();


  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      withBackground: true,
      reverse: true,
      bottom: false,
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    IMG.freshTrack,
                    height: 40,
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formEmail,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back),
                                onPressed: () => Get.back(),
                              ),
                              Text('recover_password'.tr),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18),
                            child: Column(
                              children: [
                                const SizedBox(height: 8),
                                Text('enter_your_email'.tr),
                                const SizedBox(height: 16),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        // prefixIcon: const Icon(Icons.email),
                                        hintText: 'email_fr'.tr,
                                      ),
                                      validator: (val) {
                                        final field = val ?? '';
                                        if (field.isEmpty) {
                                          return 'required_field'.tr;
                                        } else if (!GetUtils.isEmail(field.trim())) {
                                          return 'email_invalid'.tr;
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    InkWell(
                                      onTap: () {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        if (_formEmail.currentState
                                            ?.validate() ??
                                            false) {}
                                      },
                                      child: ButtonClip(
                                        text: 'next'.tr,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          textAlign: TextAlign.start,
                                          text: TextSpan(
                                            text: 'new_user'.tr,
                                            style: Get.textTheme.bodyText2,
                                            children: <TextSpan>[
                                              const TextSpan(text: ' '),
                                              TextSpan(text: 'create_your_account'.tr,
                                                  style: Get.textTheme.bodyText2?.copyWith(
                                                      color: const Color(0xFF149AD7)
                                                  ),
                                                  recognizer: TapGestureRecognizer()
                                                    ..onTap = ()=> Get.to(() => const CreateAccountPage())
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SlidingLayer(
                child1: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    key: UniqueKey(),
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'track_shipment'.tr,
                          style: Get.textTheme.bodyText2?.copyWith(
                              color: primaryColor
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        Expanded(
                          child: ClipPath(
                            clipper: ClipperArrow(
                                triangleHeight: 7,
                                rectangleClipHeight: 7,
                                edge: Edge.right
                            ),
                            child: Container(
                              color: primaryColor,
                              height: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                child2: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: 'shipping_no'.tr,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}