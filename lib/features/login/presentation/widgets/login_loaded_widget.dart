import '../../domain/entities/login_entity.dart';
import 'package:flutter/material.dart';

class LoginLoadedWidget extends StatelessWidget {
  final LoginEntity entity;
  const LoginLoadedWidget({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Text('token: ${entity.token}'),
      ),
    );
  }
}
