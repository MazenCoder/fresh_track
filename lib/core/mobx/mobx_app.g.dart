// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_app.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobxApp on MobxAppBase, Store {
  late final _$obscureTextAtom =
      Atom(name: 'MobxAppBase.obscureText', context: context);

  @override
  bool get obscureText {
    _$obscureTextAtom.reportRead();
    return super.obscureText;
  }

  @override
  set obscureText(bool value) {
    _$obscureTextAtom.reportWrite(value, super.obscureText, () {
      super.obscureText = value;
    });
  }

  late final _$isFlippedAtom =
      Atom(name: 'MobxAppBase.isFlipped', context: context);

  @override
  bool get isFlipped {
    _$isFlippedAtom.reportRead();
    return super.isFlipped;
  }

  @override
  set isFlipped(bool value) {
    _$isFlippedAtom.reportWrite(value, super.isFlipped, () {
      super.isFlipped = value;
    });
  }

  late final _$currentIndexAtom =
      Atom(name: 'MobxAppBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$MobxAppBaseActionController =
      ActionController(name: 'MobxAppBase', context: context);

  @override
  void toggle(bool val) {
    final _$actionInfo =
        _$MobxAppBaseActionController.startAction(name: 'MobxAppBase.toggle');
    try {
      return super.toggle(val);
    } finally {
      _$MobxAppBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFlipped(bool val) {
    final _$actionInfo = _$MobxAppBaseActionController.startAction(
        name: 'MobxAppBase.setFlipped');
    try {
      return super.setFlipped(val);
    } finally {
      _$MobxAppBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPageChanged(int index) {
    final _$actionInfo = _$MobxAppBaseActionController.startAction(
        name: 'MobxAppBase.onPageChanged');
    try {
      return super.onPageChanged(index);
    } finally {
      _$MobxAppBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
obscureText: ${obscureText},
isFlipped: ${isFlipped},
currentIndex: ${currentIndex}
    ''';
  }
}
