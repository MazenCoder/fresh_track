import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../repositories/login_repository.dart';
import '../../data/models/login_params.dart';
import '../entities/login_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

@injectable
class GetLogin implements UseCase<LoginEntity, LoginParams> {
  final LoginRepository repository;

  GetLogin(this.repository);

  @override
  Future<Either<Failure, LoginEntity>> call(LoginParams params) async {
    return await repository.getConcreteLogin(params);
  }
}
