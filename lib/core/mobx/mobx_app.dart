import 'package:mobx/mobx.dart';
import 'package:get/get.dart';
import 'dart:io';

part 'mobx_app.g.dart';

class MobxApp = MobxAppBase with _$MobxApp;

abstract class MobxAppBase with Store {

  @observable
  bool obscureText = true;

  @action
  void toggle(bool val) {
    obscureText = val;
  }
}