import '../../../../../core/error/failures.dart';
import '../../data/models/signup_params.dart';
import '../entities/signup_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SignUpRepository {
  Future<Either<Failure, SignUpEntity>> getConcreteSignUp(SignUpParams params);
}
