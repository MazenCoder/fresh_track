import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/mobx/mobx_app.dart';
import '../../core/usecases/constants.dart';
import '../../core/usecases/generateMaterialColor.dart';
import '../../core/usecases/img.dart';
import '../../core/widget_helper/button_clip.dart';
import '../../core/widget_helper/clipper_arrow.dart';
import '../../core/widget_helper/responsive_safe_area.dart';
import '../../core/widget_helper/sliding_layer.dart';



class RecoverPassword extends StatefulWidget {
  const RecoverPassword({Key? key}) : super(key: key);

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword>
    with AfterLayoutMixin<RecoverPassword> {

  final TextEditingController _codeRecoveryController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _retypeNewPasswordController = TextEditingController();
  final _formEmail = GlobalKey<FormState>();
  final MobxApp mobxApp = MobxApp();


  @override
  Widget build(BuildContext context) {
    bool keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return ResponsiveSafeArea(
      withBackground: true,
      reverse: true,
      bottom: false,
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
              const SizedBox(height: 16),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formEmail,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                Text('recovery_code'.tr),
                                const SizedBox(height: 8),
                                Text('resend_recovery_code'.tr,
                                  textAlign: TextAlign.start,
                                  style: Get.textTheme.bodyMedium?.copyWith(
                                    color: const Color(0xFF149AD7),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    //! Code Recovery
                                    TextFormField(
                                      controller: _codeRecoveryController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        label: Text('code_recovery'.tr),
                                      ),
                                      validator: (val) {
                                        final field = val ?? '';
                                        if (field.isEmpty) {
                                          return 'required_field'.tr;
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 16),

                                    //! New Password
                                    TextFormField(
                                      controller: _newPasswordController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        label: Text('new_password'.tr,),
                                      ),
                                      validator: (val) {
                                        final field = val ?? '';
                                        if (field.isEmpty) {
                                          return 'required_field'.tr;
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 16),

                                    //! Retype New Password
                                    TextFormField(
                                      controller: _retypeNewPasswordController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        label: Text('retype_new_password'.tr),
                                      ),
                                      validator: (val) {
                                        final field = val ?? '';
                                        if (field.isEmpty) {
                                          return 'required_field'.tr;
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 20),

                                    InkWell(
                                      onTap: () async {
                                        FocusManager.instance.primaryFocus?.unfocus();
                                        if (_formEmail.currentState?.validate() ?? false) {
                                          utilsLogic.controller.reverse(from: 1);
                                        }
                                      },
                                      child: ButtonClip(
                                        text: 'next'.tr,
                                        height: 40,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
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

              if (!keyboardVisible)
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

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    utilsLogic.controller.forward(from: 1);
  }

}