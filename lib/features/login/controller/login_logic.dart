import 'dart:convert';
import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';
import '../../../core/usecases/constants.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/usecases/boxes.dart';
import '../../../core/usecases/keys.dart';
import '../models/login_params.dart';
import '../models/login_model.dart';
import 'package:get/get.dart';



class LoginLogic extends GetxController {
  static LoginLogic instance = Get.find();

  Future<LoginModel> getConcreteLogin(LoginParams params) async {
    final response = await httpClient.post(
      headers: {"Content-Type": "application/json"},
      Uri.parse('$baseUrl/api/login'),
      body: json.encode(params.toJson()),
    );
    if (response.statusCode == 200) {
      return LoginModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }


  LoginModel getLastLogin() {
    final box = Boxes.boxLoginInfo();
    final jsonString = box.get(Keys.loginCached);
    if (jsonString != null) {
      return LoginModel.fromJson(json.decode(jsonString));
    } else {
      throw CacheException();
    }
  }


  Future<void> cacheLogin(LoginModel model) async {
    final box = Boxes.boxLoginInfo();
    return await box.put(
      Keys.loginCached,
      json.encode(model.toJson()),
    );
  }

  Future<Either<Failure, LoginModel>> lgoin(LoginParams params) async {
    if (networkLogic.isConnected) {
      try {
        LoginModel model = await getConcreteLogin(params);
        await cacheLogin(model);
        return Right(model);
      } on ServerException {
        return Left(ServerFailure(message: 'error_server'.tr));
      }
    } else {
      try {
        LoginModel model = getLastLogin();
        return Right(model);
      } on CacheException {
        logger.e("error_connection".tr);
        return Left(CacheFailure(message: "error_connection".tr));
      }
    }
  }

}