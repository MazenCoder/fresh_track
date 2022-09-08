part of 'signup_bloc.dart';

@immutable
abstract class SignUpState {
  const SignUpState();
}

class SignUpInitial extends SignUpState {
  const SignUpInitial();
}


class SignUpLoading extends SignUpState {
  const SignUpLoading();
}

class SignUpLoaded extends SignUpState {
  final SignUpEntity entity;
  const SignUpLoaded({required this.entity});
}

class SignUpError extends SignUpState {
  final String message;
  const SignUpError({required this.message});
}
