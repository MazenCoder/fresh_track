import '../../../../../core/error/failures.dart';
import '../../data/models/login_params.dart';
import '../entities/login_entity.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginEntity>> getConcreteLogin(LoginParams params);
}
