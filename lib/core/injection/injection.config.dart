// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i4;

import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/login/presentation/bloc/login_bloc.dart' as _i6;
import '../util/hive_utils.dart' as _i5;
import 'register_module.dart' as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Client>(() => registerModule.httpClient);
  gh.lazySingletonAsync<_i4.Directory>(() => registerModule.directory);
  gh.lazySingleton<_i5.HiveUtils>(() => _i5.HiveUtils());
  gh.factory<_i6.LoginBloc>(() => _i6.LoginBloc());
  return get;
}

class _$RegisterModule extends _i7.RegisterModule {}
