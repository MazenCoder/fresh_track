import '../../../../../core/error/exceptions.dart';
import '../../../../../core/usecases/constants.dart';
import '../models/login_params.dart';
import '../models/login_model.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'dart:convert';

abstract class LoginRemoteDataSource {
  /// Throws a [ServerException] for all error codes.
  Future<LoginModel> getConcreteLogin(LoginParams params);
}

@LazySingleton(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  Future<LoginModel> getConcreteLogin(LoginParams params) async {
    final response = await httpClient.post(
      headers: {"Content-Type": "application/json"},
      Uri.parse('$baseUrl/api/login'),
        // body: json.encode({
        //   "email": "eve.holt@reqres.in",
        //   "password": "cityslicka"
        // }),
        body: json.encode(params.toJson()),
    );
    if (response.statusCode == 200) {
      return LoginModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
