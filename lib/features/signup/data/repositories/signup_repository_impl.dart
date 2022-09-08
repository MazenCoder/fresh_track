import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/constants.dart';
import '../../domain/repositories/signup_repository.dart';
import '../datasources/signup_remote_data_source.dart';
import '../datasources/signup_local_data_source.dart';
import '../models/signup_params.dart';
import '../models/signup_model.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

@LazySingleton(as: SignUpRepository)
class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpRemoteDataSource remoteDataSource;
  final SignUpLocalDataSource localDataSource;

  SignUpRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, SignUpModel>> getConcreteSignUp(
      SignUpParams params) async {
    if (networkLogic.isConnected) {
      try {
        SignUpModel model = await remoteDataSource.getConcreteSignUp(params);
        await localDataSource.cacheSignUp(model);
        return Right(model);
      } on ServerException {
        return Left(ServerFailure(message: 'error_server'.tr));
      }
    } else {
      try {
        SignUpModel model = localDataSource.getLastSignUp();
        return Right(model);
      } on CacheException {
        logger.e("error_connection".tr);
        return Left(CacheFailure(message: "error_connection".tr));
      }
    }
  }
}
