part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {
  const LoginEvent();
}


class GetLoginEvent extends LoginEvent {
  final LoginParams params;
  const GetLoginEvent({required this.params});
}
