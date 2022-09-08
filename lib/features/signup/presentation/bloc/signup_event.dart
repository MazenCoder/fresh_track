part of 'signup_bloc.dart';

@immutable
abstract class SignUpEvent {
  const SignUpEvent();
}


class GetSignUpEvent extends SignUpEvent {
  final SignUpParams params;
  const GetSignUpEvent({required this.params});
}
