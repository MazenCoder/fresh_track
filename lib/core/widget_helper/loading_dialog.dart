import 'package:flutter/material.dart';

import '../usecases/generateMaterialColor.dart';

class LoadingDialog extends StatelessWidget {
  static void show({Key? key, required BuildContext context, Color? color}) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: color ?? Colors.black38,
      builder: (_) => LoadingDialog(key: key),
    );
  }

  static void hide({required BuildContext context}) {
    Navigator.pop(context);
  }

  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Card(
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(12.0),
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
