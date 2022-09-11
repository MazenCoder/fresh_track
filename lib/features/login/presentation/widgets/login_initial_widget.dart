import '../../../account/presentation/pages/create_account_page.dart';
import 'package:after_layout/after_layout.dart';
import 'package:fresh_track/core/usecases/constants.dart';
import 'package:fresh_track/core/usecases/generateMaterialColor.dart';
import 'package:fresh_track/core/mobx/mobx_app.dart';
import '../../../../../core/usecases/boxes.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/usecases/keys.dart';
import '../../../../core/widget_helper/button_clip.dart';
import '../../../../core/widget_helper/clipper_arrow.dart';
import '../../../../core/widget_helper/sliding_layer.dart';
import '../../../../core/usecases/img.dart';
import '../../../widgets/forgot_pass.dart';



class LoginInitialWidget extends StatefulWidget {
  final bool keyboardVisible;
  const LoginInitialWidget({super.key, required this.keyboardVisible});

  @override
  State<LoginInitialWidget> createState() => _LoginInitialWidgetState();
}

class _LoginInitialWidgetState extends State<LoginInitialWidget>
    with AfterLayoutMixin<LoginInitialWidget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final _form = GlobalKey<FormState>();
  final box = Boxes.boxLoginInfo();
  final MobxApp mobxApp = MobxApp();
  bool _remember = true;

  @override
  void initState() {
    super.initState();
    _remember = box.get(Keys.remember, defaultValue: false);
    String? usernameCache = box.get(
      Keys.username,
      defaultValue: null,
    );
    if (usernameCache != null) {
      _usernameController.text = usernameCache;
    }

    String? passwordCache = box.get(
      Keys.password,
      defaultValue: null,
    );
    if (passwordCache != null) {
      _passController.text = passwordCache;
    }
  }

  @override
  void afterFirstLayout(BuildContext context) {
    utilsLogic.controller.forward(from: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Image.asset(
          IMG.freshTrack,
          height: 33,
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: Center(
              child: SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'welcome'.tr,
                      style: Get.textTheme.headline4,
                    ),
                    const SizedBox(height: 25),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'login'.tr,
                          style: Get.textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Form(
                      key: _form,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: _usernameController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              label: Text('username'.tr)
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
                          const SizedBox(height: 12),
                          Observer(
                            builder: (_) {
                              return TextFormField(
                                controller: _passController,
                                obscureText: mobxApp.obscureText,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  label: Text('password'.tr),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      mobxApp.obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      mobxApp.toggle(mobxApp.obscureText =
                                      !mobxApp.obscureText);
                                    },
                                  ),
                                ),
                                validator: (val) {
                                  final field = val ?? '';
                                  if (field.isEmpty) {
                                    return 'required_field'.tr;
                                  } else {
                                    return null;
                                  }
                                },
                              );
                            },
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(vertical: 12.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (_form.currentState
                                        ?.validate() ??
                                        false) {
                                      setState(() {
                                        _remember = !_remember;
                                      });
                                    }
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        _remember
                                            ? Icons.check_box
                                            : Icons.check_box_outline_blank,
                                        color: _remember
                                            ? primaryColor
                                            : greyColor,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        'remember_me'.tr,
                                        style: Get.textTheme.bodyMedium?.copyWith(
                                          color: const Color(0xFF149AD7)
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () => Get.to(() => ForgotPass()),
                                  child: Text(
                                    'forgot_pass'.tr,
                                    style: Get.textTheme.bodyMedium?.copyWith(
                                        color: const Color(0xFF149AD7)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    InkWell(
                      onTap:  () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (_form.currentState
                            ?.validate() ??
                            false) {
                          if (_remember) {
                            await box.put(
                              Keys.username,
                              _usernameController.text.trim(),
                            );
                            await box.put(
                              Keys.password,
                              _passController.text.trim(),
                            );
                          } else {
                            await box.delete(Keys.email);
                            await box.delete(Keys.password);
                          }
                          await box.put(Keys.remember, _remember);
                          if (!mounted) return;
                          utilsLogic.controller.reverse(from: 1);
                          // context.read<LoginBloc>().add(GetLoginEvent(
                          //   params: LoginParams(
                          //     email: _usernameController.text.trim(),
                          //     password: _passController.text.trim(),
                          //   ),
                          // ));
                        }
                      },
                      child: ButtonClip(
                        text: 'access'.tr,
                        height: 40,
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
              ),
            ),
          ),
        ),

        if (!widget.keyboardVisible)
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
    );
  }
}