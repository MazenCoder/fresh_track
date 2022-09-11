import '../../../../core/usecases/constants.dart';
import '../../../../core/widget_helper/button_clip.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/mobx/mobx_app.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ChargerAccount extends StatelessWidget {
  ChargerAccount({Key? key}) : super(key: key);

  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _iceController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _reaperPasswordController = TextEditingController();
  final _form = GlobalKey<FormState>();
  final MobxApp mobxApp = MobxApp();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _form,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            //! Your Company
            TextFormField(
              controller: _companyController,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  label: Text('your_company'.tr)
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

            //! Address
            TextFormField(
              controller: _addressController,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                  label: Text('address'.tr)
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

            //! City
            TextFormField(
              controller: _cityController,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  label: Text('city'.tr)
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

            //! ICE
            TextFormField(
              controller: _iceController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  label: Text('ice'.tr)
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

            //! First Name
            TextFormField(
              controller: _firstNameController,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  label: Text('first_name'.tr)
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

            //! Last Name
            TextFormField(
              controller: _lastNameController,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  label: Text('last_name'.tr)
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

            //! Email
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  label: Text('email'.tr)
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
            const SizedBox(height: 12),

            //! Phone
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  label: Text('phone'.tr)
              ),
              validator: (val) {
                final field = val ?? '';
                if (field.isEmpty) {
                  return 'required_field'.tr;
                } else if (!GetUtils.isPhoneNumber(field.trim())) {
                  return 'phone_invalid'.tr;
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 12),

            //! Password
            Observer(
              builder: (_) {
                return TextFormField(
                  controller: _passwordController,
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
            const SizedBox(height: 12),

            //! Reaper Password
            Observer(
              builder: (_) {
                return TextFormField(
                  controller: _reaperPasswordController,
                  obscureText: mobxApp.obscureText,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text('reaper_password'.tr),
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
                    } else if (field != _passwordController.text.trim()) {
                      return 'passwords_not_match'.tr;
                    }  else {
                      return null;
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap:  () {
                utilsLogic.controller.forward(from: 1);
                FocusManager.instance.primaryFocus?.unfocus();
                if (_form.currentState?.validate() ?? false) {
                  utilsLogic.controller.reverse(from: 1);
                }
              },
              child: ButtonClip(text: 'access'.tr,
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
                    text: 'already_have_account'.tr,
                    style: Get.textTheme.bodyText2,
                    children: <TextSpan>[
                      const TextSpan(text: ' '),
                      TextSpan(text: 'login'.tr,
                          style: Get.textTheme.bodyText2?.copyWith(
                              color: const Color(0xFF149AD7)
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = ()=> Get.back()
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
