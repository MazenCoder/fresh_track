// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i4;

import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/login/data/datasources/login_local_data_source.dart'
    as _i6;
import '../../features/login/data/datasources/login_remote_data_source.dart'
    as _i7;
import '../../features/login/data/repositories/login_repository_impl.dart'
    as _i9;
import '../../features/login/domain/repositories/login_repository.dart' as _i8;
import '../../features/login/domain/usecases/get_login.dart' as _i14;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i16;
import '../../features/signup/data/datasources/signup_local_data_source.dart'
    as _i10;
import '../../features/signup/data/datasources/signup_remote_data_source.dart'
    as _i11;
import '../../features/signup/data/repositories/signup_repository_impl.dart'
    as _i13;
import '../../features/signup/domain/repositories/signup_repository.dart'
    as _i12;
import '../../features/signup/domain/usecases/get_signup.dart' as _i15;
import '../../features/signup/presentation/bloc/signup_bloc.dart' as _i17;
import '../util/hive_utils.dart' as _i5;
import 'register_module.dart' as _i18; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Client>(() => registerModule.httpClient);
  gh.lazySingletonAsync<_i4.Directory>(() => registerModule.directory);
  gh.lazySingleton<_i5.HiveUtils>(() => _i5.HiveUtils());
  gh.lazySingleton<_i6.LoginLocalDataSource>(
      () => _i6.LoginLocalDataSourceImpl());
  gh.lazySingleton<_i7.LoginRemoteDataSource>(
      () => _i7.LoginRemoteDataSourceImpl());
  gh.lazySingleton<_i8.LoginRepository>(() => _i9.LoginRepositoryImpl(
      remoteDataSource: get<_i7.LoginRemoteDataSource>(),
      localDataSource: get<_i6.LoginLocalDataSource>()));
  gh.lazySingleton<_i10.SignUpLocalDataSource>(
      () => _i10.SignUpLocalDataSourceImpl());
  gh.lazySingleton<_i11.SignUpRemoteDataSource>(
      () => _i11.SignUpRemoteDataSourceImpl());
  gh.lazySingleton<_i12.SignUpRepository>(() => _i13.SignUpRepositoryImpl(
      remoteDataSource: get<_i11.SignUpRemoteDataSource>(),
      localDataSource: get<_i10.SignUpLocalDataSource>()));
  gh.factory<_i14.GetLogin>(() => _i14.GetLogin(get<_i8.LoginRepository>()));
  gh.factory<_i15.GetSignUp>(
      () => _i15.GetSignUp(get<_i12.SignUpRepository>()));
  gh.factory<_i16.LoginBloc>(
      () => _i16.LoginBloc(getLogin: get<_i14.GetLogin>()));
  gh.factory<_i17.SignUpBloc>(
      () => _i17.SignUpBloc(getSignUp: get<_i15.GetSignUp>()));
  return get;
}

class _$RegisterModule extends _i18.RegisterModule {}
