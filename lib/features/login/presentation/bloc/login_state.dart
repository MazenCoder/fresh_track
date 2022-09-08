part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
}


class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginLoaded extends LoginState {
  final LoginEntity entity;
  const LoginLoaded({required this.entity});
}

class LoginError extends LoginState {
  final String message;
  const LoginError({required this.message});
}
