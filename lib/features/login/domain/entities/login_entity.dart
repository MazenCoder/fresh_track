import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LoginEntity extends Equatable {
  final String token;

  LoginEntity({
    required this.token,
  });

  @override
  List<Object> get props => [token];
}