import '../../../../../core/error/exceptions.dart';
import '../../../../../core/usecases/boxes.dart';
import '../models/signup_model.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

abstract class SignUpLocalDataSource {
  SignUpModel getLastSignUp();
  Future<void> cacheSignUp(SignUpModel model);
}

const cached_signup = 'cached_signup';

@LazySingleton(as: SignUpLocalDataSource)
class SignUpLocalDataSourceImpl implements SignUpLocalDataSource {
  final box = Boxes.boxLoginInfo();

  @override
  SignUpModel getLastSignUp() {
    final jsonString = box.get(cached_signup);
    if (jsonString != null) {
      return SignUpModel.fromJson(json.decode(jsonString));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheSignUp(SignUpModel model) async {
    return await box.put(
      cached_signup,
      json.encode(model.toJson()),
    );
  }
}
