import '../../usecases/constants.dart';
import '../network/data_connection_checker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'dart:async';

class NetworkLogic extends GetxController {
  static NetworkLogic instance = Get.find();

  bool _isConnected = true;
  bool get isConnected => _isConnected;

  //Stream to keep listening to network change state
  late StreamSubscription _streamSubscription;

  @override
  void onInit() {
    getConnectionType();
    _streamSubscription =
        DataConnectionChecker().onStatusChange.listen(_updateState);
    super.onInit();
  }

  Future<NetworkLogic> init() async {
    await getConnectionType();
    return this;
  }

  // a method to get which connection result, if you we connected to internet or no if yes then which network
  Future<void> getConnectionType() async {
    late DataConnectionStatus result;
    try {
      result = await DataConnectionChecker().connectionStatus;
    } on PlatformException catch (e) {
      logger.e(e);
    }
    return _updateState(result);
  }

  // state update, of network, if you are connected to WIFI connectionType will get set to 1,
  // and update the state to the consumer of that variable.
  void _updateState(DataConnectionStatus status) {
    logger.i('network info: ${status.index}');
    switch (status) {
      case DataConnectionStatus.connected:
        log('Data connection is available. $_isConnected');
        _isConnected = true;
        update();
        break;
      case DataConnectionStatus.disconnected:
        log('You are disconnected from the internet. $_isConnected');
        _isConnected = false;
        update();
        break;
      default:
        log('You are disconnected from the internet. $_isConnected');
        _isConnected = false;
        update();
    }
  }

  @override
  void onClose() {
    //stop listening to network state when app is closed
    _streamSubscription.cancel();
  }
}
