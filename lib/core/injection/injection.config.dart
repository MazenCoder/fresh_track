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
import '../../features/login/domain/usecases/get_login.dart' as _i10;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i11;
import '../util/hive_utils.dart' as _i5;
import 'register_module.dart' as _i12; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i10.GetLogin>(() => _i10.GetLogin(get<_i8.LoginRepository>()));
  gh.factory<_i11.LoginBloc>(
      () => _i11.LoginBloc(getLogin: get<_i10.GetLogin>()));
  return get;
}

class _$RegisterModule extends _i12.RegisterModule {}
