import '../../../../core/widget_helper/responsive_safe_area.dart';
import '../../../../core/usecases/generateMaterialColor.dart';
import '../../../../core/widget_helper/clipper_arrow.dart';
import '../../../../core/widget_helper/sliding_layer.dart';
import 'package:fresh_track/core/mobx/mobx_app.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/usecases/img.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/charger_account.dart';



class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage>
    with SingleTickerProviderStateMixin {

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
                              ChargerAccount(),
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
