import 'package:fresh_track/core/usecases/constants.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_remote_data_source.dart';
import '../datasources/login_local_data_source.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';
import 'package:injectable/injectable.dart';
import '../models/login_params.dart';
import '../models/login_model.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';


@LazySingleton(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final LoginLocalDataSource localDataSource;

  LoginRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, LoginModel>> getConcreteLogin(
      LoginParams params) async {
    if (networkLogic.isConnected) {
      try {
        LoginModel model = await remoteDataSource.getConcreteLogin(params);
        await localDataSource.cacheLogin(model);
        return Right(model);
      } on ServerException {
        return Left(ServerFailure(message: 'error_server'.tr));
      }
    } else {
      try {
        LoginModel model = localDataSource.getLastLogin();
        return Right(model);
      } on CacheException {
        logger.e("error_connection".tr);
        return Left(CacheFailure(message: "error_connection".tr));
      }
    }
  }
}
