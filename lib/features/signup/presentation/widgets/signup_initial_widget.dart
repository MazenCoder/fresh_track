import 'package:fresh_track/core/mobx/mobx_app.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/usecases/img.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SignUpInitialWidget extends StatefulWidget {
  const SignUpInitialWidget({Key? key}) : super(key: key);

  @override
  State<SignUpInitialWidget> createState() => _SignUpInitialWidgetState();
}

class _SignUpInitialWidgetState extends State<SignUpInitialWidget> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final _form = GlobalKey<FormState>();
  final MobxApp mobxApp = MobxApp();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(IMG.background),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'create_account'.tr,
                  style: Get.textTheme.headline5,
                ),
                const SizedBox(height: 25),
                Form(
                  key: _form,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //! First Name
                      TextFormField(
                        controller: _firstNameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: 'first_name'.tr,
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

                      //! Last Name
                      TextFormField(
                        controller: _lastNameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: 'last_name'.tr,
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

                      //! Email
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'email'.tr,
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
                      const SizedBox(height: 16),

                      //! Phone
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'phone'.tr,
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

                      //! Password
                      Observer(
                        builder: (_) {
                          return TextFormField(
                            controller: _passController,
                            obscureText: mobxApp.obscureText,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'password'.tr,
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
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: Text(
                          'validate'.tr.toUpperCase(),
                        ),
                        onPressed: () async {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (_form.currentState?.validate() ?? false) {

                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
