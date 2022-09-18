import '../../../../core/widget_helper/responsive_safe_area.dart';
import '../../../../core/usecases/generateMaterialColor.dart';
import '../../../../core/widget_helper/clipper_arrow.dart';
import '../../../../core/widget_helper/sliding_layer.dart';
import '../../../../core/widget_helper/button_clip.dart';
import 'package:fresh_track/core/mobx/mobx_app.dart';
import '../../../../core/usecases/constants.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/usecases/img.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';



class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage>
    with SingleTickerProviderStateMixin, AfterLayoutMixin<CreateAccountPage> {

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
  late TabController _tabController;
  final List<Widget> myTabs = [
    Tab(
      text: 'charger'.tr,
      icon: Image.asset(IMG.chargerIcon,
        height: 30, width: 30,
      )
    ),
    Tab(
      text: 'carrier'.tr,
      icon: Image.asset(IMG.carrierIcon,
        height: 30, width: 30,
      ),
    ),
  ];

  @override
  initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      mobxApp.onPageChanged(_tabController.index);
    }
  }

  @override
  void afterFirstLayout(BuildContext context) {
    utilsLogic.controller.forward(from: 1);
  }

  @override
  Widget build(BuildContext context) {
    bool keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return ResponsiveSafeArea(
      withBackground: true,
      reverse: true,
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const SizedBox(height: 16),
              Image.asset(
                IMG.freshTrack,
                height: 33,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () => Get.back(),
                            ),
                            Text('create_account'.tr),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text('you_are'.tr,
                          style: Get.textTheme.headline5,
                        ),

                        Material(
                          color: Colors.transparent,
                          child: TabBar(
                            labelColor: Colors.black,
                            indicatorColor: primaryColor,
                            indicator: UnderlineTabIndicator(
                              borderSide: BorderSide(color: greenColor, width: 1.0),
                              insets: const EdgeInsets.symmetric(horizontal: 20),
                            ),
                            controller: _tabController,
                            tabs: myTabs,
                          ),
                        ),

                        Observer(
                          builder: (_) => Center(
                            child: [
                              // ChargerAccount(),
                              Padding(
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
                                          FocusManager.instance.primaryFocus?.unfocus();
                                          if (_form.currentState?.validate() ?? false) {
                                            utilsLogic.controller.reverse(from: 1);
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
                              ),
                              Container(),
                            ][mobxApp.currentIndex],
                          ),
                        ),

                      ],
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
}
