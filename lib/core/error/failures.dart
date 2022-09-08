import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]) : super();
}

class ServerFailure extends Failure {
  final String message;

  const ServerFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class CacheFailure extends Failure {
  final String message;

  const CacheFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class NetworkFailure extends Failure {
  final String message;
  const NetworkFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class NoDataFailure extends Failure {
  final String message;
  const NoDataFailure({required this.message});

  @override
  List<Object> get props => [message];
}
