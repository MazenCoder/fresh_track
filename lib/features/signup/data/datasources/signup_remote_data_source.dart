import '../../../../../core/error/exceptions.dart';
import '../../../../../core/usecases/constants.dart';
import '../models/signup_params.dart';
import '../models/signup_model.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

abstract class SignUpRemoteDataSource {
  /// Throws a [ServerException] for all error codes.
  Future<SignUpModel> getConcreteSignUp(SignUpParams params);
}

@LazySingleton(as: SignUpRemoteDataSource)
class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSource {
  @override
  Future<SignUpModel> getConcreteSignUp(SignUpParams params) async {
    final response = await httpClient.get(Uri.parse('link'));
    if (response.statusCode == 200) {
      return SignUpModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
