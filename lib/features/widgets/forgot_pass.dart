import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/usecases/generateMaterialColor.dart';
import '../../core/usecases/img.dart';
import '../../core/widget_helper/responsive_safe_area.dart';

class ForgotPass extends StatelessWidget {
  ForgotPass({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final _formEmail = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      bottom: false,
      builder: (_) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(IMG.background),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () => Get.back(),
                    ),
                    Image.asset(
                      IMG.freshTrack,
                      height: 40,
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Form(
                          key: _formEmail,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'enter_your_email'.tr,
                              ),
                              const SizedBox(height: 28),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormField(
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.email),
                                      hintText: 'email'.tr,
                                    ),
                                    validator: (val) {
                                      final _field = val ?? '';
                                      if (_field.isEmpty) {
                                        return 'required_field'.tr;
                                      } else if (!GetUtils.isEmail(_field.trim())) {
                                        return 'email_invalid'.tr;
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          child: Text(
                                            'send'.tr,
                                          ),
                                          onPressed: () {
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                            if (_formEmail.currentState
                                                ?.validate() ??
                                                false) {}
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
