import 'package:fresh_track/core/usecases/generateMaterialColor.dart';
import 'package:fresh_track/core/mobx/mobx_app.dart';
import '../../../../../core/usecases/boxes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/usecases/keys.dart';
import '../../../../core/widget_helper/button_clip.dart';
import '../../../../core/widget_helper/clipper_arrow.dart';
import '../../../widgets/forgot_pass.dart';
import '../../../../core/usecases/img.dart';
import '../../data/models/login_params.dart';
import '../bloc/login_bloc.dart';



class LoginInitialWidget extends StatefulWidget {
  const LoginInitialWidget({super.key});

  @override
  State<LoginInitialWidget> createState() => _LoginInitialWidgetState();
}

class _LoginInitialWidgetState extends State<LoginInitialWidget> {
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
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Positioned(
            left: -120,
            top: -140,
            child: Container(
              height: Get.width,
              width: Get.width,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      primaryColor,
                      primaryColor.withOpacity(0.55),
                      primaryColor.withOpacity(0),
                      Colors.transparent,
                    ],
                  )
              ),
            ),
          ),
          Positioned(
            right: -120,
            bottom: -140,
            child: Container(
              height: Get.width /1.2,
              width: Get.width /1.2,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
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
        ],
      ),
    );
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(IMG.background),
          fit: BoxFit.fill,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Image.asset(
            IMG.freshTrack,
            height: 33,
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
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
                    const SizedBox(height: 8),
                    Form(
                      key: _form,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: _usernameController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'username'.tr,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  width: 1.0,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
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
                          ),
                          const SizedBox(height: 16),
                          Observer(
                            builder: (_) {
                              return TextFormField(
                                controller: _passController,
                                obscureText: mobxApp.obscureText,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'password'.tr,
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                  ),
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
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 1.0,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                      width: 1.0,
                                    ),
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
                                        style: Get.textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () => Get.to(() => ForgotPass()),
                                  child: Text(
                                    'forgot_pass'.tr,
                                    style: Get.textTheme.bodyMedium,
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
                          context.read<LoginBloc>().add(GetLoginEvent(
                            params: LoginParams(
                              email: _usernameController.text.trim(),
                              password: _passController.text.trim(),
                            ),
                          ));
                        }
                      },
                      child: ButtonClip(
                          text: 'access'.tr
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          /*
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'dont_have_account'.tr,
                ),
                const SizedBox(width: 5.0),
                InkWell(
                  onTap: () => Get.to(() => const SignUpPage()),
                  child: Text(
                    'register'.tr,
                    style: Get.textTheme.bodyText1?.copyWith(
                      color: const Color(0xFF149AD7),
                    ),
                  ),
                )
              ],
            ),
            */
          SizedBox(
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'track_shipment'.tr,
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
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}


