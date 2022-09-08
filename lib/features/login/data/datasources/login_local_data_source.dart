import '../../../../../core/error/exceptions.dart';
import '../../../../../core/usecases/boxes.dart';
import '../models/login_model.dart';
import 'package:injectable/injectable.dart';
import 'dart:convert';

abstract class LoginLocalDataSource {
  LoginModel getLastLogin();
  Future<void> cacheLogin(LoginModel model);
}

const cached_login = 'cached_login';

@LazySingleton(as: LoginLocalDataSource)
class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final box = Boxes.boxLoginInfo();

  @override
  LoginModel getLastLogin() {
    final jsonString = box.get(cached_login);
    if (jsonString != null) {
      return LoginModel.fromJson(json.decode(jsonString));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheLogin(LoginModel model) async {
    return await box.put(
      cached_login,
      json.encode(model.toJson()),
    );
  }
}
