import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class SignUpEntity extends Equatable {
  final String id;

  SignUpEntity({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}