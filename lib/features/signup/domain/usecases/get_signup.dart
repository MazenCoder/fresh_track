import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../repositories/signup_repository.dart';
import '../../data/models/signup_params.dart';
import '../entities/signup_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@injectable
class GetSignUp implements UseCase<SignUpEntity, SignUpParams> {
  final SignUpRepository repository;

  GetSignUp(this.repository);

  @override
  Future<Either<Failure, SignUpEntity>> call(SignUpParams params) async {
    return await repository.getConcreteSignUp(params);
  }
}
